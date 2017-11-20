import UIKit

class WallViewController: UIViewController,UITextViewDelegate {
    
    @IBOutlet weak var wallTextView: UITextView!
    let primaryNumber:String = "0"
    let dataString = "9 окт 2017"
    
    var workWithNews: WorkWithData!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        wallTextView.delegate = self
        workWithNews = WorkWithNews()
    }
    
    //    MARK: - Done Button Pressed
    @IBAction func doneButtonPressed(_ sender: Any) {
        guard let generalText = wallTextView.text, let wallImage = UIImage(named: "Image\(arc4random_uniform(4) + 1).png") else {return}
        let news = News(wallText: generalText, likeNumber: primaryNumber, commentNumber: primaryNumber, repostNumber: primaryNumber, dataString: dataString,wallImage: wallImage)
        workWithNews.asyncSaveNews(with: news) { [weak self](saved) in
            guard let strongSelf = self else { return }
            if saved == true {
                strongSelf.newsTransferDelegate?.createNews(with: news)
            }
        }
       self.navigationController?.popToRootViewController(animated: true)
    }
    @IBAction func backButtonPressed(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    var newsTransferDelegate: NewsTransferProtocol?
    

    
    
}
