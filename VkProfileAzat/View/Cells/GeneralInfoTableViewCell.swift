import UIKit

class GeneralInfoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var contentLabel: UILabel!
    func prepareGeneralCell(with item: MainInfo) {
        nameLabel.text = item.name
        contentLabel.text = item.info
        nameLabel.textColor = UIColor.lightGray
    }
}
