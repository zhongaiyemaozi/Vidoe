//
//  CLMineTableCell.swift
//  TestDemo
//
//  Created by fuyongYU on 2018/5/21.
//  Copyright © 2018年 fuyongYU. All rights reserved.
//

import UIKit

class CLMineTableCell: CLBaseTableViewCell {
    
    /// titialeLabel
    var titleLable : UILabel?
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setupUI() {
        super.setupUI()
        //103    103    103
        titleLable = UILabel(title: "", textColor: UIColor.cl_rgbColor(red: 103, green: 103, blue: 103), fontSize: 14, numOfLines: 1, alignment: .left)
        
        contentView.addSubview(titleLable!)
        
        titleLable?.snp.makeConstraints({ (make) in
            make.centerY.equalTo(contentView)
            make.left.equalTo(contentView).offset(KScaleWidth(width: 10))
        })
        
        
        
        
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
