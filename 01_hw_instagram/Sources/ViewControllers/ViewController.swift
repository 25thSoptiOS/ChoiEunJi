//
//  ViewController.swift
//  01_hw_instagram
//
//  Created by 최은지 on 02/10/2019.
//  Copyright © 2019 최은지. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
        
    @IBOutlet weak var heartBtn: UIButton!
    
    @IBOutlet weak var likeLabel: UILabel!
    
    var isClicked : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func btnClick(_ sender: Any) {
        
        if isClicked==false {
             self.likeLabel.text = "sopt.iOS.Lover  님이 좋아합니다."
            heartBtn.setImage(UIImage(named: "hearrt-fill"), for: .normal)
            isClicked = true
        } else {
            self.likeLabel.text = ""
            heartBtn.setImage(UIImage(named: "heart"), for: .normal)
            isClicked = false
            
        }
       
        
    }
    
}

