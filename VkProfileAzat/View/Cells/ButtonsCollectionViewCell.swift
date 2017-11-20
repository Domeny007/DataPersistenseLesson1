//
//  ButtonsCollectionViewCell.swift
//  VkProfileAzat
//
//  Created by Азат Алекбаев on 22.10.2017.
//  Copyright © 2017 Азат Алекбаев. All rights reserved.
//

import UIKit

class ButtonsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var numberOfSomethingLabel: UILabel!
    
    @IBOutlet weak var nameOfsomethingLabel: UILabel!
    
    func prepareCell() {
        nameOfsomethingLabel.sizeToFit()
        
    }
}
