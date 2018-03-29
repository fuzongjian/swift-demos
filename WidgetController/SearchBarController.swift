//
//  SearchBarController.swift
//  swift-demos
//
//  Created by 付宗建 on 2018/1/11.
//  Copyright © 2018年 youran. All rights reserved.
//

import UIKit

class SearchBarController: SuperViewController,UISearchBarDelegate {
    let searchBar = UISearchBar()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        setCustomTitle(title: "UISearchBar")
        searchBar.frame = CGRect.init(x: 0, y: 65, width: SCREEN_WIDTH, height: 40)
        searchBar.showsCancelButton = true
        self.view.addSubview(searchBar)
        searchBar.delegate = self
        
        
        // Do any additional setup after loading the view.
    }
    // 内容发生改变
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
    // 点击取消按钮
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    // 搜索按钮
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("点击了搜索按钮")
    }
    override func viewWillAppear(_ animated: Bool) {
//        self.navigationController?.navigationBar.isHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
//        self.navigationController?.navigationBar.isHidden = false
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
