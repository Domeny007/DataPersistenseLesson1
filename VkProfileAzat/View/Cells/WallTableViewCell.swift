//
//  WallTableViewCell.swift
//  VkProfileAzat
//
//  Created by Азат Алекбаев on 09.10.2017.
//  Copyright © 2017 Азат Алекбаев. All rights reserved.
//

import UIKit

class WallTableViewCell: UITableViewCell {
    
    @IBOutlet weak var avatarImageView: UIImageView!
    
    @IBOutlet weak var nameAndSurenameLabel: UILabel!
    @IBOutlet weak var dateOfPostLabel: UILabel!
    @IBOutlet weak var postTextView: UITextView!
    
    @IBOutlet weak var likeNumberLabel: UILabel!
    
    @IBOutlet weak var commentNumberLabel: UILabel!
    @IBOutlet weak var repostNumberLabel: UILabel!
    
    @IBOutlet weak var avatarImageViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var wallImageVerticalConstraint: NSLayoutConstraint!
   
    @IBOutlet weak var wallImageView: UIImageView!
    func prepareCell(with news: News, and user:User) {
        postTextView.text = news.wallText
        likeNumberLabel.text = news.likeNumber
        commentNumberLabel.text = news.commentNumber
        repostNumberLabel.text = news.repostNumber
        avatarImageView.image = user.avatar
        nameAndSurenameLabel.text = user.name
        dateOfPostLabel.text = news.dataString
        getCircledImage(with: avatarImageView, and: user)
        wallImageView.image = news.wallImage
        
        if postTextView.text.isEmpty {
            postTextView.isHidden = true
             wallImageVerticalConstraint.priority = UILayoutPriority.defaultHigh
        }
            if wallImageView.image == nil {
                wallImageView.isHidden = true
                avatarImageViewBottomConstraint.priority = UILayoutPriority.defaultHigh
        }
        
    }
    func getCircledImage(with image: UIImageView,and user: User) {
        image.image = user.avatar
        image.layer.borderWidth=1.0
        image.layer.masksToBounds = false
        image.layer.borderColor = UIColor.white.cgColor
        image.layer.cornerRadius = image.frame.size.height/2
        image.clipsToBounds = true
    }
}
