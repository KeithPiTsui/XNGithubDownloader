//
//  Array+Remove.swift
//  Clipy
//
//  Created by xuneng
//  Copyright © 2016年 Shunsuke Furubayashi. All rights reserved.
//

import Foundation

extension Array {
    mutating func removeObject<T: Equatable>(_ element: T) {
        self = filter { $0 as? T != element }
    }
}

extension Array {
    mutating func removeObjects<T: Equatable>(_ elements: [T]) {
        elements.forEach { removeObject($0) }
    }
}
