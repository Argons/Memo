### Python Tips:

----

默认情况下，Python用一个dict来存储对象实例的属性。这在一般情况下还不错，
而且非常灵活，乃至你在运行时可以随意设置新的属性。

但是，对一些在”编译”前就知道该有几个固定属性的小class来说，这个dict就有点浪费内存了。
而当你把这个小浪费乘上一百万，那可就大不同了。
在Python中，你可以在class中设置__slots__，它是一个包含这些固定的属性名的list。
这样Python就不会再使用dict，而且只分配这些属性的空间。

```python
class Image(object):
    __slots__ = ['id', 'caption', 'url']

    def __init__(self, id, caption, url):
        self.id = id
        self.caption = caption
        self.url = url
        self._setup()
```

**Warning**: 不要贸然进行这个优化，把它用在所有地方。这种做法不利于代码维护，
而且只有当你有数以千计的实例的时候才会有明显效果。

----
#### Multi-processing:

```python
from multiprocessing import Pool
from multiprocessing.dummy import Pool as ThreadPool

pool = ThreadPool(12)
pool.map(lambda l:l, list)
```

----
每个函数和方法消耗了多少时间，以及这些函数被调用了多少次，可以使用cProfile模块:
```bash
$ python -m cProfile -s cumulative timing_functions.py
```
OR 逐行检测CPU, memory消耗: line_profiler, memory__profiler

------

- use \*args when you’re not sure how many arguments might be passed to your function, 
i.e. it allows you pass an arbitrary number of arguments to your function;
- \*\***kwargs allows you to handle named arguments that you have not defined in advance.
- You can also use the \* and \*\* syntax when calling a function.

```python

```






-----
#### Python修饰器(decorator)：

多个decorator:
```python
@decorator_one
@decorator_two
def func():
    pass
```
相当于：
```python
func = decorator_one(decorator_two(func))
```
带参数的decorator：
```python
@decorator(arg1, arg2)
def func():
    pass
```
相当于：
```python
func = decorator(arg1,arg2)(func)
```

```python
from functools import wraps
def memo(fn):
    cache = {}
    miss = object()

    @wraps(fn)
    def wrapper(*args):
        result = cache.get(args, miss)
        if result is miss:
            result = fn(*args)
            cache[args] = result
        return result

    return wrapper

@memo
def fib(n):
    if n < 2:
    return n
    return fib(n - 1) + fib(n - 2)>
```


```python



