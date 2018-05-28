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
        
        return topView
    }()
    
    
    
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
        
        return 3;
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return 1
        case 1:
            return 4
        case 2:
            return 1
        default: break
            
        }
        return 0
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCellIdentifier, for: indexPath) as! CLMineTableCell
        
        let arr = [["钱包"],["收藏","相册","卡包","表情"],["设置"]]
        
        switch indexPath.section {
        case 0:
            cell.titleLable?.text = arr[0][indexPath.row]
        case 1:
            cell.titleLable?.text = arr[1][indexPath.row]
        case 2:
            cell.titleLable?.text = arr[2][indexPath.row]
        default:
            break
        }
        
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        navigationController?.pushViewController(UIViewController(), animated: true)
        
        print(indexPath)
        
    }
    
    
    
    
    
    
}











