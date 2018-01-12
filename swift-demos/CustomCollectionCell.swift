//
//  CustomCollectionCell.swift
//  swift-demos
//
//  Created by 付宗建 on 2018/1/11.
//  Copyright © 2018年 youran. All rights reserved.
//

import UIKit

class CustomCollectionCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        I_imageView.frame = CGRect.init(x: 10, y: 0, width: frame.size.width-20, height: 60)
        I_label.frame = CGRect.init(x: 10, y: 60, width: frame.size.width-20, height: 20)
        self.contentView.backgroundColor = rgb(r: 230, g: 230, b: 230)
        self.contentView.addSubview(I_label)
        self.contentView.addSubview(I_imageView)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    var I_label: UILabel = {
        let itemLabel = UILabel()
        itemLabel.text = "标题"
        itemLabel.textAlignment = .center
        itemLabel.font = UIFont.systemFont(ofSize: 12)
        return itemLabel
    }()
    var I_imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.lightGray
        return imageView
    }()
}
