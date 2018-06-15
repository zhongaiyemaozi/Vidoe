//
//  CLLayer+Extention.swift
//  TestDemo
//
//  Created by fuyongYU on 2018/5/28.
//  Copyright © 2018年 YeMaoZi. All rights reserved.
//

import UIKit

extension CALayer {
    
    var shadowUIColor: UIColor? {
        get {
            if let cgColor = shadowColor {
                return UIColor(cgColor: cgColor)
            }
            return nil
        }
        set {
            shadowColor = newValue?.cgColor
        }
    }
    
    var borderUIColor: UIColor? {
        get {
            if let cgColor = borderColor {
                return UIColor(cgColor: cgColor)
            }
            return nil
        }
        set {
            borderColor = newValue?.cgColor
        }
    }
}



