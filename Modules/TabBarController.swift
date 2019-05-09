//
//  TabBarController.swift
//  swift_zhou
//
//  Created by taiji_zq on 2019/5/9.
//  Copyright © 2019 taiji_zq. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        initData()
    }
  
    func initData() {
        
        let vc1 = HomeViewController()
        vc1.tabBarItem = UITabBarItem(title: "应用", image: UIImage(named: "tabbar_yingyong_normal")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "tabbar_yingyong_click")?.withRenderingMode(.alwaysOriginal))
        let nav1 = UINavigationController(rootViewController: vc1)
        
        let vc2 = MeViewController()
        vc2.tabBarItem = UITabBarItem(title: "我", image: UIImage(named: "tabbar_me_normal")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "tabbar_me_click")?.withRenderingMode(.alwaysOriginal))
        let nav2 = UINavigationController(rootViewController: vc2)
        
        self.viewControllers = [nav1,nav2];
    }
}
