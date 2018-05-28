//
//  CLBaseVC.swift
//  TestDemo
//
//  Created by fuyongYU on 2018/5/21.
//  Copyright © 2018年 fuyongYU. All rights reserved.
//

import UIKit

class CLBaseVC: UIViewController,UIGestureRecognizerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        

        setupUI()
        
        
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
        
    }
    
    func setupUI() {
        
        view.backgroundColor = UIColor.white
        
        //隐藏返回按钮文字，自定义图片的最简单方法
        let backIten:UIBarButtonItem = UIBarButtonItem()
        backIten.title = ""
        navigationItem.backBarButtonItem = backIten
        navigationController?.navigationBar.barStyle = .black
        
//        //使用navigationLeftItem会导致页面侧滑手势失效,需要加上后面两句代码,并且遵循UIGestureRecognizerDelegate协议
//        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
//        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        navigationController?.navigationBar.isUserInteractionEnabled = true
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        print("---------------/n发送了内存警告，请注意处理----%@/n",self.classForCoder)
        
    }
    
    // MARK: - 释放
    deinit {
        
        NotificationCenter.default.removeObserver(self)
        
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
