//
//  CharacterTableViewCell.swift
//  OpenBank_Assignment
//
//  Created by Piyush Daryapurkar on 08/02/22.
//  Copyright © 2022 Piyush Daryapurkar. All rights reserved.
//

import UIKit


class CharacterTableViewCell: UITableViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var characterImageView:UIImageView!
    @IBOutlet weak var characterNameLbl: UILabel!
    @IBOutlet weak var characterDescriptionLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.addShadow()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    // Set All Values To Cell
    func cellConfiguration(character:CharacterModel) {
        
        parentView.applyTopRoundedCornersView()
        characterNameLbl.text = character.name
        if character.description != "" {
            characterDescriptionLbl.isHidden = false
            characterDescriptionLbl.text = character.description
        }
        else {
            characterDescriptionLbl.isHidden = true
        }
        let imageUrl = URL(string:(character.thumbnail.path + "." + character.thumbnail.imageExtension))
        if let imageUrl = imageUrl {
            characterImageView.loadImage(fromURL:imageUrl, placeHolderImage:"no_image")
        }
    }
}
