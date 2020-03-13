//
//  ContentForPageVC.swift
//  R&M
//
//  Created by Vadim Katenin on 13.03.2020.
//  Copyright © 2020 Vadim Katenin. All rights reserved.
//

import UIKit

class ContentForPageVC: UIViewController {
    
    var image = ""
    var index = 0
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var nextPageButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: image)
        pageController.numberOfPages = 3
        pageController.currentPage = index
        
        switch index {
        case 0:
            nextPageButton.setImage(UIImage(named: "Next"), for: .normal)
        case 1:
            nextPageButton.setImage(UIImage(named: "Next"), for: .normal)
        case 2:
            nextPageButton.setImage(UIImage(named: "GetStarted"), for: .normal)
            
        default:
            break
        }
    }
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        switch index {
        case 0:
            let pageVC = parent as! PageVC
            pageVC.nextVC(atIndex: index)
        case 1:
            let pageVC = parent as! PageVC
            pageVC.nextVC(atIndex: index)
        case 2:
            let userDefault = UserDefaults.standard
            userDefault.set(true, forKey: "wasIntroWatched")
            userDefault.synchronize()
            
            dismiss(animated: true) 
        default: break
        }
    }
    
}

