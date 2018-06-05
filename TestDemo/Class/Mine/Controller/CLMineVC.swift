//
//  CLBaseVC.swift
//  TestDemo
//
//  Created by fuyongYU on 2018/5/21.
//  Copyright © 2018年 fuyongYU. All rights reserved.
//

import UIKit


fileprivate let tableViewCellIdentifier = "tableViewCellIdentifier"

class CLMineVC: CLBaseVC {
    
    /// UITableView
    fileprivate lazy var tableView : UITableView = {
        
        let table = CLTableView(frame: CLSCREE_BOUNDS, style: .grouped)
        
        table.register(CLMineTableCell.classForCoder(), forCellReuseIdentifier: tableViewCellIdentifier)
        
        table.rowHeight = UITableViewAutomaticDimension
        table.estimatedRowHeight = 200
        
        //设置组之间的高度
        table.sectionHeaderHeight = 0
        table.sectionFooterHeight = KScaleHeight(height: 10)
        
        table.delegate = self
        table.dataSource = self
        
        return table
    }()
    
    /// 头部视图
    fileprivate lazy var topView : CLMineTopView = {
        
        let topView = CLMineTopView(frame: CGRect.init(x: 0, y: 0, width: CLSCREE_WIDYH, height: KScaleHeight(height: 100)))
        //250    72    60
        topView.backgroundColor = UIColor.cl_rgbColor(red: 250, green: 72, blue: 60)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(userButtonTaghet))
        topView.addGestureRecognizer(tap)
        
        return topView
    }()
    
    /// 底部视图
    fileprivate lazy var boottonView:UIView = {
        
        let bootonView = UIView(frame: CGRect(x: 0, y: 0, width: CLSCREE_WIDYH, height: KScaleHeight(height: 45)))
        
        
        let botonButtom = UIButton(title: "退出登录", titleColor: UIColor.black, fontSize: 15, image: nil, backImage: nil, target: self, action: #selector(exitOutLogin), event: UIControlEvents.touchUpInside)
        botonButtom.backgroundColor = UIColor.white
        bootonView.addSubview(botonButtom)
        
        botonButtom.snp.makeConstraints { (make) in
            make.left.right.equalTo(bootonView)
            make.top.equalTo(bootonView).offset(KScaleHeight(height: 5))
            make.height.equalTo(KScaleHeight(height: 35))
        }
        
        return bootonView
        
    }()
    
    
    /// cell的数组数据
    fileprivate let arr = [["手机号","密码修改","账号余额","我要反馈"],["使用说明","推荐夜猫","关于我们"]]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    
    override func setupUI() {
        super.setupUI()
        
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
        
        tableView.tableHeaderView = topView
        tableView.tableFooterView = boottonView
        
        
        
        
    }
    
    
}

// MARK: - UITableViewDelegate && UITableViewDataSource
extension CLMineVC : UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return arr.count;
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return 4
        case 1:
            return 3
        default: break
            
        }
        return 0
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCellIdentifier, for: indexPath) as! CLMineTableCell
        
        
        
        switch indexPath.section {
        case 0:
            cell.titleLable?.text = arr[0][indexPath.row]
            if indexPath.row == 0 {
                cell.cellButton.setTitle("181********", for: .normal)
                cell.cellButton.setTitle("181********", for: .highlighted)
                cell.cellButton.setImage(UIImage(named: ""), for: .normal)
                cell.cellButton.setImage(UIImage(named: ""), for: .highlighted)
            }
        case 1:
            cell.titleLable?.text = arr[1][indexPath.row]
            if indexPath.row != 0 {
                cell.cellButton.setImage(UIImage(named: ""), for: .normal)
                cell.cellButton.setImage(UIImage(named: ""), for: .highlighted)
            }
        default:
            break
        }
        
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = UIViewController()
        vc.view.backgroundColor = UIColor.cl_randomColor()
        
        navigationController?.pushViewController(vc, animated: true)
        
        print(indexPath)
        
    }
    
    
    
    
    
}


// MARK: - 点击事件
extension CLMineVC {
    
    /// 退出登录点击事件
    @objc func exitOutLogin() {
        
        Log.e("点击了退出登录")
        
    }
    
    /// 个人用户的点击事件
    @objc func userButtonTaghet() {
        
        
        let userVC = CLUserInfoVC()
        
        navigationController?.pushViewController(userVC, animated: true)
    }
    
    
}













