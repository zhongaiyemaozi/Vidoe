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
        
        table.delegate = self
        table.dataSource = self
        
        return table
    }()
    
    /// 头部视图
    fileprivate lazy var topView : CLMineTopView = {
        
        let topView = CLMineTopView(frame: CGRect.init(x: 0, y: 0, width: CLSCREE_WIDYH, height: KScaleHeight(height: 100)))
        
        topView.backgroundColor = UIColor.red
        
        return topView
    }()
    
    /// cell的数组数据
    let arr = [["手机号","密码修改","账号余额","我要反馈"],["使用说明","推荐夜猫","关于我们"]]
    
    
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
        case 1:
            cell.titleLable?.text = arr[1][indexPath.row]
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











