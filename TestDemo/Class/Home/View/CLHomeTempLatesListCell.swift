//
//  CLHomeTempLatesListCell.swift
//  TestDemo
//
//  Created by fuyongYU on 2018/5/23.
//  Copyright © 2018年 YeMaoZi. All rights reserved.
//

import UIKit

class CLHomeTempLatesListCell: CLBaseControllerCelll {
    
    
    override func setupUI() {
        super.setupUI()
        
        contentView.backgroundColor = UIColor.darkGray
        
        let centerLabel = UILabel(title: "夜猫子")
        centerLabel.backgroundColor = UIColor.white
        
        contentView.addSubview(centerLabel)
        centerLabel.snp.makeConstraints { (make) in
            make.center.equalTo(contentView)
        }
        
        contentView.layer.cornerRadius = 5
        contentView.layer.masksToBounds = true
        
    }
    
    
}
