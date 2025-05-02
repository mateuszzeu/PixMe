//
//  MainView.swift
//  PixMe
//
//  Created by Liza on 29/04/2025.
//

import UIKit

class MainView: UIView {
    
    let receivedImageView = UIImageView()
    
//    let pixMessageField = UILabel()
    let nicknameLabel = UILabel()
    let senderNicknameLabel = UILabel()
    let dateReceivedLabel = UILabel()
    
    let createPixButton = UIButton(type: .system)
    let logoutButton = UIButton(type: .system)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = AppStyle.Colors.background
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(receivedImageView)
        
//        addSubview(pixMessageField)
        addSubview(nicknameLabel)
        
        addSubview(senderNicknameLabel)
        addSubview(dateReceivedLabel)
        
        addSubview(createPixButton)
        addSubview(logoutButton)
        
        nicknameLabel.translatesAutoresizingMaskIntoConstraints = false
        nicknameLabel.font = AppStyle.Fonts.labelSmall
        nicknameLabel.textColor = AppStyle.Colors.textSecondary
        
        receivedImageView.translatesAutoresizingMaskIntoConstraints = false
        receivedImageView.contentMode = .scaleAspectFill
        receivedImageView.layer.cornerRadius = AppStyle.Metrics.cornerRadius
        receivedImageView.clipsToBounds = true
        receivedImageView.layer.borderColor = AppStyle.Colors.border.cgColor
        receivedImageView.layer.borderWidth = AppStyle.Metrics.borderWidth

        
//        pixMessageField.translatesAutoresizingMaskIntoConstraints = false
//        pixMessageField.font = UIFont.systemFont(ofSize: 16)
//        pixMessageField.textColor = .label
//        pixMessageField.text = "You've got a Pix!"

        senderNicknameLabel.translatesAutoresizingMaskIntoConstraints = false
        senderNicknameLabel.font = AppStyle.Fonts.labelTiny
        senderNicknameLabel.textColor = AppStyle.Colors.textSecondary
        senderNicknameLabel.alpha = AppStyle.Metrics.labelFaintAlpha
        senderNicknameLabel.text = ""

        dateReceivedLabel.translatesAutoresizingMaskIntoConstraints = false
        dateReceivedLabel.font = AppStyle.Fonts.labelTiny
        dateReceivedLabel.textColor = AppStyle.Colors.textSecondary
        dateReceivedLabel.alpha = AppStyle.Metrics.labelFaintAlpha
        dateReceivedLabel.text = ""

        createPixButton.translatesAutoresizingMaskIntoConstraints = false
        createPixButton.setTitle("Send a Pix ✨", for: .normal)
        createPixButton.titleLabel?.font = AppStyle.Fonts.buttonPrimary
        createPixButton.setTitleColor(AppStyle.Colors.textSecondary, for: .normal)

        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        logoutButton.setTitle("Logout", for: .normal)
        logoutButton.titleLabel?.font = AppStyle.Fonts.buttonPrimary
        logoutButton.setTitleColor(AppStyle.Colors.textPrimary, for: .normal)
        
        NSLayoutConstraint.activate([
            nicknameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            nicknameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 5),
            
            receivedImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            receivedImageView.topAnchor.constraint(equalTo: nicknameLabel.bottomAnchor, constant: 20),
            receivedImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8),
            receivedImageView.heightAnchor.constraint(equalTo: receivedImageView.widthAnchor),
            
//            pixMessageField.centerXAnchor.constraint(equalTo: centerXAnchor),
//            pixMessageField.topAnchor.constraint(equalTo: receivedImageView.bottomAnchor, constant: 16),
            
            senderNicknameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            senderNicknameLabel.topAnchor.constraint(equalTo: receivedImageView.bottomAnchor, constant: 15),
            
            dateReceivedLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            dateReceivedLabel.topAnchor.constraint(equalTo: senderNicknameLabel.bottomAnchor, constant: 5),
            
            createPixButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            createPixButton.topAnchor.constraint(equalTo: dateReceivedLabel.bottomAnchor, constant: 80),
            createPixButton.widthAnchor.constraint(equalToConstant: 200),
            createPixButton.heightAnchor.constraint(equalToConstant: 44),
            
            logoutButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoutButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
    }
}
