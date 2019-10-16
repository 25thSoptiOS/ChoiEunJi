//
//  SegControlViewController.swift
//  01_supplement_UISegmentControl
//
//  Created by 최은지 on 16/10/2019.
//  Copyright © 2019 최은지. All rights reserved.
//

import UIKit

class SegControlViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
    @IBOutlet weak var leftRightSegControl: UISegmentedControl!
    
    var selectedSegmentIndex: Int!
    var info: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let contentString = info{
            displayLabel.text = contentString
        }
        
        if let whichSelect = selectedSegmentIndex {
            leftRightSegControl.selectedSegmentIndex = whichSelect
        }

    }
    

}
