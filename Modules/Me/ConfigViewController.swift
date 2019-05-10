//
//  ConfigViewController.swift
//  swift_zhou
//
//  Created by taiji_zq on 2019/5/10.
//  Copyright © 2019 taiji_zq. All rights reserved.
//

import UIKit

class ConfigViewController: UIViewController {
    
    var textField = UITextField()
    let UDKey_BASEIP = "UDKey_BASEIP"
    

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        title = "数据配置"
        
        textField.frame = CGRect(x: 0, y: 100, width: view.bounds.size.width, height: 40)
        textField.backgroundColor = UIColor.init(white: 0.9, alpha: 1.0)
        textField.placeholder = "baseip:"
        textField.clearButtonMode = .whileEditing
        view.addSubview(textField)
        
        let rightItem = UIBarButtonItem(title: "完成", style: .done, target: self, action: #selector(doneAction))
        navigationItem.rightBarButtonItem = rightItem
    }
    
    @objc func doneAction() {
        let res = textField.text
        let array = res?.components(separatedBy: ":")
        if array?.count == 2 {
            let key = array?.first
            let value = array?.last
            if key == "baseip" {
                UserDefaults.standard.set(value!, forKey: UDKey_BASEIP)
                navigationController?.popViewController(animated: true)
            }
            
            UserDefaults.standard.synchronize()
        }
    }
    
}
