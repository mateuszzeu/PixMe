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
            let successAlert = UIAlertController(title: "Success!", message: "You have logged in!", preferredStyle: .alert)
            successAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                let mainVC = MainViewController()
                mainVC.modalPresentationStyle = .fullScreen
                self.present(mainVC, animated: true)
            }))
            present(successAlert, animated: true)
        } else {
            let errorAlert = UIAlertController(title: "Error", message: "Incorrect nickname or password.", preferredStyle: .alert)
            errorAlert.addAction(UIAlertAction(title: "OK", style: .default))
            present(errorAlert, animated: true)
        }
    }
    
    @objc private func moveToRegisterView() {
        let registerVC = RegisterViewController()
        registerVC.modalPresentationStyle = .fullScreen
        present(registerVC, animated: true)
    }
}
