//
//  PodViewController.swift
//  swift-demos
//
//  Created by 付宗建 on 2018/1/16.
//  Copyright © 2018年 youran. All rights reserved.
//

import UIKit

class PodViewController: SuperViewController,UITableViewDelegate,UITableViewDataSource {
    let dataArray :[String] = ["Alamofire(网络请求库)","RxSwift","SnapKit"]
    override func viewDidLoad() {
        super.viewDidLoad()
        setCustomTitle(title: "三方库的使用")
        let tableView = UITableView(frame: self.view.bounds ,style: UITableViewStyle.plain)
        self.view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        // Do any additional setup after loading the view.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = self.dataArray[indexPath.row]
        cell.textLabel?.textAlignment = .center
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
//            method_alamofire()
              getMethod()
        case 1:
            print("RxSwift")
        case 2:
            self.navigationController?.pushViewController(SnapKitController(), animated: true)
        default:
            print("default")
        }
    }
    func method_alamofire() {
        var dic = [String: Any]()
        dic["name"] = "移动端"
        dic["des"] = "主要用原生语言开发移动端"
        print(dic)
        request(path: PATH_POST, type: .post, parameters: dic) { (result,jsonDic, status) in
            if status == true {
                print(result)
            }
        }
    }
    func getMethod() {
        // 第一种方法比较繁琐
        //        request(path: PATH_GET, type: .get, parameters: dic) { (result, status) in
        //            if status == true{
        //                guard let json = result as? [String: AnyObject] else{
        //                    return
        //                }
        //                guard let array = json["data"] as? [AnyObject] else{
        //                    return
        //                }
        //                for obj in array {
        //                    guard let objson = obj as? [String:String] else{
        //                        return
        //                    }
        //                    print(objson["name"]!)
        //                }
        //
        //            }
        //        }

        // get 方法
        MBProgressHUD.showAdded(to: self.view, animated: true)
        request(path: PATH_GET, type: .get) { (json, jsonDic, status) in
            MBProgressHUD.hide(for: self.view, animated: true)
            if status == true {
//                print(json["status"].boolValue)
//                print(json["data"].arrayValue[0]["name"].stringValue)
//                print(json["msg"].boolValue)
                
            }
            print(json.dictionaryObject!)
        }
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
