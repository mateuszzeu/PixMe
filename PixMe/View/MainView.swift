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
        backgroundColor = .systemBackground
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
        
        receivedImageView.translatesAutoresizingMaskIntoConstraints = false
        receivedImageView.image = UIImage(systemName: "photo")
        receivedImageView.contentMode = .scaleAspectFit
        
//        pixMessageField.translatesAutoresizingMaskIntoConstraints = false
//        pixMessageField.font = UIFont.systemFont(ofSize: 16)
//        pixMessageField.textColor = .label
//        pixMessageField.text = "You've got a Pix!"

        senderNicknameLabel.translatesAutoresizingMaskIntoConstraints = false
        senderNicknameLabel.font = UIFont.systemFont(ofSize: 10)
        senderNicknameLabel.textColor = .secondaryLabel
        senderNicknameLabel.alpha = 0.5
        senderNicknameLabel.text = ""

        dateReceivedLabel.translatesAutoresizingMaskIntoConstraints = false
        dateReceivedLabel.font = UIFont.systemFont(ofSize: 10)
        dateReceivedLabel.textColor = .secondaryLabel
        dateReceivedLabel.alpha = 0.5
        dateReceivedLabel.text = ""

        createPixButton.translatesAutoresizingMaskIntoConstraints = false
        createPixButton.setTitle("Pix someone", for: .normal)
        createPixButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        createPixButton.setTitleColor(.label, for: .normal)

        nicknameLabel.translatesAutoresizingMaskIntoConstraints = false
        nicknameLabel.font = UIFont.systemFont(ofSize: 10)
        nicknameLabel.textColor = .secondaryLabel
        nicknameLabel.alpha = 0.5

        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        logoutButton.setTitle("Logout", for: .normal)
        logoutButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        logoutButton.setTitleColor(.label, for: .normal)
        
        NSLayoutConstraint.activate([
            receivedImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            receivedImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 120),
            receivedImageView.widthAnchor.constraint(equalToConstant: 100),
            receivedImageView.heightAnchor.constraint(equalToConstant: 100),
            
//            pixMessageField.centerXAnchor.constraint(equalTo: centerXAnchor),
//            pixMessageField.topAnchor.constraint(equalTo: receivedImageView.bottomAnchor, constant: 16),
            
            senderNicknameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            senderNicknameLabel.topAnchor.constraint(equalTo: receivedImageView.bottomAnchor, constant: 24),
            
            dateReceivedLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            dateReceivedLabel.topAnchor.constraint(equalTo: senderNicknameLabel.bottomAnchor, constant: 5),
            
            createPixButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            createPixButton.topAnchor.constraint(equalTo: dateReceivedLabel.bottomAnchor, constant: 24),
            createPixButton.widthAnchor.constraint(equalToConstant: 200),
            createPixButton.heightAnchor.constraint(equalToConstant: 44),
            
            nicknameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            nicknameLabel.bottomAnchor.constraint(equalTo: logoutButton.topAnchor, constant: -20),
            
            logoutButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoutButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10),
        ])
    }
}
