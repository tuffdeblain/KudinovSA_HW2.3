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

    private let username = "User"
    private let password = "Password"

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }

        welcomeVC.username = usernameTF.text ?? ""
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }

    @IBAction func loginButton() {
        if usernameTF.text == username && passwordTF.text == password {
            performSegue(withIdentifier: "welcomeScreenSegue", sender: nil)
        } else {
            let title = "Data was wrong"
            let message = "Login/Password is incorect"

            getAlert(title: title, message: message)
        }
    }

    @IBAction func forgotRegisterData(_ sender: UIButton) {
        sender.tag == 0
            ? getAlert(title: "Oops!", message: "Your name is \(username)")
            : getAlert(title: "Oops!", message: "Your password is \(password)")
    }

    @IBAction func unwind(for segue: UIStoryboardSegue) {
        usernameTF.text = ""
        passwordTF.text = ""
    }

    func getAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.passwordTF.text = ""
        }

        view.endEditing(true)

        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
