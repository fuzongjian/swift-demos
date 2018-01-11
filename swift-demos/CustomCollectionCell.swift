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
        return imageView
    }()
}
