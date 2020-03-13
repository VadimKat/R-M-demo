//
//  PageVC.swift
//  R&M
//
//  Created by Vadim Katenin on 13.03.2020.
//  Copyright © 2020 Vadim Katenin. All rights reserved.
//

import UIKit

class PageVC: UIPageViewController {
    
    var images = ["Hello1", "Hello2", "Hello3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        
        if let firstVC = displayViewController(atIndex: 0) {
            setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
    }
    
    func displayViewController(atIndex index: Int) -> ContentForPageVC? {
        guard index >= 0 else { return nil }
        guard index < images.count else { return nil }
        guard let contentVC = storyboard?.instantiateViewController(identifier: "contentVC") as? ContentForPageVC else {
            return nil}
        contentVC.image = images[index]
        contentVC.index = index
        return contentVC
    }
    
    func nextVC(atIndex index: Int) {
        if let contentVC = displayViewController(atIndex: index + 1) {
            setViewControllers([contentVC], direction: .forward, animated: true, completion: nil)
        }
    }
}

extension PageVC: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! ContentForPageVC).index
        index -= 1
        return displayViewController(atIndex: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! ContentForPageVC).index
        index += 1
        return displayViewController(atIndex: index)
    }
    
}
