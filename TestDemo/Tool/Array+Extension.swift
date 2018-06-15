//
//  CLArray+Extension.swift
//  TestDemo
//
//  Created by fuyongYU on 2018/5/28.
//  Copyright © 2018年 YeMaoZi. All rights reserved.
//

import UIKit

extension Array where Element: NSObject {
    mutating func remove(object: Element) {
        if let index = index(of: object) {
            remove(at: index)
        }
    }
}

