//
//  CLMineTopView.swift
//  TestDemo
//
//  Created by fuyongYU on 2018/5/21.
//  Copyright © 2018年 fuyongYU. All rights reserved.
//

import UIKit

class CLMineTopView: CLBaseView {
    
    /// 用户头像
    fileprivate lazy var userImageView : UIImageView = {
        
        let imageView = UIImageView(frame: .zero)
        imageView.backgroundColor = UIColor.yellow
        return imageView
    }()
    
    
    /// 用户名
    fileprivate lazy var userNameLabel : UILabel = {
        let lable = UILabel(frame: .zero)
        
        return lable
    }()
    
    /// 用户号
    fileprivate lazy var numLable : UILabel = {
        let numLabel = UILabel(frame: .zero)
        
        return numLabel
    }()
    
    /// 用户二维码
    fileprivate lazy var codeImageView : UIImageView = {
        let codeImageView = UIImageView(frame: .zero)
        codeImageView.backgroundColor = UIColor.cl_randomColor()
        return codeImageView
    }()
    
    
    override func setupUI() {
        super.setupUI()
        
        addSubview(userImageView)
        addSubview(userNameLabel)
        addSubview(numLable)
        addSubview(codeImageView)
        
        
        
        
        
        
    }
    
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
