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
    
    @IBOutlet weak var loginUserid: UITextField!
    @IBOutlet weak var loginPassword: UITextField!
    
//    @IBOutlet weak var viewYCenter: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.loginBtn.layer.borderColor = UIColor.white.cgColor
        self.loginBtn.layer.borderWidth = 1
        self.loginBtn.layer.cornerRadius = 15
        
    }
    
    func simpleAlert(title: String, message: String, type: Int?){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        var ok: UIAlertAction
        if type == 0{
            ok = UIAlertAction(title: "확인", style: .cancel)
        }else{
            ok = UIAlertAction(title: title, style: .cancel, handler: {action in
                self.dismiss(animated: true)
            })
            
        }
        alert.addAction(ok)
        
        self.present(alert, animated: true)
    }
    
    
    @IBAction func doLogin(_ sender: UIButton) {
        
        // 로그인 서버 통신 구현 코드
        guard let id = loginUserid.text else { return }
        guard let pwd = loginPassword.text else { return }
        
        LoginService.shared.login(id, pwd) {
            data in
            
            switch data {
                
            case .success(let data):
                
                // DataClass 에서 받은 유저 정보 반환
                let user_data = data as! DataClass
                
                // 사용자의 토큰, 이름, 이메일, 전화번호 받아오기
                // 비밀번호는 안 받아와도 됨
                UserDefaults.standard.set(user_data.userIdx, forKey: "token")
                UserDefaults.standard.set(user_data.name, forKey: "name")
                UserDefaults.standard.set(user_data.phone, forKey: "phone")
                
//                let main = storyboard.instantiateViewController(withIdentifier: "SecondViewController")
//                self.present(main, animated: true)
                
            case .requestErr(let message):
//                self.simpleAlert(title: "로그인 실패", message: "\(message)")
                print(message)
                break
                
            case .pathErr:
                print(".pathErr")
                
            case .serverErr:
                print(".serverErr")
                
            case .networkFail:
                print(".networkFail")
//                self.simpleAlert(title: "로그인 실패", message: "네트워크 상태를 확인해주세요.")
                break
                
                
            }
        }
    }
    
    
}



// keyboard settings
extension ViewController: UIGestureRecognizerDelegate {
    
    func initGestureRecognizer() {
        let textFieldTap = UITapGestureRecognizer(target: self, action: #selector(handleTapTextField(_:)))
        textFieldTap.delegate = self
        view.addGestureRecognizer(textFieldTap)
    }
    
    // 다른 위치 탭했을 때 키보드 없어지는 코드
    @objc func handleTapTextField(_ sender: UITapGestureRecognizer) {
        self.loginUserid.resignFirstResponder()
        self.loginPassword.resignFirstResponder()
    }
    
    
    func gestureRecognizer(_ gestrueRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if (touch.view?.isDescendant(of: loginUserid))! || (touch.view?.isDescendant(of: loginPassword))! {
            
            return false
        }
        return true
    }
    
    // keyboard가 보여질 때 어떤 동작을 수행
    @objc func keyboardWillShow(_ notification: NSNotification) {
        
        guard let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else { return }
        guard let curve = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? UInt else { return }
        
        guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        
        let keyboardHeight: CGFloat // 키보드의 높이
        
        if #available(iOS 11.0, *) {
            keyboardHeight = keyboardFrame.cgRectValue.height - self.view.safeAreaInsets.bottom
        } else {
            keyboardHeight = keyboardFrame.cgRectValue.height
        }
        
        // animation 함수
        // 최종 결과물 보여줄 상태만 선언해주면 애니메이션은 알아서 발생한다.
        // duration은 간격
        UIView.animate(withDuration: duration, delay: 0.0, options: .init(rawValue: curve), animations: {
            
            //self.logoImgView.alpha = 0
            
            // +로 갈수록 y값이 내려가고 -로 갈수록 y값이 올라간다.
//            self.viewYCenter.constant = -keyboardHeight/2 + 50
        })
        
        self.view.layoutIfNeeded()
    }
    
    // keyboard가 사라질 때 어떤 동작을 수행
    @objc func keyboardWillHide(_ notification: NSNotification) {
        guard let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else {return}
        guard let curve = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? UInt else {return}
        UIView.animate(withDuration: duration, delay: 0.0, options: .init(rawValue: curve), animations: {
            
            // 원래대로 돌아가도록
            //self.logoImgView.alpha = 1.0
//            self.viewYCenter.constant = 0
        })
        
        self.view.layoutIfNeeded()
    }
    
    
    // observer
    func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    func unregisterForKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}


