//
//  ViewController.swift
//  02_hw_autoLayout
//
//  Created by 최은지 on 19/10/2019.
//  Copyright © 2019 최은지. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.loginBtn.layer.borderColor = UIColor.white.cgColor
        self.loginBtn.layer.borderWidth = 1
        self.loginBtn.layer.cornerRadius = 15
        
        
        
    }


}

