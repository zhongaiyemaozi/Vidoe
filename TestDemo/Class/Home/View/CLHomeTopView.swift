//
//  CLHomeTopView.swift
//  TestDemo
//
//  Created by fuyongYU on 2018/5/23.
//  Copyright © 2018年 YeMaoZi. All rights reserved.
//

import UIKit
import LLCycleScrollView

class CLHomeTopView: CLBaseView {
    
    /// 轮播图
    fileprivate lazy var bannerView:LLCycleScrollView = {
        let banner = LLCycleScrollView.llCycleScrollViewWithFrame(CGRect(x: 0, y: 0, width: CLSCREE_WIDYH, height: KScaleHeight(height: 195)))
        //是否自动滚动
        banner.autoScroll = true
        //是否无线循环
        banner.infiniteLoop = true
        //滚动间隔时间
        banner.autoScrollTimeInterval = 3.0
        //等待数据状态显示的展位图
        banner.placeHolderImage = UIImage(named: "LaunchImageX")
        //如果没有数据的使用，使用封面图
        banner.coverImage = UIImage(named: "LaunchImageX")
        //设置当前PageControl的样式
        banner.customPageControlStyle = .snake
        // 非.system的状态下，设置PageControl的tintColor
        banner.customPageControlInActiveTintColor = UIColor.darkGray
        // 设置.system系统的UIPageControl当前显示的颜色
        banner.pageControlCurrentPageColor = UIColor.white
        // 非.system的状态下，设置PageControl的间距(默认为8.0)
        banner.customPageControlIndicatorPadding = 8.0
        // 设置PageControl的位置 (.left, .right 默认为.center)
        banner.pageControlPosition = .center
        // 背景色
        banner.collectionViewBackgroundColor = UIColor.white
        //设置代理
        banner.delegate = self
        //过滤URL特殊字符
        banner.isAddingPercentEncodingForURLString = true
        
        //图片地址
        banner.imagePaths = ["https://ali1.rabbitpre.com/img_750_390.jpg","https://fw.rabbitpre.com/a27d772e-9fdb-443e-8a13-d9f4097deb4c","https://ali2.rabbitpre.com/c8117427-0912-42aa-876c-2ad25a75d8ab"]
        return banner
    }()
    
    /// 分类视图
    fileprivate lazy var categoryView:CLHomeCategoryView = {
        let view = CLHomeCategoryView(frame: CGRect(x: KScaleWidth(width: 10), y: KScaleHeight(height: 195 + 20), width: CLSCREE_WIDYH - KScaleWidth(width: 20), height: KScaleHeight(height: 55)))
        
        
        
        return view
    }()
    
    
    fileprivate lazy var tempLabel:UILabel = {
        let label = UILabel.init(title: "模板推荐", textColor: UIColor.cl_colorWithHex(hex: 0x2B2B2B), fontSize: 15, numOfLines: 1, alignment: .center)
        
        label.sizeToFit()
        
        return label
    }()
    
    
    override func setupUI() {
        super.setupUI()
        
        addSubViews(subviews: [bannerView,categoryView,tempLabel])
        
        tempLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.top.equalTo(categoryView).offset(KScaleHeight(height: 10 + categoryView.bounds.size.height))
        }
        
    }
    
    
}

// MARK: - LLCycleScrollViewDelegate,轮播图的代理
extension CLHomeTopView:LLCycleScrollViewDelegate {
    
    func cycleScrollView(_ cycleScrollView: LLCycleScrollView, didSelectItemIndex index: NSInteger) {
        print(index)
        
        
    }
    
    
}








