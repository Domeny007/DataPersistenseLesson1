import UIKit

class GiftsTableViewCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource {
    
    
    @IBOutlet weak var giftsCollectionView: UICollectionView!
    @IBOutlet weak var giftsLabel: UILabel!
    
    var giftsArray: [UIImage] = [#imageLiteral(resourceName: "gift1"),#imageLiteral(resourceName: "gift2"),#imageLiteral(resourceName: "gift3"),#imageLiteral(resourceName: "gift4")]
    
    
    let giftsCellIdentefier = "GiftsCellIdentefier"
    let nibName = "GiftCollectionViewCell"
    
    let presentString = " подарков"
    override func awakeFromNib() {
        super.awakeFromNib()
        setupDataSourceAndDelegate()
        registerCell()
    }
    
    func registerCell() {
        let giftsNib = UINib(nibName: nibName, bundle: nil)
        giftsCollectionView.register(giftsNib, forCellWithReuseIdentifier: giftsCellIdentefier)
        
    }
    func setupDataSourceAndDelegate() {
        giftsCollectionView.delegate = self
        giftsCollectionView.dataSource = self
    }
    func prepareCell(with item: CoreModelOfGifts) {
        giftsLabel.text = String(item.numberOfPresets) + presentString
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return giftsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: giftsCellIdentefier, for: indexPath) as! GiftCollectionViewCell
        let giftImage = giftsArray[indexPath.row]
        cell.prepareCell(with: giftImage)
        return cell
    }

}
