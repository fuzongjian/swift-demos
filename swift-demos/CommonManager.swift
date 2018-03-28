//
//  CommonManager.swift
//  swift-demos
//
//  Created by 付宗建 on 2018/3/22.
//  Copyright © 2018年 youran. All rights reserved.
//

import UIKit

class CommonManager: NSObject {
    private static let shared = CommonManager()
    var name: String?
    private override init() {
        name = "fuzongjian"
    }
    // 提供类方法拿到对象
    class func defaultInstance() -> CommonManager {
        return shared
    }
}
