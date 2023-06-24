import psutil
from libqtile.widget.base import ThreadPoolText


class BatteryText(ThreadPoolText):
    defaults = [
        (
            "update_interval",
            600,
            "Update interval in seconds, if none, the "
            "widget updates whenever it's done'.",
        ),
    ]

    def __init__(self, update_interval: int = 600, **config):
        self.battery = psutil.sensors_battery()
        self.update_interval = update_interval
        super().__init__(str("  "), **config)

    def poll(self):
        self.battery = psutil.sensors_battery()

        if self.battery is None:
            return None

        if self.battery[2]:
            return f"󰂄  {int(self.battery[0])}% "
        else:
            if self.battery[0] <= 10:
                return f"󱃍  {int(self.battery[0])}% "
            elif self.battery[0] <= 20:
                return f"󰁻  {int(self.battery[0])}% "
            elif self.battery[0] <= 30:
                return f"󰁼  {int(self.battery[0])}% "
            elif self.battery[0] <= 40:
                return f"󰁽  {int(self.battery[0])}% "
            elif self.battery[0] <= 50:
                return f"󰁾 {int(self.battery[0])}% "
            elif self.battery[0] <= 60:
                return f"󰁿  {int(self.battery[0])}% "
            elif self.battery[0] <= 70:
                return f"󰂀  {int(self.battery[0])}% "
            elif self.battery[0] <= 80:
                return f"󰂁  {int(self.battery[0])}% "
            elif self.battery[0] <= 90:
                return f"󰂂  {int(self.battery[0])}% "
            else:
                return f"󰁹  {int(self.battery[0])}% "
