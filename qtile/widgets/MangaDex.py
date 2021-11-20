from libqtile.widget.base import ThreadPoolText
import MangaDexPy


class MangaDex(ThreadPoolText):
    defaults = [
        ("update_interval", 600, "Update interval in seconds, if none, the "
            "widget updates whenever it's done'."),
    ]  # type: List[Tuple[str, Any, str]]

    def __init__(self, update_interval: int = 600, **config):
        self.client = MangaDexPy.MangaDex()
        self.client.login('A_for_Ball', '2004#Yash')
        self.manga_list = []
        self.counter = 0
        self.update_interval = update_interval
        super().__init__(str(self.counter), **config)

    def poll(self):
        self.counter = 0
        if not self.client.check_session():
            self.client.login('A_for_Ball', '2004#Yash')
        self.manga_list = self.client.get_user_updates()
        for chapter in self.manga_list:
            if chapter.language == 'en':
                self.counter += 1
        return " " + str(self.counter)


# client = MangaDexPy.MangaDex()
# client.login('A_for_Ball', '2004#Yash')
# for chapter in client.get_user_updates():
#     if chapter.language == 'en':
#         print(client.get_manga(chapter.parent_manga).title, chapter.title)
