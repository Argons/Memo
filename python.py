
默认情况下，Python用一个dict来存储对象实例的属性。这在一般情况下还不错，
而且非常灵活，乃至你在运行时可以随意设置新的属性。

但是，对一些在”编译”前就知道该有几个固定属性的小class来说，这个dict就有点浪费内存了。
而当你把这个小浪费乘上一百万，那可就大不同了。
在Python中，你可以在class中设置__slots__，它是一个包含这些固定的属性名的list。
这样Python就不会再使用dict，而且只分配这些属性的空间。

e.g.
class Image(object):
    __slots__ = ['id', 'caption', 'url']

    def __init__(self, id, caption, url):
        self.id = id
        self.caption = caption
        self.url = url
        self._setup()

Warning: 不要贸然进行这个优化，把它用在所有地方。这种做法不利于代码维护，
而且只有当你有数以千计的实例的时候才会有明显效果。


from multiprocessing import Pool
from multiprocessing.dummy import Pool as ThreadPool

pool = ThreadPool(11)
pool.map(lambda l: pass, list)
