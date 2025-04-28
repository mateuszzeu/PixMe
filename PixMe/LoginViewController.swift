//
//  LoginViewController.swift
//  PixMe
//
//  Created by Liza on 27/04/2025.
//

import UIKit

class LoginViewController: UIViewController {
    
    let nicknameField = UITextField()
    let passwordField = UITextField()
    let logInButton = UIButton(type: .system)
    let registerButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
    }
    
    private func setupUI() {
        view.addSubview(nicknameField)
        view.addSubview(passwordField)
        view.addSubview(logInButton)
        view.addSubview(registerButton)
        
        nicknameField.translatesAutoresizingMaskIntoConstraints = false
        nicknameField.borderStyle = .roundedRect
        nicknameField.returnKeyType = .next
        nicknameField.attributedPlaceholder = NSAttributedString(
            string: "Write your nickname...",
            attributes: [
                .font: UIFont.systemFont(ofSize: 15),
                .foregroundColor: UIColor.secondaryLabel.withAlphaComponent(0.25)
            ]
        )
        
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.borderStyle = .roundedRect
        passwordField.isSecureTextEntry = true
        passwordField.attributedPlaceholder = NSAttributedString(
            string: "Write your password...",
            attributes: [
                .font: UIFont.systemFont(ofSize: 15),
                .foregroundColor: UIColor.secondaryLabel.withAlphaComponent(0.25),
            ]
        )
        
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        logInButton.addTarget(self, action: #selector(logInUser), for: .touchUpInside)
        logInButton.setAttributedTitle(NSAttributedString(
            string: "Log In",
            attributes: [
                .font: UIFont.systemFont(ofSize: 16),
                .foregroundColor: UIColor.label
            ]
        ), for: .normal)
        
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        registerButton.addTarget(self, action: #selector(moveToRegisterView), for: .touchUpInside)
        registerButton.setAttributedTitle(NSAttributedString(
            string: "Don't have an account yet? Click here!",
            attributes: [
                .font: UIFont.systemFont(ofSize: 11),
                .foregroundColor: UIColor.secondaryLabel.withAlphaComponent(0.50)
            ]
        ), for: .normal)
        
        NSLayoutConstraint.activate([
            nicknameField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nicknameField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 120),
            nicknameField.widthAnchor.constraint(equalToConstant: 250),
            nicknameField.heightAnchor.constraint(equalToConstant: 35),
            
            passwordField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordField.topAnchor.constraint(equalTo: nicknameField.bottomAnchor, constant: 20),
            passwordField.widthAnchor.constraint(equalToConstant: 250),
            passwordField.heightAnchor.constraint(equalToConstant: 35),
            
            logInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logInButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 30),
            
            registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registerButton.topAnchor.constraint(equalTo: logInButton.bottomAnchor, constant: 20),
        ])
    }
    
    @objc private func logInUser() {
        let nickname = nicknameField.text ?? ""
        let password = passwordField.text ?? ""
        
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
