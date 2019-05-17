//
//  ChartViewController.swift
//  swift_zhou
//
//  Created by taiji_zq on 2019/5/17.
//  Copyright © 2019 taiji_zq. All rights reserved.
//

import UIKit

class ChartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let classString = NSStringFromClass(type(of: self))
        let vcName = classString.components(separatedBy: ".").last
        title = vcName!
        view.backgroundColor = UIColor.white
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
