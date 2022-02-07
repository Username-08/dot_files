import alsaaudio
from libqtile.widget.base import ThreadPoolText


class VolumeText(ThreadPoolText):
    defaults = [
        (
            "update_interval",
            600,
            "Update interval in seconds, if none, the "
            "widget updates whenever it's done'.",
        ),
    ]

    def __init__(self, update_interval: int = 600, **config):
        self.client = alsaaudio.Mixer()
        self.volume = self.client.getvolume()
        self.update_interval = update_interval
        super().__init__(str(self.volume), **config)

    def poll(self):
        self.client = alsaaudio.Mixer()
        self.volume = self.client.getvolume()

        if self.volume[0] <= 10:
            return f"婢"
        elif self.volume[0] <= 50:
            return f"奔"
        elif self.volume[0] >= 50:
            return f"墳"
