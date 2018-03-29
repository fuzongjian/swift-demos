//
//  CollectionController.swift
//  swift-demos
//
//  Created by 付宗建 on 2018/1/11.
//  Copyright © 2018年 youran. All rights reserved.
//

import UIKit

class CollectionController: SuperViewController,UICollectionViewDelegate,UICollectionViewDataSource {
   let cellID = "content_cell_id"
    override func viewDidLoad() {
        super.viewDidLoad()
        setCustomTitle(title: "UICollectionView")
        self.view.backgroundColor = UIColor.white
        configUI()
    }
    func configUI() {
        let layout = UICollectionViewFlowLayout()
        // 滚动方向
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize.init(width: (SCREEN_WIDTH-30)*0.5, height: 80)
        // 设置collectionview
        let frame = CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT)
        let collectionView = UICollectionView(frame: frame,collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CustomCollectionCell.self, forCellWithReuseIdentifier: cellID)
        self.view.addSubview(collectionView)
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! CustomCollectionCell
        cell.I_label.text = "我是第\(indexPath.row+1)个标题"
        let r = CGFloat(arc4random()%255),g = CGFloat(arc4random()%255),b = CGFloat(arc4random()%255)
        cell.I_imageView.backgroundColor = rgb(r: r, g: g, b: b)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("click === \(indexPath.row)")
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
