//
//  ViewController.swift
//  02_hw_calculator
//
//  Created by 최은지 on 23/10/2019.
//  Copyright © 2019 최은지. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var btn0: UIButton!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btn6: UIButton!
    @IBOutlet weak var btn7: UIButton!
    @IBOutlet weak var btn8: UIButton!
    @IBOutlet weak var btn9: UIButton!
    
    @IBOutlet weak var btnMinus: UIButton!
    @IBOutlet weak var btnMul: UIButton!
    @IBOutlet weak var btnAC: UIButton!
    @IBOutlet weak var btnEqual: UIButton!
    @IBOutlet weak var btnPlus: UIButton!
    @IBOutlet weak var btnDivide: UIButton!
    
    @IBOutlet weak var ansLabel: UILabel!
    
    var num1: String = ""
    var num2: String = ""
    
    var oper: String! = ""
    
    var isEnterNum1: Bool = false
    var isEnterNum2: Bool = false

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.black
        
        btn0.layer.cornerRadius = 45
        btn1.layer.cornerRadius = 45
        btn2.layer.cornerRadius = 45
        btn3.layer.cornerRadius = 45
        btn4.layer.cornerRadius = 45
        btn5.layer.cornerRadius = 45
        btn6.layer.cornerRadius = 45
        btn7.layer.cornerRadius = 45
        btn8.layer.cornerRadius = 45
        btn9.layer.cornerRadius = 45
        
        btnMinus.layer.cornerRadius = 45
        btnMul.layer.cornerRadius = 45
        btnAC.layer.cornerRadius = 45
        btnEqual.layer.cornerRadius = 45
        btnPlus.layer.cornerRadius = 45
        btnDivide.layer.cornerRadius = 45
        
        num1 = ""
        num2 = ""

        isEnterNum1 = false
        isEnterNum2 = false
        
        ansLabel.text = "0"
    }
    
    
    @IBAction func numClick(_ sender: UIButton) {
        let newNum: String! = sender.titleLabel!.text
        
        if isEnterNum1==false {
            num1 += newNum
            self.ansLabel.text = num1
        } else if isEnterNum2 == false {
            num2 += newNum
            self.ansLabel.text = num2
        }
    }
    
    @IBAction func acClick(_ sender: UIButton) {
        num1 = ""
        num2 = ""
        isEnterNum1 = false
        isEnterNum2 = false
        
        self.ansLabel.text = "0"
    }
    
    @IBAction func opClick(_ sender: UIButton) {
        oper = sender.titleLabel!.text
        
        if num1 != "" {
            isEnterNum1 = true
        }
    
    }
    
    @IBAction func calc(_ sender: UIButton) {
        
        if num1 != "" && num2 != ""{
            let num1ToInt:Int! = Int(num1)
            let num2ToInt:Int! = Int(num2)
            isEnterNum2 = true
            
            switch oper {
            case "+" :
                let ans:Int! = num1ToInt + num2ToInt
                ansLabel.text = String(ans)
            case "-" :
                let ans:Int! = num1ToInt - num2ToInt
                ansLabel.text = String(ans)
            case "X" :
                let ans:Int! = num1ToInt * num2ToInt
                ansLabel.text = String(ans)
            case "÷" :
                let num1ToFloat = (num1 as NSString).floatValue
                let num2ToFloat = (num2 as NSString).floatValue
                let ans:Float = num1ToFloat / num2ToFloat
                ansLabel.text = String(ans)
            default :
                let ans:Int! = num1ToInt + num2ToInt
                
            }
           
            num1 = ""
            num2 = ""
            isEnterNum1 = false
            isEnterNum2 = false
           
        }
        
        
        
    }
    
    
    
    


}

