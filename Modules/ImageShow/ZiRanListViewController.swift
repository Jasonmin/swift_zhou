//
//  ZiRanListViewController.swift
//  swift_zhou
//
//  Created by taiji_zq on 2019/5/10.
//  Copyright © 2019 taiji_zq. All rights reserved.
//

import UIKit
import Alamofire
import SKPhotoBrowser

class ZiRanListViewController: UIViewController , UITableViewDataSource, UITableViewDelegate {

    var dataSource : Array<[String:Any]> = [[String:Any]]()
    var tbView:UITableView!
    var photoSource = [SKPhoto]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Ziran List";
        
        
        tbView = UITableView(frame: view.bounds, style: .grouped)
        view.addSubview(tbView)
        tbView.dataSource = self
        tbView.delegate = self
        
        request_imgs()
    }
    
    func request_imgs() -> Void {
        let param = ["pageIdx":"0","pageSize":"300"]
        Alamofire.request("http://192.168.0.156:8888/book/list", method: .get, parameters: param).responseJSON { (response) in
            if response.result.isSuccess {
                if let items = response.result.value as? Array<Any> {
                    for dict in items {
//                        print(dict)
                        self.dataSource.append(dict as! [String : Any])
                    }
                }
                self.handlePhotoSource()
                self.tbView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let CellId = "ZiranCellId"
        var cell = tableView.dequeueReusableCell(withIdentifier: CellId)
        if cell == nil {
            cell = UITableViewCell(style: .value1, reuseIdentifier: CellId)
        }
        
        let dic = dataSource[indexPath.row]
        cell?.textLabel?.text = (dic["title"] as! String)
        cell?.detailTextLabel?.text = "\(indexPath.row+1)"
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let browser = SKPhotoBrowser(photos: photoSource)
        browser.initializePageIndex(indexPath.row)
        present(browser, animated: true, completion: {})
    }
    
    func handlePhotoSource(){
        
        photoSource.removeAll()
    
        for dic in dataSource {
            let imgPath = dic["imgPath"] as! String
            let photo = SKPhoto.photoWithImageURL(imgPath)
            photo.shouldCachePhotoURLImage = false
            photoSource.append(photo)
        }
    }
    

}
