### **RunLoop**

- [参考文档1](https://www.jianshu.com/p/2d3c8e084205)
- [参考文档2](https://www.cnblogs.com/kenshincui/p/6823841.html)
- [参考文档3](https://www.jianshu.com/p/b9426458fcf6)
- **[参考文档4](http://www.cocoachina.com/ios/20150601/11970.html)**

`强烈推荐参考文档4`

##### **RunLoop基本作用**
```
1、保持程序持续运行，程序一旦启动就会开一个主线程，主线程一旦开起来就会跑一个主线程对应的RunLoop，RunLoop保证主线程不被销毁。
```
```
2、处理APP中各种的事件。（eg：触摸、定时器等）
```

```
3、节省CPU资源，提高程序性能;内部是通过do-while来实现
```

| `RunLoop内部运行原理` |
|:--------------:|
|![内部运行原理](/img/runloop-in.png)|


### **`注：`**
```
1、CFRunLoopRef是基于CoreFoundation框架内的，它提供纯C函数的API，所有这些API都是线程安全的。
```
```
2、NSRunLoop是基于CFRunLoopRef的封装，提供面向对象的API，但是这些API不是线程安全的
```

|Core Foundation中有RunLoop的五个类 |对应的解释|
|:----:|:----|
|CFRunLoopRef|获取当前RunLoop和主RunLoop|
|CFRunLoopModeRef|运行模式，只能选择一种，不同模式中做不同的操作|
|CFRunLoopSourceRef|事件源，输入源|
|CFRunLoopTimerRef|定时器时间|
|CFRunLoopObserverRef|观察者|

| 五个类的关系如下图 |解析|
|:---------------:|:----:|
|![关系](/img/runloop.png)|一个RunLoop包含若干Mode，每个Mode又包含若干个Source、Timer、Observer|

> **CFRunLoopSourceRef(Source有两个版本：Source0和Source1)**
  >> - Source0只包含了一个回调（函数指针），它并不能触发事件。使用时，你需要先调用CFRunLoopSourceSignal(source)，将这个 Source 标记为待处理，然后手动调用 CFRunLoopWakeUp(runloop) 来唤醒 RunLoop，让其处理这个事件

  >> - Source1 包含了一个 mach_port 和一个回调（函数指针），被用于通过内核和其他线程相互发送消息。这种 Source 能主动唤醒 RunLoop 的线程.

> **CFRunLoopTimerRef**
  >> - CFRunLoopTimerRef是基于时间的触发器，它和NSTimer是toll-free bridged的，可以混用

  >> - 其包含一个时间长度和一个回调（函数指针）

  >> - 当其加入到RunLoop时，RunLoop会注册对应的时间点，但时间点到时，RunLoop会被唤醒执行那个回调。

> **CFRunLoopObserverRef**
  >> - CFRunLoopObserverRef 是观察者，每个 Observer 都包含了一个回调（函数指针），当 RunLoop 的状态发生变化时，观察者就能通过回调接受到这个变化.
  ```
    typedef CF_OPTIONS(CFOptionFlags CFRunLoopActivity) {
       kCFRunLoopEntry         = (1UL << 0), // 即将进入Loop
       kCFRunLoopBeforeTimers  = (1UL << 1), // 即将处理 Timer
       kCFRunLoopBeforeSources = (1UL << 2), // 即将处理 Source
       kCFRunLoopBeforeWaiting = (1UL << 5), // 即将进入休眠
       kCFRunLoopAfterWaiting  = (1UL << 6), // 刚从休眠中唤醒
       kCFRunLoopExit          = (1UL << 7), // 即将退出Loop
     };
  ```

> ### 注意:
  >> - 上面的Source/Timer/Observer被统称为mode item，一个item可以被同时加入多个mode

  >> - 但是一个item被重复加入同一个mode时是不会有效果的

  >> - 如果一个mode中一个item都没有，则RunLoop会直接退出，不进入循环。



| RunLoop的内部逻辑 |
|:--------:|
|![内部逻辑](/img/runloop-main.png)|
|![文字描述](/img/runloop-des.png)|
