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
    
    /// 右边的cell图片
    lazy var cellButton:UIButton = {
        let lab = UIButton()
        
        lab.setImage(UIImage.init(named: "next_black"), for: .normal)
        lab.setImage(UIImage.init(named: "next_black"), for: .highlighted)
        
        lab.setTitle("", for: .normal)
        lab.setTitle("", for: .highlighted)
        
        lab.setTitleColor(UIColor.darkGray, for: .normal)
        lab.setTitleColor(UIColor.darkGray, for: .highlighted)
        
        lab.titleLabel?.font = UIFont.cl_PingFangSCThin(15)
        
        lab.isUserInteractionEnabled = false
        
        return lab
    }()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setupUI() {
        super.setupUI()
        //103    103    103
        titleLable = UILabel(title: "", textColor: UIColor.cl_rgbColor(red: 103, green: 103, blue: 103), fontSize: 14, numOfLines: 1, alignment: .left)
        
        contentView.addSubViews(subviews: [titleLable!,cellButton])
        
        titleLable?.snp.makeConstraints({ (make) in
            make.centerY.equalTo(contentView)
            make.left.equalTo(contentView).offset(KScaleWidth(width: 10))
        })
        
        cellButton.snp.makeConstraints { (make) in
            make.centerY.equalTo(titleLable!)
            make.right.equalTo(contentView).offset(-KScaleWidth(width: 10))
        }
        
        
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
