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
        
        let imageView = UIImageView(imageName: "ic_login_qq_normal")
        
        var image = UIImage(named: "ic_login_qq_normal")
        image?.cl_createCircleImage(color: UIColor.white, size: CGSize(width: KScaleHeight(height: 30), height: KScaleHeight(height: 30)), callBack: { (img) in
            imageView.image = img
            
        })
        imageView.layer.cornerRadius = KScaleHeight(height: 30)
        imageView.layer.masksToBounds = true
        
        return imageView
        
    }()
    
    
    /// 用户名
    fileprivate lazy var userNameLabel : UILabel = {
        let lable = UILabel(title: "夜猫子", textColor: UIColor.white, fontSize: 15, numOfLines: 1, alignment: .left)
        
        return lable
    }()
    
    /// 用户号
    fileprivate lazy var numLable : UILabel = {
        //251    139    130
        let numLabel = UILabel(title: "当前身份：个人身份", textColor: UIColor.cl_rgbColor(red: 251, green: 139, blue: 130), fontSize: 12, numOfLines: 1, alignment: .left)
        
        return numLabel
    }()
    
    /// 用户二维码
    fileprivate lazy var codeImageView : UIImageView = {
        let codeImageView = UIImageView(imageName: "next_gray")
        
        return codeImageView
    }()
    
    
    override func setupUI() {
        super.setupUI()
        
        addSubViews(subviews: [userImageView,userNameLabel,numLable,codeImageView])
        
        
        userImageView.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(KScaleWidth(width: 10))
            make.top.equalTo(self).offset(KScaleHeight(height: 20))
            make.size.equalTo(CGSize(width: KScaleHeight(height: 60), height: KScaleHeight(height: 60)));
        }
        
        userNameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(userImageView.snp.right).offset(KScaleWidth(width: 10))
            make.top.equalTo(userImageView).offset(KScaleHeight(height: 10))
        }
        
        numLable.snp.makeConstraints { (make) in
            make.left.equalTo(userNameLabel)
            make.top.equalTo(userNameLabel.snp.bottom).offset(KScaleHeight(height: 10))
        }
        
        codeImageView.snp.makeConstraints { (make) in
            make.centerY.equalTo(userImageView)
            make.right.equalTo(self).offset(-KScaleWidth(width: 10))
        }
        
        
    }

}


