//
//  MusicCell.swift
//  07_tableview
//
//  Created by 최은지 on 06/12/2019.
//  Copyright © 2019 최은지. All rights reserved.
//

import UIKit

class MusicCell: UITableViewCell {
    
    // MusicTable - MusicCell - ContentView - Album
      @IBOutlet var albumImg: UIImageView!
      // MusicTable - MusicCell - ContentView - Title
      @IBOutlet var musicTitle: UILabel!
      // MusicTable - MusicCell - ContentView - Singer
      @IBOutlet var singer: UILabel!
      


    override func awakeFromNib() { // 객체 초기화
        super.awakeFromNib()
        
        albumImg.layer.cornerRadius = 3
        albumImg.layer.masksToBounds = true

        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
