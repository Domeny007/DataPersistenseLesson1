import UIKit

class RegistrationViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var surnameTextField: UITextField!
    
    @IBOutlet weak var genderTextField: UITextField!
    
    @IBOutlet weak var numberTextField: UITextField!
    
    @IBOutlet weak var ageTextField: UITextField!
    
    @IBOutlet weak var bornCityTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet var generalView: UIView!
    
    var passwordArray: [String] = []
    var numberArray: [String] = []
    var emailArray: [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardOnTap(#selector(self.dismissKeyboard))
        
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    

    @IBAction func registerButtonPressed(_ sender: Any) {
        let userNumber = numberTextField.text!
        let userEmail = emailTextField.text!
        let userPassword = passwordTextField.text!
        
        
        if (userNumber.isEmpty) || (userEmail.isEmpty) || (userPassword.isEmpty) || (nameTextField.text?.isEmpty)! || (surnameTextField.text?.isEmpty)! || (genderTextField.text?.isEmpty)! || (ageTextField.text?.isEmpty)! || (bornCityTextField.text?.isEmpty)!  {
            displayMyAlertMessage(userMessage: "All Fields are required")
        } else {
            UserDefaults.standard.set(userNumber, forKey: "User number")
            UserDefaults.standard.set(userEmail, forKey: "User emails")
            UserDefaults.standard.set(userPassword, forKey: "User password")
            UserDefaults.standard.synchronize()
            performSegue(withIdentifier: "loginIdentefier", sender: nil)
        }
     }
    
    func displayMyAlertMessage(userMessage : String) {
        let myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default, handler: nil)
        myAlert.addAction(okButton)
        present(myAlert, animated: true, completion: nil)
    }
}
