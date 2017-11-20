import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailOrNumberTextField: UITextField!
    let wrongString = "Wrong login or password"
    let emailsKey = "User emails"
    let passwordKey = "User password"
    let numberKey = "User number"
    let enterIdentefier = "EnterIdentefier"
    let alertTitle = "Alert"
    let okTitle = "Ok"
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardOnTap(#selector(self.dismissKeyboard))
        
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        let userEmailOrNumber = emailOrNumberTextField.text
        let userPassword = passwordTextField.text
        
        let userEmailStored = UserDefaults.standard.string(forKey: emailsKey)
        let userPasswordStored = UserDefaults.standard.string(forKey: passwordKey)
        let userNumberStored = UserDefaults.standard.string(forKey: numberKey)
        
        if userEmailOrNumber == userEmailStored ||  userEmailOrNumber == userNumberStored {
            if userPassword == userPasswordStored {
            performSegue(withIdentifier: enterIdentefier, sender: nil)
            } else {
            displayMyAlertMessage(userMessage: wrongString)
            }
        } else {
            displayMyAlertMessage(userMessage: wrongString)
        }
        
    }
    func displayMyAlertMessage(userMessage : String) {
        let myAlert = UIAlertController(title: alertTitle, message: userMessage, preferredStyle: .alert)
        let okButton = UIAlertAction(title: okTitle, style: .default, handler: nil)
        myAlert.addAction(okButton)
        present(myAlert, animated: true, completion: nil)
    }
}
