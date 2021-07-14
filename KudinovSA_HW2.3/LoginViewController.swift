//
//  ViewController.swift
//  KudinovSA_HW2.3
//
//  Created by Сергей Кудинов on 15.07.2021.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    let userData: [String: String] = ["login": "User",
                                      "password": "Password"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        
        if usernameTF.text == userData["login"] {
            welcomeVC.username = usernameTF.text ?? ""
        } else {return}
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func loginButton() {
        if usernameTF.text == userData["login"] && passwordTF.text == userData["password"] {
            performSegue(withIdentifier: "welcomeScreenSegue", sender: nil)
        } else {
            let title = "Data was wrong"
            let message = "Login/Password is incorect"
            
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default) { _ in
                self.passwordTF.text = ""
            }
            
            self.view.endEditing(true)
            
            alert.addAction(okAction)
            present(alert, animated: true)
        }
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        usernameTF.text = ""
        passwordTF.text = ""
    }
}

