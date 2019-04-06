//
//  ViewController.swift
//  iGoals
//
//  Created by Tifo Audi Alif Putra on 03/04/19.
//  Copyright © 2019 BCC FILKOM. All rights reserved.
//

import UIKit

class SplashVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(SplashVC.onSplashNavigate), userInfo: nil, repeats: false)
    }
    
    @objc func onSplashNavigate() {
        performSegue(withIdentifier: MAIN_SEGUE, sender: nil)
    }
    
}

