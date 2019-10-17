//
//  ViewController.swift
//  02_seminar_segue
//
//  Created by 최은지 on 17/10/2019.
//  Copyright © 2019 최은지. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destination = segue.destination
        let button = sender as! UIButton
        destination.title = button.titleLabel?.text
        destination.view.backgroundColor = button.titleColor(for: .normal)
    }


}

