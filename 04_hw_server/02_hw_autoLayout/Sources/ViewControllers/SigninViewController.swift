//
//  SigninViewController.swift
//  02_hw_autoLayout
//
//  Created by 최은지 on 02/11/2019.
//  Copyright © 2019 최은지. All rights reserved.
//

import UIKit

class SigninViewController: UIViewController {

    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwdTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    
    @IBOutlet weak var signInBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func doSignIn(_ sender: UIButton) {
        
        guard let id = idTextField.text else { return }
        guard let pwd = pwdTextField.text else { return }
        guard let name = nameTextField.text else { return }
        guard let phone = phoneTextField.text else {
            return 
        }
        
        SignupService.shared.signup(id, pwd, name, phone) {
            
            data in
            
            switch data {
                
                
            case .success(let data):
                
                print(data)
                print ("success")
                break
            case .requestErr(_):
                print(".requestErr")
                break
            case .pathErr:
                print("pathErr")
                break
            case .serverErr:
                print("serverErr")
                break
            case .networkFail:
                print("networkErr")
                break
            }
            
            
            
        }
        
        
    }
    

}

