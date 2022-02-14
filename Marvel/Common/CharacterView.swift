//
//  CharacterView.swift
//  OpenBank_Assignment
//
//  Created by Piyush Daryapurkar on 08/02/22.
//  Copyright © 2022 Piyush Daryapurkar. All rights reserved.
//

import UIKit

extension UIView {
    
    func addShadow(shadowColor: CGColor = UIColor.gray.cgColor,
                   shadowOffset: CGSize = CGSize(width:1, height:1),
                   shadowOpacity: Float = 1.0,
                   shadowRadius: CGFloat = 5.0) {
        layer.shadowColor = shadowColor
        layer.shadowOffset = shadowOffset
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
        layer.masksToBounds = false
    }
    
    func applyTopRoundedCornersView(cornerRadius:CGFloat = 16.0, borderWidth:CGFloat = 0.1, borderColor:CGColor = UIColor.black.cgColor) {
        self.layer.masksToBounds = true
        self.layer.borderColor = borderColor
        self.layer.borderWidth = borderWidth
        self.layer.cornerRadius = cornerRadius
    }
}
