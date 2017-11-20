import UIKit

class ContactsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var contentLabel: UILabel!
    
    func prepareCell(with item: Contacts) {
        contentLabel.text = item.contact
    }
    
}
