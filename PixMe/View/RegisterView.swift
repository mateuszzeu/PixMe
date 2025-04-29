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
        emailField.borderStyle = .roundedRect
        emailField.keyboardType = .emailAddress
        emailField.returnKeyType = .next
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
        passwordField.attributedPlaceholder = NSAttributedString(
            string: "password...",
            attributes: [
                .font: UIFont.systemFont(ofSize: 15),
                .foregroundColor: UIColor.secondaryLabel.withAlphaComponent(0.25)
            ]
        )
        
        createAccountButton.translatesAutoresizingMaskIntoConstraints = false
        createAccountButton.isEnabled = false
        createAccountButton.setAttributedTitle(NSAttributedString(
            string: "Register",
            attributes: [
                .font: UIFont.systemFont(ofSize: 16),
                .foregroundColor: UIColor.label
            ]
        ), for: .normal)
        
        NSLayoutConstraint.activate([
            emailField.centerXAnchor.constraint(equalTo: centerXAnchor),
            emailField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 120),
            emailField.widthAnchor.constraint(equalToConstant: 250),
            emailField.heightAnchor.constraint(equalToConstant: 35),
            
            nicknameField.centerXAnchor.constraint(equalTo: centerXAnchor),
            nicknameField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 20),
            nicknameField.widthAnchor.constraint(equalToConstant: 250),
            nicknameField.heightAnchor.constraint(equalToConstant: 35),
            
            passwordField.centerXAnchor.constraint(equalTo: centerXAnchor),
            passwordField.topAnchor.constraint(equalTo: nicknameField.bottomAnchor, constant: 20),
            passwordField.widthAnchor.constraint(equalToConstant: 250),
            passwordField.heightAnchor.constraint(equalToConstant: 35),
            
            createAccountButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            createAccountButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 20)
        ])
    }
}
