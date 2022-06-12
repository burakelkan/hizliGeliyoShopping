//
//  LoginViewController.swift
//  hizliGeliyoShopping
//
//  Created by Yusuf Burak Elkan on 09.06.2022.
//

import UIKit
protocol LoginViewInterface: AnyObject {
    func prepareUI()
}

class LoginViewController: UIViewController {
    
    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    var presenter: LoginPresenterInterface!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidload()
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        if mailTextField.text == "hizligeliyo" && passwordTextField.text == "123" {
            let mainTabController = BaseViewController()
            mainTabController.modalPresentationStyle = .fullScreen
            present(mainTabController, animated: true, completion: nil)
        }
        else {
          
            let alert = UIAlertController(title: "Hata", message: "E Posta ve yada şifrenizi hatalı girdiniz!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            Logger.log(text: alert.message ?? "")
            DispatchQueue.main.async {
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
}
extension LoginViewController: LoginViewInterface {
    func prepareUI() {
        mailTextField.makeRoundedAndShadow()
        passwordTextField.makeRoundedAndShadow()
        loginButton.layer.cornerRadius = loginButton.bounds.height / 2
    }
}
