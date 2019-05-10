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
        
        if key == "browser" {
            var images = [SKPhoto]()
            let photo = SKPhoto.photoWithImageURL("http://img.ivsky.com/img/tupian/li/201810/18/xiyang-005.jpg")
            photo.shouldCachePhotoURLImage = false
            images.append(photo)
            
            let photo2 = SKPhoto.photoWithImageURL("http://img.ivsky.com/img/tupian/li/201810/17/zhulin-010.jpg")
            photo2.shouldCachePhotoURLImage = false
            images.append(photo2)
            
            let photo3 = SKPhoto.photoWithImageURL("http://img.ivsky.com/img/tupian/li/201810/16/senlin_wu-011.jpg")
            photo3.shouldCachePhotoURLImage = false
            images.append(photo3)
            
            let photo4 = SKPhoto.photoWithImageURL("http://img.ivsky.com/img/tupian/li/201810/16/shamo.jpg")
            photo4.shouldCachePhotoURLImage = false
            images.append(photo4)
            
            let browser = SKPhotoBrowser(photos: images)
            browser.initializePageIndex(0)
            present(browser, animated: true, completion: {})
        }
        
        if key == "ziran" {
            let vc = ZiRanListViewController()
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)
        }
        
        if key == "config" {
            let vc = ConfigViewController()
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
