//
//  CommonManager.swift
//  swift-demos
//
//  Created by 付宗建 on 2018/3/22.
//  Copyright © 2018年 youran. All rights reserved.
//

import UIKit

class CommonManager: NSObject {
    static let shared = CommonManager()
    private override init() {}
    var name: String?
}
