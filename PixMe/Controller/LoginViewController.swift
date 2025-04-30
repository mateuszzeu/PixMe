//
//  LoginViewController.swift
//  PixMe
//
//  Created by Liza on 27/04/2025.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let loginView = LoginView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = loginView
        setupActions()
    }
    
    private func setupActions() {
        loginView.logInButton.addTarget(self, action: #selector(logInUser), for: .touchUpInside)
        loginView.registerButton.addTarget(self, action: #selector(moveToRegisterView), for: .touchUpInside)
    }
    
    @objc private func logInUser() {
        let nickname = loginView.nicknameField.text ?? ""
        let password = loginView.passwordField.text ?? ""
        
        let success = UserService.authenticateUser(nickname: nickname, password: password)
        
        if success {
            showAlert(title: "Success!", message: "You have logged in!") {
                UserDefaults.standard.set(nickname, forKey: "loggedInNickname")
                
                let mainVC = MainViewController()
                self.navigationController?.setViewControllers([mainVC], animated: true)
            }
        } else {
            showAlert(title: "Error", message: "Incorrect nickname or password.")
        }
    }
    
    @objc private func moveToRegisterView() {
        let registerVC = RegisterViewController()
        navigationController?.pushViewController(registerVC, animated: true)
    }
}
