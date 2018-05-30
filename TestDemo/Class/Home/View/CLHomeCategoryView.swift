//
//  CLHomeCategoryView.swift
//  TestDemo
//
//  Created by fuyongYU on 2018/5/24.
//  Copyright © 2018年 YeMaoZi. All rights reserved.
//

import UIKit

fileprivate let homeCategoryCell = "CLHomeCategoryCell"

class CLHomeCategoryView: CLBaseView {
    
    var viewHeight:CGFloat = 50
    
    
    /// UICollectionViewFlowLayout
    fileprivate lazy var layout:UICollectionViewFlowLayout = {
        
        let lay = UICollectionViewFlowLayout()
        lay.minimumLineSpacing = 0
        lay.minimumInteritemSpacing = 0
        lay.scrollDirection = .horizontal
        lay.itemSize = CGSize(width: CLSCREE_WIDYH - 2 * KScaleWidth(width: 8.5), height: viewHeight)
        
        return lay
    }()
    
    
    /// UICollectionView
    fileprivate lazy var collectionView:UICollectionView = { 
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.showsHorizontalScrollIndicator = false
        collection.bounces = false
        collection.backgroundColor = UIColor.white
        
        collection.delegate = self
        collection.dataSource = self
        
        collection.register(CLHomeCategoryCell.classForCoder(), forCellWithReuseIdentifier: homeCategoryCell)
        
        return collection
    }()
    
    
    override func setupUI() {
        super.setupUI()
        backgroundColor = UIColor.cl_randomColor()
        addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            
        }
        
    }
    
    
}

// MARK: - UICollectionViewDelegate,UICollectionViewDelegate
extension CLHomeCategoryView:UICollectionViewDelegate,UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: homeCategoryCell, for: indexPath) as! CLHomeCategoryCell
        
        
        
        return cell
    }
    
    //点击
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print(indexPath)
        
        
    }
    
    
    
    
    
}





