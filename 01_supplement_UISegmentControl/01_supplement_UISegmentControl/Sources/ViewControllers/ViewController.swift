//
//  ViewController.swift
//  01_supplement_UISegmentControl
//
//  Created by 최은지 on 16/10/2019.
//  Copyright © 2019 최은지. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var leftRightSegControl: UISegmentedControl!
    var makeString: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! SegControlViewController
        
        let situation: String! = leftRightSegControl.titleForSegment(at: leftRightSegControl.selectedSegmentIndex)
        
        destVC.title = situation
        
        makeString = situation
        makeString += " 선택됨"
        
        destVC.info = makeString
        destVC.selectedSegmentIndex = leftRightSegControl.selectedSegmentIndex
    }


}

