//
//  Banner.swift
//  02_hw_autoLayout
//
//  Created by 최은지 on 26/10/2019.
//  Copyright © 2019 최은지. All rights reserved.
//

import Foundation
import UIKit

struct Banner {
    var bannerImg: UIImage?
    
    init(bannerName: String){
        self.bannerImg = UIImage(named: bannerName)
    }
}
