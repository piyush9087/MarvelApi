//
//  CharacterImageView.swift
//  OpenBank_Assignment
//
//  Created by Piyush Daryapurkar on 10/02/22.
//  Copyright © 2022 Piyush Daryapurkar. All rights reserved.
//

import UIKit

private let imageCache = NSCache<AnyObject, UIImage>()

extension UIImageView {
    
    func loadImage(fromURL imageURL: URL, placeHolderImage: String) {
        self.image = UIImage(named: placeHolderImage)
        if let cachedImage = imageCache.object(forKey: imageURL as AnyObject) {
            self.image = cachedImage
            return
        }
        DispatchQueue.global().async { [weak self] in
            if let imageData = try? Data(contentsOf: imageURL) {
                if let image = UIImage(data: imageData) {
                    DispatchQueue.main.async {
                        imageCache.setObject(image, forKey: imageURL as AnyObject)
                        self?.image = image
                    }
                }
            }
        }
    }
}


