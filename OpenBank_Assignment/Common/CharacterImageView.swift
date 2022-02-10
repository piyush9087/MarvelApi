//
//  CharacterImageView.swift
//  OpenBank_Assignment
//
//  Created by Piyush Daryapurkar on 10/02/22.
//  Copyright © 2022 Piyush Daryapurkar. All rights reserved.
//

import UIKit

class CharacterImageView: UIImageView {
    
    private let imageCache = NSCache<AnyObject, UIImage>()
        
    func loadImage(fromURL imageURL: URL, placeHolderImage: String) {
        self.image = UIImage(named: placeHolderImage)
        if let cachedImage = self.imageCache.object(forKey: imageURL as AnyObject) {
            self.image = cachedImage
            return
        }
        DispatchQueue.global().async { [weak self] in
            if let imageData = try? Data(contentsOf: imageURL) {
                if let image = UIImage(data: imageData) {
                    DispatchQueue.main.async {
                        self!.imageCache.setObject(image, forKey: imageURL as AnyObject)
                        self?.image = image
                    }
                }
            }
        }
    }
}
