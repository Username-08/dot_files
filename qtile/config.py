# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

from typing import List

import os.path
from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from widgets.volume_text import VolumeText
from widgets.battery_text import BatteryText

mod = "mod4"
terminal = "kitty"
home_dir = os.path.expanduser("~")

keys = [
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key(
        [mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"
    ),
    Key(
        [mod, "shift"],
        "l",
        lazy.layout.shuffle_right(),
        desc="Move window to the right",
    ),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key(
        [mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"
    ),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "control"], "r", lazy.restart(), desc="Restart Qtile"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "p", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
    # this is to launch rofi
    Key([mod], "r", lazy.spawn("rofi -show run"), desc="Launch rofi"),
    # to lock the screen
    Key([mod], "q", lazy.spawn("slock"), desc="lock the screen"),
    # to take screenshot
    Key(
        [mod, "shift"],
        "s",
        lazy.spawn(f"import -silent {home_dir}/ScreenShots/image.png"),
        desc="take screenshot",
    ),
    Key(
        [mod],
        "c",
        lazy.spawn(
            f"xclip -selection clipboard -t image/png -i {home_dir}/ScreenShots/image.png"
        ),
        desc="take screenshot",
    ),
    # to take fullscreen shot
    Key(
        [mod],
        "s",
        lazy.spawn(f"import -silent -window root {home_dir}/ScreenShots/image.png"),
        desc="take full screenshot of x-server",
    ),
    # to change wallpaper
    Key(
        [mod],
        "t",
        lazy.spawn(
            f"nitrogen --set-scaled {home_dir}/DotFiles/wallpapers/wallpaper.png"
        ),
        desc="change wallpaper",
    ),
    # Change the volume if our keyboard has keys
    Key([], "XF86AudioRaiseVolume", lazy.spawn("amixer -c 0 -q set Master 2dB+")),
    Key([], "XF86AudioLowerVolume", lazy.spawn("amixer -c 0 -q set Master 2dB-")),
    Key([], "XF86AudioMute", lazy.spawn("amixer set Master toggle")),
    # toggle floating mode for focused window
    Key([mod], "v", lazy.window.toggle_floating(), desc="Toggle floating"),
]

# groups = [Group(i, label="⬤") for i in "12345"]
groups = [
    Group("1", label=""),
    Group("2", label=""),
    Group("3", label=""),
    Group("4", label=""),
    Group("5", label=""),
]

for i in groups:
    keys.extend(
        [
            # mod1 + letter of group = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # mod1 + shift + letter of group = switch to & move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod1 + shift + letter of group = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )

layouts = [
    layout.Columns(
        margin=5,
        border_on_single=True,
        border_width=3,
        border_focus="#98971a",
        border_normal="504945",
    ),
    # layout.MonadTall(
    #     margin=5,
    #     border_width=3,
    #     border_focus='#98971a'),
    # layout.Max(border_on_single=True, border_width=3, border_focus='#98971a')
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(border_width=3, margin=5),
    # layout.Matrix(border_width=3,margin=5),
    # # layout.MonadTall(),
    # layout.MonadWide(margin=5),
    # layout.RatioTile(fancy=True, border_width=3, margin=5),
    # layout.Tile(border_width=3, margin=5),
    # layout.TreeTab(margin=5),
    # layout.VerticalTile(margin=5),
    # layout.Zoomy(margin=5),
]

colors = dict(
    red="#cc241d",
    blue="#458588",
    green="#98971a",
    purple="#b16286",
    yellow="#d79921",
    aqua="#6a8e5f",
    white="#d2b48c",
    black="#504945",
)

widget_defaults = dict(
    font="Ubuntu",
    fontsize=12,
    foreground="#d4be98",
    padding=0,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.TextBox("   "),
                widget.TextBox(
                    text="",
                    foreground=colors["black"],
                    # background=colors[0],
                    font="JetBrainsMono Nerd Font",
                    fontsize=21,
                    padding=0,
                ),
                widget.GroupBox(
                    block_highlight_text_color=colors["black"],
                    highlight_method="text",
                    this_current_screen_border=colors["yellow"],
                    active=colors["white"],
                    inactive=colors["white"],
                    highlight_color=colors["white"],
                    margin_y=3,
                    background=colors["black"],
                    font="JetBrainsMono",
                    fontsize=16,
                    spacing=10,
                ),
                widget.TextBox(
                    text="",
                    foreground=colors["black"],
                    # background=colors[0],
                    font="JetBrainsMono Nerd Font",
                    fontsize=21,
                    padding=0,
                ),
                # widget.TextBox("  "),
                # widget.WindowName(format="{name}", max_chars=100),
                widget.Spacer(),
                widget.TextBox(
                    text="",
                    foreground=colors["black"],
                    # background=colors[0],
                    font="JetBrainsMono Nerd Font",
                    fontsize=21,
                    padding=0,
                ),
                widget.TextBox(
                    " ",
                    fontsize=19,
                    background=colors["black"],
                    foreground=colors["white"],
                ),
                widget.Clock(
                    format="%H:%M:%S",
                    fontsize=16,
                    background=colors["black"],
                    foreground=colors["white"],
                ),
                widget.TextBox(
                    text="",
                    foreground=colors["black"],
                    # background=colors[0],
                    font="JetBrainsMono Nerd Font",
                    fontsize=21,
                    padding=0,
                ),
                widget.Spacer(),
                widget.TextBox("    "),
                widget.TextBox("    "),
                widget.TextBox(
                    text="",
                    foreground=colors["black"],
                    font="JetBrainsMono Nerd Font",
                    fontsize=21,
                    padding=0,
                ),
                widget.Systray(icon_size=21, background=colors["black"]),
                widget.TextBox(
                    text="",
                    foreground=colors["black"],
                    font="JetBrainsMono Nerd Font",
                    fontsize=21,
                    padding=0,
                ),
                widget.TextBox("    "),
                widget.TextBox(
                    text="",
                    foreground=colors["black"],
                    font="JetBrainsMono Nerd Font",
                    fontsize=21,
                    padding=0,
                ),
                widget.TextBox(
                    "",
                    background=colors["black"],
                    foreground=colors["blue"],
                    fontsize=24,
                ),
                widget.TextBox(
                    " ",
                    background=colors["black"],
                    foreground=colors["blue"],
                    fontsize=23,
                ),
                widget.Backlight(
                    brightness_file="/sys/class/backlight/intel_backlight/brightness",
                    max_brightness_file="/sys/class/backlight/intel_backlight/max_brightness",
                    background=colors["black"],
                    foreground=colors["blue"],
                ),
                widget.TextBox(
                    text="",
                    foreground=colors["black"],
                    font="JetBrainsMono Nerd Font",
                    fontsize=21,
                    padding=0,
                ),
                widget.TextBox("    "),
                widget.TextBox(
                    text="",
                    foreground=colors["black"],
                    font="JetBrainsMono Nerd Font",
                    fontsize=21,
                    padding=0,
                ),
                widget.TextBox(
                    " ",
                    fontsize=15,
                    background=colors["black"],
                    foreground=colors["green"],
                ),
                widget.Memory(
                    format="{MemUsed: .0f} MB",
                    background=colors["black"],
                    foreground=colors["green"],
                ),
                widget.TextBox(
                    text="",
                    foreground=colors["black"],
                    font="JetBrainsMono Nerd Font",
                    fontsize=21,
                    padding=0,
                ),
                widget.TextBox("    "),
                widget.TextBox(
                    text="",
                    foreground=colors["black"],
                    font="JetBrainsMono Nerd Font",
                    fontsize=21,
                    padding=0,
                ),
                VolumeText(
                    1,
                    background=colors["black"],
                    fontsize=19,
                    foreground=colors["yellow"],
                ),
                widget.Volume(background=colors["black"], foreground=colors["yellow"]),
                widget.TextBox(
                    text="",
                    foreground=colors["black"],
                    font="JetBrainsMono Nerd Font",
                    fontsize=21,
                    padding=0,
                ),
                widget.TextBox("    "),
                widget.TextBox(
                    text="",
                    foreground=colors["black"],
                    font="JetBrainsMono Nerd Font",
                    fontsize=21,
                    padding=0,
                ),
                BatteryText(
                    10,
                    background=colors["black"],
                    foreground=colors["aqua"],
                    fontsize=14,
                ),
                widget.TextBox(
                    text="",
                    foreground=colors["black"],
                    font="JetBrainsMono Nerd Font",
                    fontsize=21,
                    markup=False,
                    padding=0,
                ),
                widget.TextBox("   "),
            ],
            25,
            margin=[8, 0, 6, 0],
            opacity=0.9,
            background="#32302f",
        ),
        bottom=bar.Gap(4),
        left=bar.Gap(3),
        right=bar.Gap(3),
    ),
]

# Drag floating layouts.
mouse = [
    Drag(
        [mod],
        "Button1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position(),
    ),
    Drag(
        [mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()
    ),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None  # WARNING: this is deprecated and will be removed soon
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        # Match(wm_class='Thunar'),  # Thunar file browser
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
        Match(title="Tor Browser"),  # Tor-Browser
    ],
    border_focus="#98971a",
    border_normal="504945",
    border_width=3,
)
auto_fullscreen = True
focus_on_window_activation = "smart"

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "qtile"
