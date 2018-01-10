//
//  ViewController.swift
//  swift-demos
//
//  Created by 付宗建 on 2018/1/9.
//  Copyright © 2018年 youran. All rights reserved.
//

import UIKit

class ViewController: SuperViewController,UITableViewDataSource,UITableViewDelegate {
    let array: [String] = ["基础部分","控件","good"]
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
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

