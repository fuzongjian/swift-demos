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
        threadMethod()
        synchronizeMethod()
        // Do any additional setup after loading the view.
    }
    func configUI() -> Void {
        setCustomTitle(title: "多线程")
    }
    /*     NSThread
     *      自己管理线程的生命周期和线程同步
     */
    func threadMethod() -> Void {
        // 类方法
        Thread.detachNewThreadSelector(#selector(threadRun), toTarget: self, with: nil)
        // 实例方法
        let thread = Thread(target: self, selector: #selector(ThreadController.threadRun), object: nil)
        thread.name = "fuzongjian"
        thread.start()
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
