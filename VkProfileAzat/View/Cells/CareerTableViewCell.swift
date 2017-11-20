import UIKit

class CareerTableViewCell: UITableViewCell {
    
    @IBOutlet weak var whereIsLabel: UILabel!
    
    @IBOutlet weak var howLongLabel: UILabel!
    
    @IBOutlet weak var whoAreYouLabel: UILabel!
    
    func prepareCell(with item: CoreModelOfCareer) {
        whereIsLabel.text = item.companyName
        howLongLabel.text = item.location
        whoAreYouLabel.text = item.position
        whoAreYouLabel.sizeToFit()
    }
}
