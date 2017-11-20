import UIKit

class StatusTableViewCell: UITableViewCell {

    @IBOutlet weak var statusLabel: UILabel!
    
    func prepareStatusCell(with item: CoreModelOfStatus) {
        statusLabel.text = item.status

        statusLabel.textColor = UIColor.lightGray
    }
}
