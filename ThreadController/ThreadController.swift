//
//  ThreadController.swift
//  swift-demos
//
//  Created by 付宗建 on 2018/4/8.
//  Copyright © 2018年 youran. All rights reserved.
//

import UIKit

class ThreadController: SuperViewController {
    // 定义两个线程
    var thread1: Thread?
    var thread2: Thread?
    //定义两个线程条件，用于锁住线程
    let condition1 = NSCondition()
    let condition2 = NSCondition()
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        /*      OperationQueue与GCD的区别
         *      1、GCD是纯C语言的API，OperationQueue是基于GCD的OC版本封装
         *      2、GCD只支持FIFO的队列，OperationQueue可以很方便地调整执行顺序、设置最大并发量
         *      3、OperationQueue可以很轻松的在Operation间设置依赖关系，而GCD需要更多的代码
         *      4、OperationQueue支持KVO，可以检测operation是否在执行、结束、取消
         *      5、GCD的执行速率比OperationQueue更快
         */
        // Do any additional setup after loading the view.
    }
    func configUI() -> Void {
        setCustomTitle(title: "多线程")
        let thread = UIButton(type: .system)
        thread.setTitle("Thread", for: .normal)
        let queue = UIButton(type: .system)
        queue.setTitle("Queue", for: .normal)
        let gcd = UIButton(type: .system)
        gcd.setTitle("GCD", for: .normal)
        view.addSubview(thread)
        view.addSubview(queue)
        view.addSubview(gcd)
        thread.snp.makeConstraints { (make) in
            make.top.equalTo(100)
            make.width.equalTo(100)
            make.height.equalTo(40)
            make.centerX.equalToSuperview()
        }
        thread.addTarget(self, action: #selector(thread_method(_:)), for: .touchUpInside)
        queue.snp.makeConstraints { (make) in
            make.top.equalTo(thread.snp.bottom).offset(20)
            make.width.height.equalTo(thread)
            make.centerX.equalTo(thread)
        }
        queue.addTarget(self, action: #selector(queue_method(_:)), for: .touchUpInside)
        gcd.snp.makeConstraints { (make) in
            make.top.equalTo(queue.snp.bottom).offset(20)
            make.size.equalTo(thread)
            make.centerX.equalTo(thread)
        }
        gcd.addTarget(self, action: #selector(gcd_method(_:)), for: .touchUpInside)
    }
    /*   GCD（Grand Central Dispatch）的特性
     *  1、可用于多核的并行运算
     *  2、自动利用更多的CPU内核
     *  3、自动管理线程的生命周期（创建、调度、销毁）
     *   -------   内部实现   --------
     *  1、iOS和OS X的核心是XNU内核，GCD是基于CNU内核实现
     *  2、GCD的API全部在libdispatch库中
     *  3、GCD的底层实现主要有Dispatch Queue（管理block）和Dispatch Source（处理事件）
     */
    @objc func gcd_method(_ sender: UIButton) -> Void {
        //        group_method()
        //        after_method()
        //        add_method()
        //        create_method()
        //        barrier_method()
        semaphore_method()
    }
    func semaphore_method() -> Void {
        let semaphore = DispatchSemaphore(value: 1)
        DispatchQueue.global(qos: .default).async {
            for i in 0...10{
                // 获取当前信号量 信号量减1  为负数阻碍当前线程
                semaphore.wait()
                DispatchQueue.global(qos: .default).asyncAfter(deadline: .now()+5, execute: {
                    Klog("每隔5秒---\(i)")
                    semaphore.signal()
                })
                
            }
        }
        
    }
    /*  barrier栅栏
     *  barrier的加入会等到在它加入队列之前的任务执行完毕后，才会执行。
     *  同时在它之后的任务，需要等到这个任务执行完毕后才开始进行
     *  注意： 这里的任务必须都是通过 DispatchWorkItem 来创建
     */
    func barrier_method() -> Void {
        let queue = DispatchQueue(label: "queue",attributes: .concurrent)
        let first = DispatchWorkItem {
            for i in 0...10{
                Klog("first ---\(i)")
            }
        }
        queue.async(execute: first)
        queue.async {
            Klog("hello queue")
        }
        let barrierWorkItem = DispatchWorkItem(flags: .barrier) {
            for i in 0...10{
                Klog("second ---\(i)")
            }
        }
        queue.async(execute: barrierWorkItem)
        let last = DispatchWorkItem {
            Klog("barrier执行完毕")
        }
        queue.async(execute: last)
        Klog("测试是否并发")
    }
    func create_method() -> Void {
        /* 1、自己创建队列 */
        // 创建串行队列
        let serial = DispatchQueue(label: "serial_queue")
        serial.async {
            for i in 0...10{
                Klog("串行队列1---\(i)")
            }
        }
        serial.async {
            Klog("串行队列2")
        }
        // 创建并行队列
        let concurrent = DispatchQueue(label: "concurrent_queue", qos: .default, attributes: .concurrent, autoreleaseFrequency: .inherit, target: nil)
        concurrent.async {
            for i in 0...10{
                Klog("并行队列1---\(i)")
            }
            
        }
        concurrent.async {
            Klog("并行队列2")
        }
        /* 2、 获取系统存在的全局队列 */
        /* 3、 运行在主线程的Main Dispatch Queue */
    }
    func add_method() -> Void {
        
        DispatchQueue.global(qos: .default).async {
            Klog("处理耗时的任务")
            // 处理完成之后，调用主线程来刷新界面
            DispatchQueue.main.async {
                Klog("刷新UI")
            }
        }
        
        DispatchQueue.global(qos: .default).sync {
            Klog("串行不会造成死锁")
            // 执行到这的话  程序直接卡死
            DispatchQueue.main.sync {
                Klog("串行主队列会造成死锁")
            }
        }
        Klog("串行终于执行完了")
        
    }
    /*
     *  asyncAfter并不是在指定时间后执行任务处理，而是在指定时间后把任务追加到queue里面
     */
    func after_method() -> Void {
        DispatchQueue.global(qos: .default).asyncAfter(deadline: .now()+2.0) {
            Klog("延迟2s调用")
        }
        // 如果需要取消当前正在执行的block操作，可以先将这个block封装到DispatchWorkItem对象中，然后cancle
        let task = DispatchWorkItem {
            Klog("取消任务")
        }
        DispatchQueue.global(qos: .default).asyncAfter(deadline: .now()+2.0, execute: task)
        // 任务取消
        task.cancel()
    }
    /*  async(group:) 用来监视一组block对象的完成
     *  notity()      用来汇总结果，所有任务结束汇总，不足塞当前线程
     *  wait()        等待知道所有任务执行结束，中途不能取消，阻塞当前线程
     */
    func group_method() -> Void {
        // 获取系统存在的全局队列
        let queue = DispatchQueue.global(qos: .default)
        // 定义一个group
        let group = DispatchGroup()
        // 并发任务
        queue.async(group: group){
            Klog("group---1")
        }
        queue.async(group: group) {
            Klog("group---2")
        }
        queue.async(group: group) {
            Klog("group---3")
        }
        /*
         *  下面有两种情况，区别在于是否阻塞当前线程
         */
        // 1、所有任务执行结束汇总，不阻塞当前线程
        //        group.notify(queue: .global()) {
        //            Klog("group---finish")
        //        }
        // 2、永久等待、直到所有任务执行结束，中途不能取消，阻塞当前线程  可以设置阻塞时间
        group.wait(timeout: .distantFuture)
        Klog("检测是否阻塞当前线程")
        
        // 暂停一个队列
        // queue.suspend()
        // 继续一个队列
        // queue.resume()
    }
    @objc func queue_method(_ sender: UIButton) -> Void {
        operation_queue()
    }
    /*   OperationQueue   BlockOperation
     *   A->B->C
     */
    func operation_queue() -> Void {
        let queue = OperationQueue()
        let a = BlockOperation {
            Klog("a---a\(Thread.current)")
            DispatchQueue.main.async {
                Klog(Thread.current)
            }
        }
        // 可以给每个任务结束之后的回调
        a.completionBlock = { () -> Void in
            Klog("operation finished")
        }
        // 是否在执行       是否完成        是否取消
        // a.isExecuting  a.isFinished  a.isCancelled
        let b = BlockOperation {
            Klog("b---b\(Thread.current)")
        }
        let c = BlockOperation {
            Klog("c---c\(Thread.current)")
        }
        // 添加依赖
        b.addDependency(a) // 如果不添加这条，a与b先后不分
        c.addDependency(a)
        c.addDependency(b)
        // 执行操作
        queue.addOperation(a)
        queue.addOperation(b)
        queue.addOperation(c)
        
        // 设置并发数 默认没有限制
        queue.maxConcurrentOperationCount = 5
        
        // 取消所有线程操作
        //queue.cancelAllOperations()
        
        
    }
    @objc func thread_method(_ sender: UIButton) -> Void {
        threadMethod()
        synchronizeMethod()
    }
    /*     NSThread
     *      自己管理线程的生命周期和线程同步
     */
    func threadMethod() -> Void {
        // 类方法，创建之后即调用
        Thread.detachNewThreadSelector(#selector(threadRun), toTarget: self, with: nil)
        // 实例方法
        if #available(iOS 10.0, *){
            let thread = Thread(block: {
                Klog(Thread.current)
            })
            thread.name = "ios10"
            thread.start()
        }else{
            let thread = Thread(target: self, selector: #selector(ThreadController.threadRun), object: nil)
            thread.name = "fuzongjian"
            thread.start()
        }
        
        
    }
    // 线程同步
    func synchronizeMethod() -> Void {
        thread1 = Thread(target: self, selector: #selector(ThreadController.treadMethod1), object: nil)
        thread2 = Thread(target: self, selector: #selector(ThreadController.threadMethod2), object: nil)
        thread1?.start()
    }
    @objc func treadMethod1() -> Void{
        for i in 0 ..< 10 {
            Klog("thread 1 running \(i)")
            if i == 2{
                thread2?.start()
                // 锁定
                condition1.lock()
                condition1.wait()
                condition1.unlock()
            }
        }
        Klog("thread 1 over")
        // 激活线程2
        condition2.signal()
    }
    @objc func threadMethod2() -> Void {
        for i in 0 ..< 10 {
            Klog("thread 2 running \(i)")
            if i == 2{
                // 激活线程1
                condition1.signal()
                // 锁定
                condition2.lock()
                condition2.wait()
                condition2.unlock()
            }
        }
        Klog("thread 2 over")
    }
    @objc func threadRun() -> Void {
        Klog(Thread.current)
    }
    deinit {
        Klog("dealloc")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

