import UIKit

class InfoTableViewController: UITableViewController {
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    @IBAction func ExtraButtonPressed(_ sender: Any) {
        self.delegate?.didPressedExtraButton()
    }
    
    let mainInfoCount = 5
    let contactsCount = 3
    let educationCount = 2
    let threeButtonsCount = 3
    
    var delegate: ActionButtonProtocol?
    
    let mainImageName = "Image\(arc4random_uniform(4) + 1).png"
    
    let statusCellIdentifier = "statusCellIdentifier"
    let statusNibName = "StatusTableViewCell"
    
    let generalCellIdentefier = "generalCellIdentifier"
    let generalNibName = "GeneralInfoTableViewCell"
    
    let contactsCellIdentefier = "contactsCellIdentefier"
    let contactsNibName = "ContactsTableViewCell"
    
    let careerCellIdentefer = "CareerCellIdentefier"
    let careerNibName = "CareerTableViewCell"
    
    let educationCellIdentefier = "EducationCellIdentefier"
    let educationNibName = "EducationTableViewCell"
    
    let giftsCellIdentefer = "GiftsCellIdentefier"
    let giftsNibName = "GiftsTableViewCell"
    
    let threeCellsIdentefer = "ThreeCellsCellIdentefier"
    let threeCellNibName = "ThreeCellsTableViewCell"
    
    var allInfo: [CoreVariables] = []
    
    let basicInfoCellHeight: CGFloat = 50
    let contactsCellHeight: CGFloat = 40
    let careerCellHeight: CGFloat = 80
    let giftsCellHeight: CGFloat = 80
    let defaultCellHeight: CGFloat = 44
    
    var statusArray = ["Hello world", "Hi","ok"]
    var allInfoArray = ["День рождения", "место работы", "Семейное положение", "Языки", "Родители"]
    var mainInfoArray = [ ["2 февраля 1998", "11 сетнября 2002"],
                                 ["ItisIosLab", "Apple"],
                                 ["В активном поиске", "Женат"],
                                 ["Русский", "Английский, Татарча"],
                                 ["Папа, мама", "Иисус Хрестос, Аллах"] ]
    var contactArray = [ ["89999999999", "4823094820"],
                             ["Набережные Челны", "Казань"],
                             ["id24548191", "azat_Space"] ]
    var careerArray = ["ItisIosLab", "Apple"]
    var careerLocationArray = ["Казань, 1812-2017", "СПБ, 202-21018"]
    var careerPositionArray = ["Разработчик", "Программирование"]
    let educationTypeArray = ["Вуз", "Школа"]
    let educationNameArray = [ ["КФУ ВШИТИС", "МГУ", ""],
                               ["Гимназия 61", "Гимназия 26",""] ]
    let giftNumber = 10
    let threeButtonsTitleArray = ["Интересные страницы", "Заметки", "Документы"]
    let threeButtonsCountArray = [["120", "358", "1000"],
                               ["1", "", "81"],
                               ["10", "970", "220"]]
    
    let borderWidth = 1.0
    let maskToBoundsValue = false
    let clipsToBoundsValue = true
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUserInformation()
        registratingWithCells()
        workingWithViewOnTop()
        createRefreshing()
    }
    
    func workingWithViewOnTop() {
        avatarImageView.image = UIImage(named: mainImageName)
        avatarImageView.layer.borderWidth = CGFloat(borderWidth)
        avatarImageView.layer.masksToBounds = maskToBoundsValue
        avatarImageView.layer.borderColor = UIColor.white.cgColor
        avatarImageView.layer.cornerRadius = avatarImageView.frame.size.height/2
        avatarImageView.clipsToBounds = clipsToBoundsValue
        nameLabel.text = getRandomName()
        statusLabel.text = getRandomOnlineOrNotState()
        ageLabel.text = getRandomAgeAndCity()
    }
    
    func registratingWithCells() {
        let statusNib = UINib(nibName: statusNibName, bundle: nil)
        tableView.register(statusNib, forCellReuseIdentifier: statusCellIdentifier)
        
        let generalNib = UINib(nibName: generalNibName, bundle: nil)
        tableView.register(generalNib, forCellReuseIdentifier: generalCellIdentefier)
        
        let contactsNib = UINib(nibName: contactsNibName, bundle: nil)
        tableView.register(contactsNib, forCellReuseIdentifier: contactsCellIdentefier)
        
        let careerNib = UINib(nibName: careerNibName,bundle: nil)
        tableView.register(careerNib, forCellReuseIdentifier: careerCellIdentefer)
        
        let educationNib = UINib(nibName: educationNibName, bundle: nil)
        tableView.register(educationNib, forCellReuseIdentifier: educationCellIdentefier)
        
        let giftsNib = UINib(nibName: giftsNibName, bundle: nil)
        tableView.register(giftsNib, forCellReuseIdentifier: giftsCellIdentefer)
        
        let threeCellsNib = UINib(nibName: threeCellNibName, bundle: nil)
        tableView.register(threeCellsNib, forCellReuseIdentifier: threeCellsIdentefer)
    }
    
    func createUserInformation() {
        // MARK:- create status
        let status = CoreModelOfStatus(status: "\(statusArray[Int(arc4random_uniform(UInt32(statusArray.count)))])")
        allInfo.append(status)
        
        // MARK:- create mainInformation
        var mainInformations = [MainInfo]()
        for i in 0..<mainInfoCount  {
            let mainInfo = MainInfo(name:  "\(allInfoArray[i])",info: "\(mainInfoArray[i][Int(arc4random_uniform(UInt32( mainInfoArray[i].count)))])")
            mainInformations.append(mainInfo)
        }
        allInfo.append(CoreModelOfMainInfo(mainInfo: mainInformations))
        
        // MARK:- create contacts
        var contactInformations = [Contacts]()
        for i in 0..<contactsCount {
            let contactsInfo = Contacts(image: #imageLiteral(resourceName: "Image2"), contact: "\(contactArray[i][Int(arc4random_uniform(UInt32(contactArray[i].count)))])")
            contactInformations.append(contactsInfo)
        }
        allInfo.append(CoreModelOfContacts(contacts: contactInformations))
        
        // MARK:- create career
        let careerInformation = CoreModelOfCareer(companyName: "\(careerArray[Int(arc4random_uniform(UInt32(careerArray.count)))])", location: "\(careerLocationArray[Int(arc4random_uniform(UInt32(careerLocationArray.count)))])", position: "\(careerPositionArray[Int(arc4random_uniform(UInt32(careerPositionArray.count)))])")
        allInfo.append(careerInformation)
        
        // MARK:- create education
        var educationInformations = [Education]()
        for i in 0..<educationCount {
            let educationInformation = Education(name: "\(educationNameArray[i][Int(arc4random_uniform(UInt32(educationNameArray.count)))])" , type: "\(educationTypeArray[i])")
            educationInformations.append(educationInformation)
        }
        allInfo.append(CoreModelOfEducation(educationArray: educationInformations))
        
        // MARK:- create gifts
        let gifts = CoreModelOfGifts(numberOfPresets: 10)
        allInfo.append(gifts)
        
        // MARK:- create threeButtons
        var threeButtonsInformations = [ThreeButtons]()
        for i in 0..<threeButtonsCount{
            let threeButtonInformation = ThreeButtons(name: "\(threeButtonsTitleArray[i])", numbersOfEach: "\(threeButtonsCountArray[i][Int(arc4random_uniform(UInt32(threeButtonsCountArray[i].count)))])" )
            threeButtonsInformations.append(threeButtonInformation)
        }
        allInfo.append(CoreModelofThreeButtons(threeButtons: threeButtonsInformations))
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return allInfo.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return allInfo[section].rowCount
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let info = allInfo[indexPath.section]
        switch info.sectionType {
        case .status:
            let cell = tableView.dequeueReusableCell(withIdentifier: statusCellIdentifier, for: indexPath) as! StatusTableViewCell
            cell.prepareStatusCell(with: info as! CoreModelOfStatus)
            return cell
        
        case .mainInfo:
            let cell = tableView.dequeueReusableCell(withIdentifier: generalCellIdentefier, for: indexPath) as! GeneralInfoTableViewCell
            let mainInfoModel = info as! CoreModelOfMainInfo
            cell.prepareGeneralCell(with: mainInfoModel.mainInfo[indexPath.row])
            return cell
            
        case .career:
            let cell = tableView.dequeueReusableCell(withIdentifier: careerCellIdentefer, for: indexPath) as! CareerTableViewCell
            cell.prepareCell(with: info as! CoreModelOfCareer)
            return cell
            
        case .education:
            let cell = tableView.dequeueReusableCell(withIdentifier: educationCellIdentefier, for: indexPath) as! EducationTableViewCell
            let educationInfoModel = info as! CoreModelOfEducation
            cell.prepareCell(with: educationInfoModel.educationArray[indexPath.row])
            return cell
            
        case .gifts:
            let cell = tableView.dequeueReusableCell(withIdentifier: giftsCellIdentefer, for: indexPath) as!
            GiftsTableViewCell
            cell.prepareCell(with: info as! CoreModelOfGifts)
            return cell
            
        case .threeButtons:
            let cell = tableView.dequeueReusableCell(withIdentifier: threeCellsIdentefer, for: indexPath) as!
            ThreeCellsTableViewCell
            let threeButtonsInfoModel = info as! CoreModelofThreeButtons
            cell.prepareCell(with: threeButtonsInfoModel.threeButtons[indexPath.row])
            return cell
            
        case .contacts:
            let cell = tableView.dequeueReusableCell(withIdentifier: contactsCellIdentefier, for: indexPath) as!
            ContactsTableViewCell
            let contactsInfoModel = info as! CoreModelOfContacts
            cell.prepareCell(with: contactsInfoModel.contacts[indexPath.row])
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let info = allInfo[indexPath.section]
        switch info.sectionType {
        case .mainInfo:
            return basicInfoCellHeight
            
        case .contacts:
            return contactsCellHeight
            
        case .career:
            return careerCellHeight
            
        case .gifts:
            return giftsCellHeight
            
        default:
            return defaultCellHeight
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let info = allInfo[section]
            return info.sectionName
    }
    
    @objc func RefreshControl(_ refreshControl: UIRefreshControl) {
        allInfo.removeAll()
        createUserInformation()
        self.tableView.reloadData()
        refreshControl.endRefreshing()
    }
    
    func createRefreshing() {
        refreshControl?.addTarget(self, action: #selector(InfoTableViewController.RefreshControl(_:)), for: .valueChanged)
    }
}
