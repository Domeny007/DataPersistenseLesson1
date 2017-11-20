import UIKit

class ViewController: UIViewController,ActionButtonProtocol,NewsTransferProtocol,UITableViewDataSource,UITableViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource {
    
    
    @IBOutlet weak var navigationBar: UINavigationItem!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var myNameLabel: UILabel!
    
    @IBOutlet weak var onlineLabel: UILabel!
    
    @IBOutlet weak var ageCityLabel: UILabel!
    
    @IBOutlet weak var infoButton: UIButton!
    
    @IBOutlet weak var numberOfPhotoLabelInView: UILabel!
    
    @IBOutlet weak var photoLibraryButton: UIButton!
    
    
    @IBOutlet weak var writingButton: UIButton!
    
    @IBOutlet weak var photoForWallButton: UIButton!
    
    @IBOutlet weak var locationButton: UIButton!
    
    
    @IBOutlet weak var generalImage: UIImageView!

    @IBOutlet weak var collectionViewForMainButtons: UICollectionView!
    
    @IBOutlet weak var collectionViewForPhotos: UICollectionView!
    
    @IBOutlet weak var mainTableView: UITableView!
    
    let firstInt = 1
    
    let borderWidth = 0.5
    let sizeNum:CGFloat = 12
    let pixString = " фотографий"
    let wrapping = "\n"
    
    var wallNibName = "WallTableViewCell"
    let customCollectionViewCellNibName = "PhotosCollectionViewCell"
    var wallCellIdentefier = "wallCellIdentefier"
    var createNewsIdentefier = "createNewsIdentefier"
    let photoCollectionViewCellIdentefier = "PhotosCollectionViewIdentefier"
    let mainButtonsCollectionViewCellIdentefier = "MainButtonsIdentefier"
    
    let editProfileString = "Редактировать профиль"
    let copyLinkString = "Скопировать ссылку"
    let shareString = "Поделиться..."
    let cancelString = "Отмена"
    let emptyString = ""
    
    let wallText1 = ""
    let wallText2 = "Не хочу идти в школу"
    let wallText3 = "Пошли гулять"
    
    var avatar: UIImage = UIImage()
    var name: String = ""
    let randomNumber = (arc4random_uniform(50) + 1)
    
    var fromMainToInfoIdentefier = "fromMainToInfo"
    
    var user: User!
    

    var news:[News] = []
    let randomWallImage = "Image\(arc4random_uniform(4) + 1).png"
    
    let photoArray: [String] = ["Image1","Image2","Image3","Image4"]
    
    let buttonsNumberArray: [String]  = ["10","20","30","40","50","60","70","80"]
    let buttonsNamesArray: [String] = ["друзей","подписчик","групп","фото","видео","аудио","подарков","файл"]
    
    let jpgExtension = ".JPG"
    
    let subsIdentefier = "SubsIdentefier"
    
    var createdNewsArray:[News] = []
    
    var workWithNews: WorkWithData!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        workWithNews = WorkWithNews()
        setupLabel()
        registerNib()
        createMainUser()
        createWallNews()
        saveNews(with: createdNewsArray)
        createCustomWeightOfCell()
        registerCustomCollectionViewCell()
        createRefreshing()
        getNews()
        
    }
    func createCustomWeightOfCell() {
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    //    MARK: creating wall news
    func createWallNews() {
        
        let wallNews1 = News(wallText: wallText1, likeNumber: "10", commentNumber: "20", repostNumber: "30", dataString: "18 июл 2017 ", wallImage: #imageLiteral(resourceName: "Image3"))
        let wallNews2 = News(wallText: wallText2, likeNumber: "1", commentNumber: "100", repostNumber: "110", dataString: "2 фев 1998", wallImage: #imageLiteral(resourceName: "Image2"))
        let wallNews3 = News(wallText: wallText3, likeNumber: "", commentNumber: "1000", repostNumber: "1", dataString: "19 сен 2018", wallImage: #imageLiteral(resourceName: "Image1"))
            
        createdNewsArray.append(wallNews1)
        createdNewsArray.append(wallNews2)
        createdNewsArray.append(wallNews3)
    }
    
   func saveNews(with news: [News]) {
        for i in 0..<news.count {
        workWithNews.syncSaveNews(with: news[i])
       }
    }
    //    MARK: ActionButtonProtocol
    func didPressedExtraButton() {
        let alertController = UIAlertController(title: nil, message: nil , preferredStyle: .actionSheet)
        let editButton = UIAlertAction(title: editProfileString, style: .default, handler: nil)
        let copyLinkButton = UIAlertAction(title: copyLinkString, style: .default, handler: nil)
        let shareButton = UIAlertAction(title: shareString, style: .default, handler: nil)
        let cancelButton = UIAlertAction(title: cancelString, style: .cancel, handler: nil)
        alertController.addAction(editButton)
        alertController.addAction(copyLinkButton)
        alertController.addAction(shareButton)
        alertController.addAction(cancelButton)
        present(alertController, animated: true, completion: nil)
    }
    func createMainUser() {
        myNameLabel.text = getRandomName()
        onlineLabel.text = getRandomOnlineOrNotState()
        onlineLabel.textColor = UIColor.lightGray
        ageCityLabel.text = getRandomAgeAndCity()
        ageCityLabel.textColor = UIColor.lightGray
        generalImage.image = UIImage(named: "Image\(arc4random_uniform(4) + 1).png")
        generalImage.layer.borderWidth=1.0
        generalImage.layer.masksToBounds = false
        generalImage.layer.borderColor = UIColor.white.cgColor
        generalImage.layer.cornerRadius = generalImage.frame.size.height/2
        generalImage.clipsToBounds = true
    }
    
    func getNews() {
        news = workWithNews.syncGetAllNews()
    }
    
    func setupLabel() {
        numberOfPhotoLabelInView.textColor = UIColor.lightGray
        numberOfPhotoLabelInView.text = buttonsNumberArray[3] + pixString
    }
    
    //    MARK: NewsTransfeerProtocol
    func createNews(with newsData: News) {
        news.append(newsData)
        tableView.reloadData()
        workWithNews.syncSaveNews(with: newsData)
    }
    //    MARK:- workingWithButtons function
    func registerNib() {
        let wallNib = UINib(nibName: wallNibName, bundle: nil)
        mainTableView.register(wallNib, forCellReuseIdentifier: wallCellIdentefier)
    }
    func registerCustomCollectionViewCell() {
        let customCollectionViewCellNib = UINib(nibName: customCollectionViewCellNibName, bundle: nil)
        self.collectionViewForPhotos.register(customCollectionViewCellNib, forCellWithReuseIdentifier: photoCollectionViewCellIdentefier)
    }
    
    // MARK: extra options button action
    @IBAction func extraOptionsButtomPressed(_ sender: Any) {
        didPressedExtraButton()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if  segue.identifier == fromMainToInfoIdentefier{
        let destinationVC = segue.destination as! InfoTableViewController
        destinationVC.delegate = self
        } else {
            if segue.identifier ==  createNewsIdentefier {
                let wallDestinationVC = segue.destination as! WallViewController
                wallDestinationVC.newsTransferDelegate = self
            }
        }
    }
    
        // MARK:- working with table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: wallCellIdentefier, for: indexPath) as! WallTableViewCell
        
        guard let avatar = generalImage.image, let name = myNameLabel.text else {return cell}
        let user = User(avatar: avatar , name: name, ageAndeCity: emptyString)
        cell.prepareCell(with: news[indexPath.row],and: user)
        return cell
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    //    MARK:- working with collection view
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionViewForPhotos {
            return photoArray.count
        }
        if collectionView == collectionViewForMainButtons {
            return buttonsNamesArray.count
        }
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collectionViewForPhotos {
            let cell = collectionViewForPhotos.dequeueReusableCell(withReuseIdentifier: photoCollectionViewCellIdentefier, for: indexPath) as! PhotosCollectionViewCell
            cell.photosImageView.image = UIImage(named: photoArray[indexPath.row] + jpgExtension)
            return cell
        } else if collectionView == collectionViewForMainButtons {
            let cell = collectionViewForMainButtons.dequeueReusableCell(withReuseIdentifier: mainButtonsCollectionViewCellIdentefier, for: indexPath) as! ButtonsCollectionViewCell
            cell.numberOfSomethingLabel.text = buttonsNumberArray[indexPath.row]
            cell.nameOfsomethingLabel.text = buttonsNamesArray[indexPath.row]
            return cell
            }
        return UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == firstInt && collectionView == collectionViewForMainButtons {
            performSegue(withIdentifier: subsIdentefier , sender: nil)
        }
        
    }
    @objc func RefreshControl(_ refreshControl: UIRefreshControl) {
        news = workWithNews.syncGetAllNews()
        tableView.reloadData()
        refreshControl.endRefreshing()
    }
    func createRefreshing() {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(ViewController.RefreshControl(_:)), for: .valueChanged)
        tableView.addSubview(refreshControl)
    }
}

func getRandomName() -> String {
    var names: Array = ["Michael Jackson", "Stephen Hawking", "Justin Bieber", "Justin Timberlake", "Азат Алекбаев"]
    let length = names.count
    let randomNameNumber = arc4random_uniform(UInt32(length))
    let randomName = names.remove(at: Int(randomNameNumber))
    return randomName
}

func getRandomOnlineOrNotState() -> String {
    var tempArray: Array = ["online (моб.)" , "заходил 8 минут назад", "заходил 1 год назад", "заходил 1 минуту назад"]
    let length = tempArray.count
    let randomStateNumber = arc4random_uniform(UInt32(length))
    let randomState = tempArray.remove(at: Int(randomStateNumber))
    return randomState
}

func getRandomAgeAndCity() -> String {
    var tempArray: Array = ["100 лет, Набережные Челны", "30 лет, Казань", "19 лет, Казань", "10 лет, Днепропетровск"]
    let length = tempArray.count
    let randomStateNumber = arc4random_uniform(UInt32(length))
    let randomState = tempArray.remove(at: Int(randomStateNumber))
    return randomState
}

