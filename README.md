# ChoiEunJi


## 1 instagram

핵심 코드 

```swift
 @IBOutlet weak var heartBtn: UIButton!
    
    @IBOutlet weak var likeLabel: UILabel!
    
    var isClicked : Bool = false
   
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
```

실행 결과

![screenshot](./screenshots/01_insta)
![screenshot](./screenshots/01_insta2)
