import UIKit

class EducationTableViewCell: UITableViewCell {
    
    @IBOutlet weak var studiedLocation: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    func prepareCell(with item: Education) {
        studiedLocation.text = item.name
        nameLabel.text = item.type
        studiedLocation.sizeToFit()
        nameLabel.textColor = UIColor.lightGray
    }
}
