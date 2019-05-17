//
//  TouchIDViewController.swift
//  swift_zhou
//
//  Created by taiji_zq on 2019/5/13.
//  Copyright © 2019 taiji_zq. All rights reserved.
//

import UIKit
import LocalAuthentication

class TouchIDViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.white
        title = "指纹验证"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        showTouchID()
    }
    
    func showTouchID() {
        let laContext = LAContext()
        var err:NSError?
        
        if laContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &err) {
            laContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "请验证指纹") { (success, err) in
                
                if success {
                    print("指纹验证成功");
                    DispatchQueue.main.async {
                        let hud = MBProgressHUD.showAdded(to: self.view, animated: false)
                        hud.mode = .text
                        hud.label.text = "指纹验证成功"
                    }
                } else {
                    print("指纹验证失败");
                }
            }
        }
    }
}
