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
    @objc func gcd_method(_ sender: UIButton) -> Void {
        
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
