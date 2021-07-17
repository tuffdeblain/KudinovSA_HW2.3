//
//  WelcomeViewController.swift
//  KudinovSA_HW2.3
//
//  Created by Сергей Кудинов on 15.07.2021.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!

    var username = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Hello, \(username)!😀"
    }
}
