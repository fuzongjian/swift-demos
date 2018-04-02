//
//  TimerViewController.swift
//  swift-demos
//
//  Created by 付宗建 on 2018/3/30.
//  Copyright © 2018年 youran. All rights reserved.
//

import UIKit

class TimerViewController: SuperViewController,UITableViewDelegate,UITableViewDataSource {
    var timerCount: Int? = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        setCustomTitle(title: "定时器")
        Klog("hello timer")
        configUI()
    }
    func configUI() {
        let tableView = UITableView(frame: CGRect.init(x: 0, y: 0, width: 0, height: 0), style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.top.bottom.right.left.equalToSuperview()
        }
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { (timer) in
//             当开始滑动的时候，runloop的mode由原来的Default切换到Event Tracking模式
//             所以在原来的模式就会被关闭
//             方法   将timer加入到NSRunloopCommonModes中
            RunLoop.current.add(timer, forMode: .commonModes)
            self.startTimer()
        }
        

    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  1000
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID = "timer_cell_id"
        let cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
        cell.textLabel?.text = "第\(indexPath.row+1)个"
        return cell
    }
    @objc func startTimer()  {
        timerCount = timerCount!+1
        Klog(timerCount!)
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
