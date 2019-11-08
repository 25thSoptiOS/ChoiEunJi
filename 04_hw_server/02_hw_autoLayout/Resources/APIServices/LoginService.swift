//
//  LoginService.swift
//  02_hw_autoLayout
//
//  Created by 최은지 on 02/11/2019.
//  Copyright © 2019 최은지. All rights reserved.
//

import Foundation
import Alamofire

class LoginService {
    
    static let shared = LoginService()
    // singleton pattern : 모든 프로그램 생애 주기에서 딱 한 번 생성
    // 모든 파일에서 전역으로 접근 가능
    
    
    // completion handler -> 로그인 함수가 모두 반환이 되고 (response 가 서버로 온 다음에) 실행이 되도록 만듦
    // 비동기 함수 사이에서도 순서를 지정할 수 있음. 실행해야만 탈출 가능. 완전히 함수 값이 반환된 다음에 서버와 통신 가능
    func login(_ id: String, _ pwd: String, completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let header: HTTPHeaders = [
            "Content-Type" : "application/json"
        ]
        
        let body: Parameters = [
            "id": id,
            "pwd": pwd
        ]
        
        // 서버로 request 전송 - http 비동기 통신 라이브러리 : 함수가 호출된 순차적으로 진행됨
        Alamofire.request(APIConstants.LoginURL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header)
            .responseData { response in // response 에 결과값 저장 -> print 해보기
                
                //                print("request", response.request)
                //                print("response", response.response)
                //                print("data", response.data)
                //                print("result", response.result)
                
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
                                    let result = try decoder.decode(ResponseString.self, from: value)
                                    
                                    // ResponseString2에 있는 success로 분기 처리
                                    switch result.success {
                                        
                                    case true: // 진짜 로그인 성공인 경우
                                        print("success")
                                        completion(.success(result.data)) // NetworkResult 에서 접근
                                    case false:
                                        completion(.requestErr(result.message))
                                    }
                                }
                                catch {
                                    completion(.pathErr)
                                    print(error.localizedDescription)
                                    print(APIConstants.LoginURL)
                                }
                            case 400:
                                completion(.pathErr)
                            case 500:
                                completion(.serverErr)
                            default:
                                break
                            }// switch
                        }// iflet
                    }
                    break
                    
                    
               // 네트워크 통신 실패
                case .failure(let err):
                    print(err.localizedDescription)
                    completion(.networkFail)
                    break
                    
                }
        }
    }
    
}



