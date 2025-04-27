//
//  RegisterViewController.swift
//  PixMe
//
//  Created by Liza on 27/04/2025.
//

import UIKit

class RegisterViewController: UIViewController {
    
    let emailField = UITextField()
    let nicknameField = UITextField()
    let passwordField = UITextField()
    let createAccountButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
        textFieldDidChange()
    }
    
    private func setupUI() {
        view.addSubview(emailField)
        view.addSubview(nicknameField)
        view.addSubview(passwordField)
        view.addSubview(createAccountButton)
        
        emailField.translatesAutoresizingMaskIntoConstraints = false
        emailField.borderStyle = .roundedRect
        emailField.keyboardType = .emailAddress
        emailField.returnKeyType = .next
        emailField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        emailField.attributedPlaceholder = NSAttributedString(
            string: "Your email...",
            attributes: [
                .font: UIFont.systemFont(ofSize: 15),
                .foregroundColor: UIColor.secondaryLabel.withAlphaComponent(0.25)
            ]
        )
        
        nicknameField.translatesAutoresizingMaskIntoConstraints = false
        nicknameField.borderStyle = .roundedRect
        nicknameField.returnKeyType = .next
        nicknameField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        nicknameField.attributedPlaceholder = NSAttributedString(
            string: "Your nickname...",
            attributes: [
                .font: UIFont.systemFont(ofSize: 15),
                .foregroundColor: UIColor.secondaryLabel.withAlphaComponent(0.25)
            ]
        )
        
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.borderStyle = .roundedRect
        passwordField.isSecureTextEntry = true
        passwordField.returnKeyType = .done
        passwordField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        passwordField.attributedPlaceholder = NSAttributedString(
            string: "password...",
            attributes: [
                .font: UIFont.systemFont(ofSize: 15),
                .foregroundColor: UIColor.secondaryLabel.withAlphaComponent(0.25)
            ]
        )
        
        createAccountButton.translatesAutoresizingMaskIntoConstraints = false
        createAccountButton.addTarget(self, action: #selector(createUser), for: .touchUpInside)
        createAccountButton.isEnabled = false
        createAccountButton.setAttributedTitle(NSAttributedString(
            string: "Register",
            attributes: [
                .font: UIFont.systemFont(ofSize: 16),
                .foregroundColor: UIColor.label
            ]
        ), for: .normal)
        
        NSLayoutConstraint.activate([
            emailField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 120),
            emailField.widthAnchor.constraint(equalToConstant: 250),
            emailField.heightAnchor.constraint(equalToConstant: 35),
            
            nicknameField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nicknameField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 20),
            nicknameField.widthAnchor.constraint(equalToConstant: 250),
            nicknameField.heightAnchor.constraint(equalToConstant: 35),
            
            passwordField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordField.topAnchor.constraint(equalTo: nicknameField.bottomAnchor, constant: 20),
            passwordField.widthAnchor.constraint(equalToConstant: 250),
            passwordField.heightAnchor.constraint(equalToConstant: 35),
            
            createAccountButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            createAccountButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 20)
        ])
    }
    
    private func allFieldsFilled() -> Bool {
        [emailField, nicknameField, passwordField].allSatisfy { !($0.text?.isEmpty ?? true) }
    }
    
    @objc private func createUser() {
        let email = emailField.text ?? ""
        let nickname = nicknameField.text ?? ""
        let password = passwordField.text ?? ""
        
        UserService.createUser(email: email, nickname: nickname, password: password)
    }
    
    @objc private func textFieldDidChange() {
        createAccountButton.isEnabled = allFieldsFilled()
        createAccountButton.alpha = allFieldsFilled() ? 1.0 : 0.5
    }
}
