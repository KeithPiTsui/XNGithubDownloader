//
//  String+Substring.swift
//  Clipy
//
//  Created by xuneng
//  Copyright © 2016年 Shunsuke Furubayashi. All rights reserved.
//

import Foundation

extension String {
    subscript (range: CountableClosedRange<Int>) -> String {
        let startIndex = self.characters.index(self.startIndex, offsetBy: range.lowerBound, limitedBy:  self.endIndex) ?? self.startIndex
        let endIndex = self.characters.index(self.startIndex, offsetBy: range.upperBound, limitedBy: self.endIndex) ?? self.endIndex

        return self[startIndex..<endIndex]
    }
}
