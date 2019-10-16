## 01_seminar_helloworld

<img src="/screenshots/01_helloworld.png" width="300" height="600"> 

<br/>
<br/>

## 01_seminar_storyboard

<img src="/screenshots/01_storyboard_1.png" width="300" height="600"> <img src="/screenshots/01_storyboard_2.png" width="300" height="600"> 

- 버튼 클릭 >> cmd + drag&drop >> present modally 클릭

<br/>
<br/>


## 01_seminar_storyboard_2

- 객체 제어
```swift 
    @IBOutlet weak var titleLabel: UILabel!
     
    @IBAction func sayHello(_ sender: UIButton) {
        self.titleLabel.text = "SOPT!"
    }
```

<img src="/screenshots/01_storyboard2_1.png" width="300" height="600"> <img src="/screenshots/01_storyboard2_2.png" width="300" height="600"> 


<br/>
<br/>


## 01_hw_instagram

- 핵심 코드 

```swift 
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


- 실행 결과

<img src="/screenshots/01_insta.png" width="300" height="600"> <img src="/screenshots/01_insta2.png" width="300" height="600">

<br/>
<br/>
