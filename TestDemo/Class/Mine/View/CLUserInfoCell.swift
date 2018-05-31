//
//  CLUserInfoCell.swift
//  TestDemo
//
//  Created by fuyongYU on 2018/5/31.
//  Copyright © 2018年 YeMaoZi. All rights reserved.
//

import UIKit

class CLUserInfoCell: CLBaseTableViewCell {

    lazy var leftLabel:UILabel = {
        let label = UILabel(title: "昵称", textColor: UIColor.darkGray, fontSize: 14, numOfLines: 1, alignment: .left)
        
        return label
    }()
    
    lazy var rightLable:UILabel = {
        
        let label = UILabel(title: "夜猫子", textColor: UIColor.black, fontSize: 14, numOfLines: 1, alignment: .right)
        
        
        return label
        
    }()
    
    
    override func setupUI() {
        super.setupUI()
        
        contentView.addSubViews(subviews: [leftLabel,rightLable])
        
        leftLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(contentView)
            make.left.equalTo(contentView).offset(KScaleWidth(width: 10))
        }
        
        rightLable.snp.makeConstraints { (make) in
            make.centerY.equalTo(leftLabel)
            make.right.equalTo(contentView).offset(-KScaleWidth(width: 10))
        }
        
        
    }
    
    
    
    
    
    
}
