//
//  CLBaseControllerCelll.swift
//  TestDemo
//
//  Created by fuyongYU on 2018/5/23.
//  Copyright © 2018年 YeMaoZi. All rights reserved.
//

import UIKit

class CLBaseControllerCelll: UICollectionViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupUI() {
        
        
    }
    
    
    
}
