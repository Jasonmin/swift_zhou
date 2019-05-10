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
    var url = "http://192.168.0.156:8888/book/list"
    var curPage = 0
    let pageSize = 20
    var isRequestingMore = false
    var isAllDataLoaded = false
    // search
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Ziran List";
        
        let value = UserDefaults.standard.value(forKey: "UDKey_BASEIP")
        if value != nil {
            url = "http://\(value!):8888/book/list"
        }
        
        tbView = UITableView(frame: view.bounds, style: .grouped)
        tbView.rowHeight = 50
        view.addSubview(tbView)
        tbView.dataSource = self
        tbView.delegate = self
        
        request_imgs(firstPage: true)
    }
    
    func request_imgs(firstPage:Bool) -> Void {
        if firstPage == false {
            curPage+=1
            isRequestingMore = true
        } else {
            self.isAllDataLoaded = false;
            isRequestingMore = false
            curPage = 0
        }
        let param = ["pageIdx":"\(curPage)","pageSize":"\(pageSize)"]
        Alamofire.request(url, method: .get, parameters: param).responseJSON { (response) in
            if response.result.isSuccess {
                
                self.isRequestingMore = false
                
                if let items = response.result.value as? Array<Any> {
                    
                    if items.count < self.pageSize {
                        self.isAllDataLoaded = true;
                    }
                    
                    if self.curPage == 0 {
                        self.dataSource.removeAll()
                    }
                    
                    for dict in items {
                        self.dataSource.append(dict as! [String : Any])
                    }
                }
                self.handlePhotoSource()
                self.tbView.reloadData()
            }
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        if  isAllDataLoaded == false &&
            isRequestingMore == false &&
            (offsetY + scrollView.frame.size.height) > scrollView.contentSize.height &&
            scrollView.contentSize.height > scrollView.frame.size.height {
            request_imgs(firstPage: false)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let CellId = "ZiranCellId"
        var cell = tableView.dequeueReusableCell(withIdentifier: CellId)
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: CellId)
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
