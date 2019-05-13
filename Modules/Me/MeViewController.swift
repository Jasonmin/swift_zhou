//
//  MeViewController.swift
//  swift_zhou
//
//  Created by taiji_zq on 2019/5/9.
//  Copyright © 2019 taiji_zq. All rights reserved.
//

import UIKit
import SKPhotoBrowser

class MeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var dataSource : Array<[String:String]>! = [[String:String]]()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "我";
        
        dataSource.append(["ziran":"自然风光"])
        dataSource.append(["browser":"图片浏览"])
        dataSource.append(["config":"数据配置"])
        dataSource.append(["touchid":"指纹验证"])
        
        let tbView = UITableView(frame: view.bounds, style: .grouped)
        view.addSubview(tbView)
        tbView.dataSource = self
        tbView.delegate = self
        
        // footer
        let footer = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.size.width, height: 64.0))
        let logoutBtn = UIButton(frame: CGRect(x: 10, y: 10, width: view.bounds.size.width-20, height: 44))
        logoutBtn.setTitle("退出登录", for: .normal)
        logoutBtn.setTitleColor(UIColor.red, for: .normal)
        logoutBtn.addTarget(self, action: #selector(logOut), for: .touchUpInside)
        footer.addSubview(logoutBtn)
        tbView.tableFooterView = footer
    }
    
    @objc func logOut() {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "kNotify_login"), object: "0")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let CellId = "MeCellId"
        var cell = tableView.dequeueReusableCell(withIdentifier: CellId)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: CellId)
            cell?.accessoryType = .disclosureIndicator
        }
        
        let dic = dataSource[indexPath.row];
        
        let value = dic.values.first
        cell?.textLabel?.text = value!
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let dic = dataSource![indexPath.row];
        let key = dic.keys.first
        
        var targetVC:UIViewController!
        if key == "browser" {
            
        }
        if key == "ziran" {
            targetVC = ZiRanListViewController()
        }
        if key == "config" {
            targetVC = ConfigViewController()
        }
        if key == "touchid" {
            targetVC = TouchIDViewController()
        }
        targetVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(targetVC, animated: true)
    }
}
