//
//  SecondViewController.swift
//  02_hw_autoLayout
//
//  Created by 최은지 on 26/10/2019.
//  Copyright © 2019 최은지. All rights reserved.
//

import UIKit
import CHIPageControl

class SecondViewController: UIViewController {

    @IBOutlet weak var bannerCV: UICollectionView!
//    var bannerList : [Banner] = []
    @IBOutlet weak var paging: CHIPageControlAleppo!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setBanner()
        
        bannerCV.delegate = self
        bannerCV.dataSource = self
        
    }
    
}


extension SecondViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        //        if collectionView == self.workCV {
        //            return appDelegate.workList.count
        //        }
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.bannerList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
      //        if collectionView == self.workCV {
      //            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WorkCell", for: indexPath) as! WorkCell
      //
      //            let work = appDelegate.workList[indexPath.row]
      //
      //            cell.workIdx = work.workIdx
      //            cell.workImg.image = work.workMainImg
      //
      //            return cell
      //        }
      //        else {
                  let bannerCell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCell", for: indexPath) as! BannerCell
                  
                  let banner = appDelegate.bannerList[indexPath.row]
                  bannerCell.banner?.image = banner.bannerImg
                  
                  // bannerCell.banner = bannerList.
                  return bannerCell
      //        }
          }

    }
    
    

extension SecondViewController : UICollectionViewDelegate {
        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            let x = scrollView.contentOffset.x
            let w = scrollView.bounds.size.width
            let currentPage = Int(ceil(x/w))
            print(currentPage)
            self.paging.set(progress: currentPage, animated: true)
        }
}

extension SecondViewController {
    func setBanner() {
        let banner1 = Banner(bannerName: "mainImage")
        let banner2 = Banner(bannerName: "mainImage02")
        let banner3 = Banner(bannerName: "mainImage03")
        
        //guard let delegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let delegate = UIApplication.shared.delegate as! AppDelegate
        
        delegate.bannerList = [banner1, banner2, banner3]
    }
    
    
    
}
