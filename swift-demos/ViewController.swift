//
//  ViewController.swift
//  swift-demos
//
//  Created by 付宗建 on 2018/1/9.
//  Copyright © 2018年 youran. All rights reserved.
//

import UIKit

class ViewController: SuperViewController,UITableViewDataSource,UITableViewDelegate {
    let array: [String] = [
        "基础部分","控件","三方库的使用","四种传值方式","核心动画高级技巧","Timer、RunLoop",
        "Swift-Block-OC","属性介绍","事件响应机制","KVO与KVC","高性能圆角",
        "多线程","TCP/IP、Socket","View的GetM"
                           ]
    override func viewDidLoad() {
        super.viewDidLoad()
        setCustomTitle(title: "Swift")
        let tableView = UITableView(frame: self.view.bounds ,style: UITableViewStyle.plain)
        self.view .addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = array[indexPath.row]
        cell.textLabel?.textAlignment = NSTextAlignment.center
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            self.navigationController?.pushViewController(BaseViewController(), animated: true)
        }else if indexPath.row == 1 {
            self.navigationController?.pushViewController(AdvanceViewController(), animated: true)
        }else if indexPath.row == 2{
            self.navigationController?.pushViewController(PodViewController(), animated: true)
        }else if indexPath.row == 3 {
            self.navigationController?.pushViewController(PassValueController(), animated: true)
        }else if indexPath.row == 4{
            self.navigationController?.pushViewController(AnimationController(), animated: true)
        }else if indexPath.row == 5{
            self.navigationController?.pushViewController(TimerViewController(), animated: true)
        }else if indexPath.row == 6{
            let blockController = SwiftBlockOcController()
            blockController.getValueBlock(block: { (value) in
                Klog(value)
            })
            self.navigationController?.pushViewController(blockController, animated: true)
        }else if indexPath.row == 7{
            self.navigationController?.pushViewController(PropertyController(), animated: true)
        }else if indexPath.row == 8{
            self.navigationController?.pushViewController(ResponseController(), animated: true)
        }else if indexPath.row == 9{
            self.navigationController?.pushViewController(KVOController(), animated: true)
        }else if indexPath.row == 10{
            self.navigationController?.pushViewController(CornerController(), animated: true)
        }else if indexPath.row == 11 {
            self.navigationController?.pushViewController(ThreadController(), animated: true)
        }else if indexPath.row == 12{
            
            self.navigationController?.pushViewController(TCPIPController(), animated: true)
            return
            
            //获取命名空间，在info.plist文件里就是Executable file
            let nameSpace = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String
            //拼接成固定格式
            let controller:AnyClass = NSClassFromString(nameSpace + "." + "CornerController")!
            //创建对象
            let viewController = (controller as! UIViewController.Type).init()
        }else if indexPath.row == 13{
            self.navigationController?.pushViewController(GetViewMController(), animated: true)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

