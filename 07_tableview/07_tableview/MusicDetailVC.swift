//
//  MusicDetailVC.swift
//  07_tableview
//
//  Created by 최은지 on 06/12/2019.
//  Copyright © 2019 최은지. All rights reserved.
//

import UIKit

class MusicDetailVC: UIViewController {
    
    var albumImg: UIImage?
    var musicTitle: String?
    var singer: String?
    
    @IBOutlet weak var albumImgView: UIImageView!
    @IBOutlet weak var musicTitleLabel: UILabel!
    @IBOutlet weak var singerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setContents()

        // Do any additional setup after loading the view.
    }
    
    func setContents(){
        albumImgView.image = albumImg
        musicTitleLabel.text = musicTitle
        singerLabel.text = singer
    }

    

}
