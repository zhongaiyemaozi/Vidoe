//
//  UIButton+Extensions.swift
//  WeiBo
//
//  Created by 夜猫子 on 2017/4/2.
//  Copyright © 2017年 夜猫子. All rights reserved.
//

import UIKit

extension UIButton {
    
    
    
    
    /// 遍历构造器(创建按钮可以添加点击事件)
    ///
    /// - Parameters:
    ///   - title: 按钮文字
    ///   - titleColor: 文字颜色
    ///   - fontSize: 文字大小
    ///   - image: 图片名字
    ///   - backImage: 背景图片名字
    ///   - target: target
    ///   - action: action
    ///   - event: UIControlEvents
    convenience init(title: String?,
                     titleColor: UIColor = UIColor.darkGray,
                     fontSize: CGFloat = 14,
                     image: String? = nil,
                     backImage: String? = nil,
                     target: AnyObject? = nil,
                     action: Selector? = nil,
                     event: UIControlEvents = .touchUpInside){
        self.init()
        
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: fontSize)
        //传了图片才设置
        if let image = image {
            
            setImage(UIImage(named: image), for: .normal)
            setImage(UIImage(named: "\(image)_selected"), for: .highlighted)
        }
        //传了图片才设置背景图片
        if let backImage = backImage {
            setBackgroundImage(UIImage(named: backImage), for: .normal)
            setBackgroundImage(UIImage(named: "\(backImage)_highlighted"), for: .highlighted)
        }
        //添加事件
        if let target = target, let action = action {
            addTarget(target, action: action, for: event)
        }
    }
    
    /// 便利构造器
    convenience init(normalTitle:String? ,
                     selTitle:String? = nil,
                     font:UIFont? = UIFont.systemFont(ofSize: 14),
                     normalColor:UIColor? = UIColor.lightGray,
                     normalImage:UIImage? = nil,
                     selImage:UIImage? = nil,
                     target:Any?  = nil,
                     action:Selector?  = nil,
                     event:UIControlEvents? = .touchUpInside ) {
        self.init()
        //设置文字
        setTitle(normalTitle, for: UIControlState.normal)
        setTitle(selTitle ?? normalTitle, for: UIControlState.selected)
        //设置图片
        setImage(normalImage, for: UIControlState.normal)
        setImage(selImage ?? normalImage, for: UIControlState.selected)
        //设置文字颜色
        setTitleColor(normalColor, for: UIControlState.normal)
        //设置响应事件
        if let target = target , let action = action {
            addTarget(target, action: action, for: event!)
        }
    }
    
    /// 设置背景照片,自定义
    func addBackgroundImage(normal:UIImage? = nil , selected:UIImage? = nil)  {
        if let normal = normal {
            setBackgroundImage(normal, for: UIControlState.normal)
        }
        if let selected = selected {
            setBackgroundImage(selected, for: UIControlState.selected)
        }
    }
    
    
    
    
 
}
