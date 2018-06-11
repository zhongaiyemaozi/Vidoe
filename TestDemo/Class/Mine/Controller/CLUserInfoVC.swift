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
        topView.addSubview(imageButton)
        
        imageButton.snp.makeConstraints { (make) in
            make.center.equalTo(topView)
            make.size.equalTo(CGSize(width: KScaleHeight(height: 60), height: KScaleHeight(height: 60)))
        }
        
        return topView
    }()
    
    /// 图片选择器
    fileprivate lazy var imagePickerVC:TZImagePickerController = {
        
        let vc = TZImagePickerController.init(maxImagesCount: 1, delegate: self as TZImagePickerControllerDelegate)
        vc?.allowPreview = true
        vc?.showSelectBtn = false
        vc?.allowTakePicture = true
        vc?.allowTakeVideo = false
        vc?.allowPickingImage = true
        vc?.sortAscendingByModificationDate = false
        
        return vc!
    }()
    
    /// 头部视图中头像按钮
    lazy var imageButton:UIButton = {
        let btn = UIButton(title: "", titleColor: UIColor.clear, fontSize: 0, image: "", backImage: "ic_login_qq_normal", target: self, action: #selector(userImageButtom(btn:)), event: UIControlEvents.touchUpInside)
        
        btn.layer.cornerRadius = KScaleHeight(height: 30)
        btn.layer.masksToBounds = true
        
        return btn
    }()
    
    
    /// 数据源
    fileprivate var cellArr = [["昵称","夜猫子"],["名字",""],["年龄","16"],["身份切换","个人身份"]]
    
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
        
        switch indexPath.section {
        case 0:
            
            let alertController = UIAlertController(title: "请输入昵称", message: nil, preferredStyle: .alert)
            alertController.addTextField { (textField:UITextField) in
                textField.placeholder = "请输入昵称"
                textField.text = self.cellArr[indexPath.section][indexPath.row + 1]
            }
            
            let sureAction = UIAlertAction(title: "确定", style: .destructive) { (_) in
                self.cellArr[indexPath.section][indexPath.row + 1] = (alertController.textFields?.last?.text)!
                tableView.reloadData()
            }
            
            let cancerAction = UIAlertAction(title: "取消", style: .cancel) { (_) in
                
            }
            
            alertController.addAction(sureAction)
            alertController.addAction(cancerAction)
            present(alertController, animated: true, completion: nil)
            
            
        case 1:
            
            CLPRAlert.showAlert1(self, title: "这是一个弹窗", message: "是的是的", alertTitle: "确定", style: .default) {
                
                print("点击了名字")
            }
            
        case 2:
            
            CLPRAlert.showAlert1(self, title: "这是一个弹窗", message: "是的是的", alertTitle: "确定", style: .default) {
                
                print("点击了年龄")
            }
            
            
            
            
        case 3:
            
            CLPRAlert.showAlert1(self, title: "这是一个弹窗", message: "是的是的", alertTitle: "确定", style: .default) {
                
                print("点击了身份切换")
            }
            
        default:
            break
        }
        
        
        
        
        
        
    }
    
    
    
    
    
    
}


// MARK: - 点击事件
extension CLUserInfoVC {
    
    /// 点击头像的点击事件
    ///
    /// - Parameter btn: 按钮
    @objc func userImageButtom(btn:UIButton) {
        
        //跳转到照片选择器
        present(imagePickerVC, animated: true, completion: nil)
        
    }
    
    
}


// MARK: - TZImagePickerControllerDelegate
extension CLUserInfoVC:TZImagePickerControllerDelegate {
    
    
    //获取选中的图片数组
    func imagePickerController(_ picker: TZImagePickerController!, didFinishPickingPhotos photos: [UIImage]!, sourceAssets assets: [Any]!, isSelectOriginalPhoto: Bool) {
        Log.w("图片：\(photos)")
        imageButton.setImage(photos.last, for: .normal)
        imageButton.setImage(photos.last, for: .highlighted)
    }
    
    func imagePickerController(_ picker: TZImagePickerController!, didFinishPickingPhotos photos: [UIImage]!, sourceAssets assets: [Any]!, isSelectOriginalPhoto: Bool, infos: [[AnyHashable : Any]]!) {
        
        
        
    }
    
}






