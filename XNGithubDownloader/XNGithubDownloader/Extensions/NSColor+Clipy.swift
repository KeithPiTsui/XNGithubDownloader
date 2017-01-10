//
//  NSColor+Clipy.swift
//  Clipy
//
//  Created by xuneng
//  Copyright © 2016年 Shunsuke Furubayashi. All rights reserved.
//

import Foundation
import Cocoa

extension NSColor {
    static func clipyColor() -> NSColor {
        return NSColor(red: 0.164, green: 0.517, blue: 0.823, alpha: 1)
    }

    static func titleColor() -> NSColor {
        return NSColor(white: 0.266, alpha: 1)
    }

    static func tabTitleColor() -> NSColor {
        return NSColor(white:0.6, alpha: 1)
    }
}
