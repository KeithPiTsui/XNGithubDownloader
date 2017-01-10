//
//  NSLock+Clipy.swift
//  Clipy
//
//  Created by xuneng
//  Copyright © 2016年 Shunsuke Furubayashi. All rights reserved.
//

import Foundation

extension NSRecursiveLock {
    public convenience init(name: String) {
        self.init()
        self.name = name
    }
}
