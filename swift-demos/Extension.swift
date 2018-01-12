//
//  Extension.swift
//  swift-demos
//
//  Created by 付宗建 on 2018/1/11.
//  Copyright © 2018年 youran. All rights reserved.
//

import Foundation
import UIKit
extension UIView{
    var size: CGSize { return self.bounds.size }
    var width: CGFloat { return self.bounds.size.width }
    var height: CGFloat { return self.bounds.size.height }
    var bottom : CGFloat { return self.frame.origin.y+self.frame.size.height }
}
func rgba(r: CGFloat,g: CGFloat,b: CGFloat,a: CGFloat) -> UIColor {
    return UIColor(red: r/225.0, green: g/225.0, blue: b/225.0, alpha: a)
}
func rgb(r: CGFloat,g: CGFloat,b: CGFloat) -> UIColor {
    return UIColor(red: r/225.0, green: g/225.0, blue: b/225.0, alpha: 1.0)  
}



public let SCREEN_WIDTH = UIScreen.main.bounds.size.width
public let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
