//
//  ViewController.swift
//  01_supplement_UIslider
//
//  Created by 최은지 on 16/10/2019.
//  Copyright © 2019 최은지. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var sliderRed: UISlider!
    @IBOutlet weak var sliderGreen: UISlider!
    @IBOutlet weak var sliderBlue: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func updateColor(_sender:UISlider){
        self.view.backgroundColor = UIColor.init(red: CGFloat(self.sliderRed.value), green: CGFloat(self.sliderGreen.value), blue: CGFloat(self.sliderBlue.value), alpha: 1.0)
    }

}

