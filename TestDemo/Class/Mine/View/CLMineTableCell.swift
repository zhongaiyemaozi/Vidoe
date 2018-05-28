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
        
        titleLable = UILabel(frame: .zero)
        
        contentView.addSubview(titleLable!)
        
        titleLable?.snp.makeConstraints({ (make) in
            make.center.equalTo(contentView)
        })
        
        
        
        
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
