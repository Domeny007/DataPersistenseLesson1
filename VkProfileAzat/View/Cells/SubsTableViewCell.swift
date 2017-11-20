import UIKit

class SubsTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var avatarImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var onlineStatusImageView: UIImageView!
    
    let getRandomOnlineStatusName = "Image\(arc4random_uniform(3) + 1000).png"
        
        func prepareCell(with subscriber:Subscriber) {
            
            avatarImageView.image = subscriber.avatar
            onlineStatusImageView.image = subscriber.onlineStatus
            nameLabel.text = subscriber.name
            avatarImageView.layer.borderWidth=1.0
            avatarImageView.layer.masksToBounds = false
            avatarImageView.layer.borderColor = UIColor.white.cgColor
            avatarImageView.layer.cornerRadius = avatarImageView.frame.size.height/2
            avatarImageView.clipsToBounds = true
    }
}
