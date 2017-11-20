//
//  GiftCollectionViewCell.swift
//  VkProfileAzat
//
//  Created by Азат Алекбаев on 24.10.2017.
//  Copyright © 2017 Азат Алекбаев. All rights reserved.
//

import UIKit

class GiftCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var giftImageView: UIImageView!
    
    func prepareCell(with image: UIImage)  {
        giftImageView.image = image
    }

}
