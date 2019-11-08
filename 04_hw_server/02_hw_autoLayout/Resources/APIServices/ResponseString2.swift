//
//  ResponseString2.swift
//  02_hw_autoLayout
//
//  Created by 최은지 on 02/11/2019.
//  Copyright © 2019 최은지. All rights reserved.
//

import Foundation

// MARK: - ResponseString
// 성공했을 때 response body
struct ResponseString2: Codable {
    let success: Bool
    let message: String
    let data: Int
}
