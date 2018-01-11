//
//  CollectionController.swift
//  swift-demos
//
//  Created by 付宗建 on 2018/1/11.
//  Copyright © 2018年 youran. All rights reserved.
//

import UIKit

class CollectionController: SuperViewController {
    let collectionView = UICollectionView()
    override func viewDidLoad() {
        super.viewDidLoad()
        setCustomTitle(title: "UICollectionView")
        self.view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
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
