//
//  ViewController.swift
//  01_seminar_storyboard_2
//
//  Created by 최은지 on 16/10/2019.
//  Copyright © 2019 최은지. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func sayHello(_ sender: UIButton) {
        self.titleLabel.text = "SOPT!"
    }
    

}

