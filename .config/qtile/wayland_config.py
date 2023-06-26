from libqtile.backend.wayland import InputConfig

wl_input_rules = {
    "2:14:ETPS/2 Elantech Touchpad": InputConfig(
        click_method="clickfinger", tap=True, tap_button_map="lrm", natural_scroll=True
    ),
}
