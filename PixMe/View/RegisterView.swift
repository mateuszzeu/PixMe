//
//  RegisterView.swift
//  PixMe
//
//  Created by Liza on 29/04/2025.
//

import UIKit

class RegisterView: UIView {
    
    let emailField = UITextField()
    let nicknameField = UITextField()
    let passwordField = UITextField()
    let createAccountButton = UIButton(type: .system)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(emailField)
        addSubview(nicknameField)
        addSubview(passwordField)
        addSubview(createAccountButton)
        
        emailField.translatesAutoresizingMaskIntoConstraints = false
        emailField.autocapitalizationType = .none
        emailField.borderStyle = .roundedRect
        emailField.keyboardType = .emailAddress
        emailField.returnKeyType = .next
        emailField.font = AppStyle.Fonts.textField
        emailField.textColor = AppStyle.Colors.textPrimary
        emailField.placeholder = "Your email..."

        nicknameField.translatesAutoresizingMaskIntoConstraints = false
        nicknameField.autocapitalizationType = .none
        nicknameField.borderStyle = .roundedRect
        nicknameField.returnKeyType = .next
        nicknameField.font = AppStyle.Fonts.textField
        nicknameField.textColor = AppStyle.Colors.textPrimary
        nicknameField.placeholder = "Your nickname..."

        passwordField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.borderStyle = .roundedRect
        passwordField.isSecureTextEntry = true
        passwordField.returnKeyType = .done
        passwordField.font = AppStyle.Fonts.textField
        passwordField.textColor = AppStyle.Colors.textPrimary
        passwordField.placeholder = "Password..."

        createAccountButton.translatesAutoresizingMaskIntoConstraints = false
        createAccountButton.setTitle("Register", for: .normal)
        createAccountButton.isEnabled = false
        createAccountButton.setTitleColor(AppStyle.Colors.textSecondary, for: .normal)
        createAccountButton.titleLabel?.font = AppStyle.Fonts.buttonPrimary
        
        NSLayoutConstraint.activate([
            emailField.centerXAnchor.constraint(equalTo: centerXAnchor),
            emailField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 120),
            emailField.widthAnchor.constraint(equalToConstant: 250),
            emailField.heightAnchor.constraint(equalToConstant: 35),
            emailField.widthAnchor.constraint(equalToConstant: 350),
            
            nicknameField.centerXAnchor.constraint(equalTo: centerXAnchor),
            nicknameField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 20),
            nicknameField.widthAnchor.constraint(equalToConstant: 250),
            nicknameField.heightAnchor.constraint(equalToConstant: 35),
            nicknameField.widthAnchor.constraint(equalTo: emailField.widthAnchor),
            
            passwordField.centerXAnchor.constraint(equalTo: centerXAnchor),
            passwordField.topAnchor.constraint(equalTo: nicknameField.bottomAnchor, constant: 20),
            passwordField.widthAnchor.constraint(equalToConstant: 250),
            passwordField.heightAnchor.constraint(equalToConstant: 35),
            passwordField.widthAnchor.constraint(equalTo: emailField.widthAnchor),
            
            createAccountButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            createAccountButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 20)
        ])
    }
}
