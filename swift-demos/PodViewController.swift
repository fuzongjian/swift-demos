//
//  PodViewController.swift
//  swift-demos
//
//  Created by 付宗建 on 2018/1/16.
//  Copyright © 2018年 youran. All rights reserved.
//

import UIKit

class PodViewController: SuperViewController,UITableViewDelegate,UITableViewDataSource {
    let dataArray :[String] = ["Alamofire(网络请求库)"]
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
            method_alamofire()
        default:
            print("default")
        }
    }
    func method_alamofire() {
        let dic = [String: String]()
        request(path: PATH_GET, type: .get, parameters: dic) { (result, status) in
            if status == true{
                
                
            }
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
