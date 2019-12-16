## 01_seminar_storyboard

<img src="/screenshots/01_storyboard_1.png" width="200" height="400"> <img src="/screenshots/01_storyboard_2.png" width="200" height="400"> 

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

<img src="/screenshots/01_storyboard2_1.png" width="200" height="400"> <img src="/screenshots/01_storyboard2_2.png" width="200" height="400"> 


<br/>
<br/>


## 01_supplement_UIcontrol

* UI Button states
    - Default : 누르지 않은 상태
    - Highlighted : 누른 상태
    - Selected : 버튼의 selected property 가 설정된 상태
    - Disabled : 버튼을 누를 수 없도록 설정된 상태 
    
<br/>

<img src="/screenshots/01_UIcontrol.png" width="200" height="400"> <img src="/screenshots/01_UIcontrol2.png" width="200" height="400"> 


<br/>
<br/>


## 01_supplement_image_asset

* image 추가
    - Assets.xcassets 에 이미지 파일 drag & drop
    
* button image 추가
    - type >> custom 선택
    - 각 state 별로 이미지 선택 
    

<img src="/screenshots/01_image2.png" width="200" height="400"> <img src="/screenshots/01_image1.png" width="200" height="400"> 


<br/>
<br/>

## 01_supplement_UIswitch

```swift 
    @IBOutlet weak var candleLabel: UILabel!
    @IBOutlet weak var candleImage: UIImageView!
    
    @IBAction func switchCtrl(_ sender: UISwitch) {
        if sender.isOn {
            self.candleLabel.text = "Candle is On"
            candleImage.image = UIImage(named: "candle-on")
        } else {
            self.candleLabel.text = "Candle is Off"
            candleImage.image = UIImage(named: "candle-off")
        }
    }
```

<img src="/screenshots/01_switch_on.png" width="200" height="400"> <img src="/screenshots/01_switch_off.png" width="200" height="400"> 


<br/>
<br/>


## 01_supplement_UIslider

```swift 
    @IBOutlet weak var sliderRed: UISlider!
    @IBOutlet weak var sliderGreen: UISlider!
    @IBOutlet weak var sliderBlue: UISlider!
    
    @IBAction func updateColor(_sender:UISlider){
        self.view.backgroundColor = UIColor.init(red: CGFloat(self.sliderRed.value), green: CGFloat(self.sliderGreen.value), blue: CGFloat(self.sliderBlue.value), alpha: 1.0)
    }

```

<img src="/screenshots/01_UIslider1.png" width="200" height="400"> <img src="/screenshots/01_UIslider2.png" width="200" height="400"> 


<br/>
<br/>


## 01_supplement_UISegmentController

- segment 값 전달하기

1. View Controller

```swift 
    @IBOutlet weak var leftRightSegControl: UISegmentedControl!
    var makeString: String!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! SegControlViewController
        
        let situation: String! = leftRightSegControl.titleForSegment(at: leftRightSegControl.selectedSegmentIndex)
        
        destVC.title = situation
        
        makeString = situation
        makeString += " 선택됨"
        
        destVC.info = makeString
        destVC.selectedSegmentIndex = leftRightSegControl.selectedSegmentIndex
    }
```

2. SegControl View Controller

```swift 
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
```


<img src="/screenshots/01_leftsend.png" width="200" height="400"> <img src="/screenshots/01_leftselected.png" width="200" height="400"> <img src="/screenshots/01_rightsend.png" width="200" height="400">  <img src="/screenshots/01_rightselected.png" width="200" height="400"> 


<br/>
<br/>


## 01_hw_instagram
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

<img src="/screenshots/01_insta.png" width="200" height="400"> <img src="/screenshots/01_insta2.png" width="200" height="400">

<br/>
<br/>


## 02_seminar_segue

- prepare : view controller 간 데이터 전달 함수 

```swift
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination
        let button = sender as! UIButton
        destination.title = button.titleLabel?.text
        destination.view.backgroundColor = button.titleColor(for: .normal)
    }
```

<img src="/screenshots/02_segue.png" width="200" height="400"> <img src="/screenshots/02_segue_green.png" width="200" height="400">  <img src="/screenshots/02_segue_pink.png" width="200" height="400">

<br/>
<br/>





## 02_hw_autoLayout

- 버튼 테두리 처리 

```swift 
  override func viewDidLoad() {
        super.viewDidLoad()
       
        self.loginBtn.layer.borderColor = UIColor.white.cgColor
        self.loginBtn.layer.borderWidth = 1
        self.loginBtn.layer.cornerRadius = 15
    }

```

<img src="/screenshots/02_hw_auto.png" width="200" height="400"> 


<br/>
<br/>


## 02_hw_calculator

- Root Vertical Stack View 
    - Distribution : Fill Equally
    - Spacing : 10
- Horizontal Stack View (버튼 네 개)
    - Distribution : Fill Equally 
    - Spacing : 10


<img src="/screenshots/02_cal_1.png" width="200" height="370"> <img src="/screenshots/02_cal_2.png" width="200" height="370">



<br/>
<br/>


## 04_hw_signup_server

1. Create NetworkResult.swift

```swift
import Foundation

enum NetworkResult<T>{
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
```

<br/>

2. Create ResponseString.swift

- 성공했을 때 response body 작성

```swift
import Foundation

struct ResponseString2: Codable {
    let success: Bool
    let message: String
    let data: Int
}

```

<br/>


3. Create APIService

```swift

    static let shared = SignupService()

```
- singleton pattern : 모든 프로그램 생애 주기에서 딱 한 번 생성
- 모든 파일에서 전역으로 접근 가능


<br/>

```swift
Alamofire.request(APIConstants.SignupURL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header)
            .responseData { response in // response 에 결과값 저장 -> print 해보기
                
                // parameter 위치
                switch response.result {
                    
                // 통신 성공 - 네트워크 연결
                case .success:
                    if let value = response.result.value {
                        
                        if let status = response.response?.statusCode {
                            switch status {
                            case 200:
                                do {
                                    let decoder = JSONDecoder()
                                    print("value", value)
                                    let result = try decoder.decode(ResponseString2.self, from: value)
                                    
                                    // ResponseString에 있는 success로 분기 처리
                                    switch result.success {
                                        
                                    case true: // 진짜 회원가입 성공인 경우
                                        print("success")
                                        completion(.success(result.data)) // NetworkResult 에서 접근
                                    case false:
                                        completion(.requestErr(result.message))
                                    }
                                }
                                catch {
                                    completion(.pathErr)
                                    print(error.localizedDescription)
                                    print(APIConstants.SignupURL)
                                }
                            case 400:
                                completion(.pathErr)
                            case 500:
                                completion(.serverErr)
                            default:
                                break
                            }// switch
                        }// if let
                    }
                    break
                    
```
- 서버로 request 전송 - http 비동기 통신 라이브러리 : 함수가 호출된 순차적으로 진행됨

<br/>


4. Connect with SigninViewController

```swift
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
```
- VC 에서 id, pwd, name, email 을 받아 와 SignupService 를 호출한다.


<br/>


# 05_GS25_WITHSOPT

1. Kingfisher 로 QR image load


```swift
import Kingfisher


  let url = URL(string: "http://files.itworld.co.kr/archive/image/2016/10/qr-code-give-me-up-100725354-medium.jpg")
        
  let qrImageView = UIImageView()
  qrImageView.kf.setImage(with: url)
  
  self.view.addSubview(qrImageView)
        
```

<img src="/screenshots/05_1.png" width="200" height="430">


<br/> 



2. ScrollView + StackView 로 mypage 구현
 
 
<img src="/screenshots/05_2.png" width="200" height="430">  <img src="/screenshots/05_3.png" width="200" height="430"> 


<br/>


3. 서버와 합동 세미나 - Table View 로 주문 화면 구현
 
```swift
var dataSet = [DataClass]() // cell 에 들어갈 데이터 저장 배열

extension OrderViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSet.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell", for: indexPath) as? DataTableViewCell else { return UITableViewCell() }
        
        cell.productName.text = "\(dataSet[indexPath.row].name)"
        cell.productPrice.text = "\(dataSet[indexPath.row].price) 원"
        cell.productCreatedAt.text = "\(dataSet[indexPath.row].create_time)"

        let urlStr = dataSet[indexPath.row].image_url
        let url = URL(string: urlStr)
        
        cell.productImageView.kf.setImage(with: url)
         
        return cell
    }    
}

```

```swift
import Foundation
import UIKit

class DataTableViewCell: UITableViewCell {
    
    @IBOutlet weak var productImageView: UIImageView!
    
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productCreatedAt: UILabel!
    
    @IBOutlet weak var reserveButton: UIButton!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

```

<img src="/screenshots/05_4.png" width="200" height="430"> 
