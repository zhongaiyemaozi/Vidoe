//
//  CLTabBarController.swift
//  TestDemo
//
//  Created by fuyongYU on 2018/5/21.
//  Copyright © 2018年 fuyongYU. All rights reserved.
//

import UIKit

class CLTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupUI()
        
    }
    
    
    /// 页面设置
    fileprivate func setupUI() {
        
        addChildVC()
        
    }
    
    
    /// 添加子控制器
    fileprivate func addChildVC() {
        //或是json文件的路径
        if let url = Bundle.main.url(forResource: "main.json", withExtension: nil),
            //json路径文件转换成二进制
            let jsonData = try? Data(contentsOf: url),
            //二进制设置为对象
            let object = try? JSONSerialization.jsonObject(with: jsonData, options: []),
            //对象生成数组
            let dictArr = object as? [[String : Any]] {
            //设置navgation的控制器
            var controllers : [CLNavigationController] = []
            //遍历数组
            for dict in dictArr {
                
                let navController = generateChildController(dict: dict)
                controllers.append(navController!)
            }
            //添加控制器
            viewControllers = controllers
            
        }
        
    }
    
    
    fileprivate func generateChildController(dict:[String : Any]) -> CLNavigationController? {
        
        if let clsName = dict["clsName"] {
            //命名空间
            let className = "TestDemo" + "." + "\(clsName as! String)"
            //生成对应的控制器
            if let classVC = NSClassFromString(className) as? CLBaseVC.Type {
                //控制器初始化
                let controller = classVC.init()
                //设置title标题
                controller.title = dict["title"] as? String
                //设置tabbar按钮的颜色
                controller.tabBarItem.setTitleTextAttributes([kCTForegroundColorAttributeName as NSAttributedStringKey : view.backgroundColor ?? UIColor()], for: .normal)
                controller.tabBarItem.setTitleTextAttributes([kCTForegroundColorAttributeName as NSAttributedStringKey : view.backgroundColor ?? UIColor()], for: .selected)
                
                //设置tabbar的图片
                controller.tabBarItem.image = UIImage(named: dict["imageName"] as! String)?.withRenderingMode(.alwaysOriginal)
                controller.tabBarItem.selectedImage = UIImage(named: dict["selectImageName"] as! String)?.withRenderingMode(.alwaysOriginal)
                
                //设置对应navgation的控制器
                let navController = CLNavigationController(rootViewController: controller)
                //返回navfation
                return navController
                
            }
            
        }
        
        return nil
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
