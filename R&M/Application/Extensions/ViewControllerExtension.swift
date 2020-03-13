//
//  ViewControllerExtention.swift
//  R&M
//
//  Created by Vadim Katenin on 13.03.2020.
//  Copyright © 2020 Vadim Katenin. All rights reserved.
//

import UIKit

extension UIViewController {
    func setNavigationItem() {
        let imageView = UIImageView(image: UIImage(named: "logo"))
        let item = UIBarButtonItem(customView: imageView)
        self.navigationItem.leftBarButtonItem = item
    }
}

