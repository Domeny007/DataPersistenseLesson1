import UIKit

class ThreeCellsTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var numberLabel: UILabel!
    
    func prepareCell(with item: ThreeButtons) {
        nameLabel.text = item.name
        numberLabel.text = item.numbersOfEach
        numberLabel.textColor = UIColor.lightGray
    }
}
