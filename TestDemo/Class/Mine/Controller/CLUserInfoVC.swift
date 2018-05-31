//
//  CLUserInfoVC.swift
//  TestDemo
//
//  Created by fuyongYU on 2018/5/31.
//  Copyright © 2018年 YeMaoZi. All rights reserved.
//

import UIKit
import TZImagePickerController


fileprivate let userInfoCellIdentifier = "userInfoCellIdentifier"

class CLUserInfoVC: CLBaseVC {
    
    
    
    /// UITableView
    fileprivate lazy var tableView : UITableView = {
        
        let table = CLTableView(frame: CLSCREE_BOUNDS, style: .grouped)
        
        table.register(CLUserInfoCell.classForCoder(), forCellReuseIdentifier: userInfoCellIdentifier)
        
        //设置组之间的高度
        table.sectionHeaderHeight = KScaleHeight(height: 0)
        table.sectionFooterHeight = KScaleHeight(height: 10)
        
        table.delegate = self
        table.dataSource = self
        
        return table
    }()
    
    /// 头部视图
    fileprivate lazy var topView : UIView = {
        
        let topView = UIView(frame: CGRect.init(x: 0, y: 0, width: CLSCREE_WIDYH, height: KScaleHeight(height: 150)))
        
        topView.backgroundColor = UIColor.white
        
        
        
        return topView
    }()
    
    /// 图片选择器
    fileprivate lazy var imagePickerVC:TZImagePickerController = {
        
        let vc = TZImagePickerController.init(maxImagesCount: 1, delegate: self as! TZImagePickerControllerDelegate)
        
        
        return vc!
    }()
    
    fileprivate let cellArr = [["昵称","夜猫子"],["名字",""],["年龄","16"],["身份切换","个人身份"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    override func setupUI() {
        super.setupUI()
        
        title = "个人资料"
        
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
        
        tableView.tableHeaderView = topView
        
        
        
    }
    
    

}

// MARK: - UITableViewDelegate && UITableViewDataSource
extension CLUserInfoVC : UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 4;
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: userInfoCellIdentifier, for: indexPath) as! CLUserInfoCell
        
        cell.leftLabel.text = cellArr[indexPath.section][indexPath.row]
        cell.rightLable.text = cellArr[indexPath.section][indexPath.row + 1]
        
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = UIViewController()
        vc.view.backgroundColor = UIColor.cl_randomColor()
        
        navigationController?.pushViewController(vc, animated: true)
        
        print(indexPath)
        
    }
    
  
    
    
    
    
}











