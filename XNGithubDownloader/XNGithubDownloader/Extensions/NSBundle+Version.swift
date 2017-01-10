//
//  NSBundle+Version.swift
//  Clipy
//
//  Created by xuneng
//  Copyright © 2016年 Shunsuke Furubayashi. All rights reserved.
//

import Foundation

extension Bundle {
    var appVersion: String? {
        return infoDictionary?["CFBundleShortVersionString"] as? String
    }
}
