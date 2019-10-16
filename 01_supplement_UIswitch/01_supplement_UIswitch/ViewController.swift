//
//  ViewController.swift
//  01_supplement_UIswitch
//
//  Created by 최은지 on 16/10/2019.
//  Copyright © 2019 최은지. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var candleLabel: UILabel!
    @IBOutlet weak var candleImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func switchCtrl(_ sender: UISwitch) {
        if sender.isOn {
            self.candleLabel.text = "Candle is On"
            candleImage.image = UIImage(named: "candle-on")
        } else {
            self.candleLabel.text = "Candle is Off"
            candleImage.image = UIImage(named: "candle-off")
        }
    }
    
}

