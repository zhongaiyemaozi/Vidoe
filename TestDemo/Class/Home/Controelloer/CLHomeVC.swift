//
//  CLHomeVC.swift
//  TestDemo
//
//  Created by fuyongYU on 2018/5/21.
//  Copyright © 2018年 fuyongYU. All rights reserved.
//

import UIKit
import CHTCollectionViewWaterfallLayout

fileprivate let templateListViewCell:String = "templateListViewCell"
fileprivate let collectionReusableView:String = "collectionReusableView"

class CLHomeVC: CLBaseVC {
    
    
    /// 全屏的collectionView
    fileprivate lazy var  templateListView:CLHomeCollectionView = {
        let contionView:CLHomeCollectionView = CLHomeCollectionView(frame: .zero, collectionViewLayout: flowLayout)
        
        contionView.backgroundColor = UIColor.groupTableViewBackground
        contionView.delegate = self
        contionView.dataSource = self
        
        //注册cell
        contionView.register(CLHomeTempLatesListCell.classForCoder(), forCellWithReuseIdentifier: templateListViewCell)
        //注册头部视图
        contionView.register(FRGWaterfallHeaderReusableView.classForCoder(), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: collectionReusableView)
        
        
        return contionView
    }()
    
    
    /// 流布局
    fileprivate lazy var flowLayout : FRGWaterfallCollectionViewLayout = {
        let layout = FRGWaterfallCollectionViewLayout()
        layout.delegate = self
        layout.bottomInset = 15
        layout.topInset = 15
        layout.stickyHeader = false
        
        layout.itemWidth = KScaleWidth(width: 168)
        
        return layout
    }()
    
    fileprivate lazy var homeTopView:CLHomeTopView = {
        let topView = CLHomeTopView(frame: CGRect(x: 0, y: 0, width: CLSCREE_WIDYH, height: KScaleHeight(height: 305)))
        
        
        
        return topView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func setupUI() {
        super.setupUI()
        
        view.addSubview(templateListView)
        
        templateListView.snp.makeConstraints { (make) in
            make.top.equalTo(view).offset(KScaleHeight(height: 0))
            make.left.right.equalTo(view)
            make.bottom.equalTo(view).offset(-KScaleHeight(height: 5))
        }
        
        
        
        
    }
    
    
}

// MARK: - UICollectionViewDelegate,UICollectionViewDataSource
extension CLHomeVC:UICollectionViewDelegate,UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: templateListViewCell, for: indexPath) as! CLHomeTempLatesListCell
        
        
        
        return cell
    }
    
    //返回头部视图
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        
        if kind == UICollectionElementKindSectionHeader {
            let header:FRGWaterfallHeaderReusableView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: collectionReusableView, for: indexPath) as! FRGWaterfallHeaderReusableView
            
            header.addSubview(homeTopView)
            
            return header
        }else {
            
            return FRGWaterfallHeaderReusableView()
        }
        
    }
    
    //返回头部视图上面的高度
    func collectionView(_ collectionView: UICollectionView!, layout collectionViewLayout: FRGWaterfallCollectionViewLayout!, heightForHeaderAt indexPath: IndexPath!) -> CGFloat {
        if indexPath.section == 0 {
            return KScaleHeight(height: 315)
        }else {
            return 0
        }
        
    }
    
    
    //点击
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        Log.w(indexPath)
    }
    
    
}


extension CLHomeVC:FRGWaterfallCollectionViewDelegate {
    //返回layout的高度
    func collectionView(_ collectionView: UICollectionView!, layout collectionViewLayout: FRGWaterfallCollectionViewLayout!, heightForItemAt indexPath: IndexPath!) -> CGFloat {
        
        
        return KScaleHeight(height: 100)
        
    }
    
    
}








