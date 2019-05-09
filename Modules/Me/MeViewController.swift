//
//  MeViewController.swift
//  swift_zhou
//
//  Created by taiji_zq on 2019/5/9.
//  Copyright © 2019 taiji_zq. All rights reserved.
//

import UIKit

class MeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var dataSource : Array<String>?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "我";
        
        dataSource?.append("First")
        
        let tbView = UITableView(frame: view.bounds, style: .grouped)
        view.addSubview(tbView)
        tbView.dataSource = self
        tbView.delegate = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let CellId = "MeCellId"
        var cell = tableView.dequeueReusableCell(withIdentifier: CellId)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: CellId)
        }
        
        cell?.textLabel?.text = "First"
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        print("little")
    }
    
}
