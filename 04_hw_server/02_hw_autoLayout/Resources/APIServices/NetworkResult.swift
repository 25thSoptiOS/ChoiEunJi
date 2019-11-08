//
//  NetworkResult.swift
//  02_hw_autoLayout
//
//  Created by 최은지 on 02/11/2019.
//  Copyright © 2019 최은지. All rights reserved.
//

import Foundation

enum NetworkResult<T>{
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
