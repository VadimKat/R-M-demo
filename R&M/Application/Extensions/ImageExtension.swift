//
//  ImageExtension.swift
//  R&M
//
//  Created by Vadim Katenin on 12.03.2020.
//  Copyright © 2020 Vadim Katenin. All rights reserved.
//

import UIKit

extension UIImageView {
    func download(_ urlString: String) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let imageData = data, let image = UIImage(data: imageData) else { return }
            DispatchQueue.main.async {
                self.image = image
            }
        }.resume()
    }
}
