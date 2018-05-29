//
//  ImageExtension.swift
//  swift-demos
//
//  Created by 付宗建 on 2018/4/4.
//  Copyright © 2018年 youran. All rights reserved.
//

import UIKit
extension UIImage{
    func cornerImage(_ size: CGSize,radius: CGFloat,complete:@escaping((_ image: UIImage)-> ())) -> Void {
        DispatchQueue.global().async {
            // 开启上下文
            UIGraphicsBeginImageContextWithOptions(size, true, 0)
            
            let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
            
            UIBezierPath.init(roundedRect: rect, cornerRadius: radius).addClip()
            
            
            self.draw(in: rect)
            
            let resultImage = UIGraphicsGetImageFromCurrentImageContext()
            // 关闭上下文
            UIGraphicsEndImageContext()
            
            DispatchQueue.main.async {
                complete(resultImage!)
            }
        }
    }
}
extension UIImageView{
    
    func cornerBetter(_ radius: CGFloat) -> Void {
        Klog(self.bounds)
        let maskPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: .allCorners, cornerRadii: self.bounds.size)
        let maskLayer = CAShapeLayer()
        // 设置大小
        maskLayer.frame = self.bounds
        // 设置圆形样子
        maskLayer.path = maskPath.cgPath
        self.layer.mask = maskLayer
    }
    
}

