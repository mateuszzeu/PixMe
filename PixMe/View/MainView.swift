//
//  MainView.swift
//  PixMe
//
//  Created by Liza on 29/04/2025.
//

import UIKit

class MainView: UIView {
    
    let receivedImageView = UIImageView()
    let pixMessageField = UILabel()
    let sendPixButton = UIButton(type: .system)
    let nicknameLabel = UILabel()
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
        addSubview(pixMessageField)
        addSubview(sendPixButton)
        addSubview(nicknameLabel)
        addSubview(logoutButton)
        
        receivedImageView.translatesAutoresizingMaskIntoConstraints = false
        receivedImageView.image = UIImage(systemName: "photo")
        receivedImageView.contentMode = .scaleAspectFit
        
        pixMessageField.translatesAutoresizingMaskIntoConstraints = false
        pixMessageField.textAlignment = .center
        pixMessageField.attributedText = NSAttributedString(
            string: "You've got a Pix!",
            attributes: [
                .font: UIFont.systemFont(ofSize: 16),
                .foregroundColor: UIColor.label
            ]
        )
        
        sendPixButton.translatesAutoresizingMaskIntoConstraints = false
        sendPixButton.setAttributedTitle(NSAttributedString(
            string: "Pix someone",
            attributes: [
                .font: UIFont.systemFont(ofSize: 16),
                .foregroundColor: UIColor.label
            ]
        ), for: .normal)
        
        nicknameLabel.translatesAutoresizingMaskIntoConstraints = false
        nicknameLabel.textColor = .secondaryLabel
        nicknameLabel.font = .systemFont(ofSize: 10)
        nicknameLabel.alpha = 0.5
        
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        logoutButton.setAttributedTitle(NSAttributedString(
            string: "Logout",
            attributes: [
                .font: UIFont.systemFont(ofSize: 16),
                .foregroundColor: UIColor.label
            ]
        ), for: .normal)
        
        NSLayoutConstraint.activate([
            receivedImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            receivedImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 120),
            receivedImageView.widthAnchor.constraint(equalToConstant: 100),
            receivedImageView.heightAnchor.constraint(equalToConstant: 100),
            
            pixMessageField.centerXAnchor.constraint(equalTo: centerXAnchor),
            pixMessageField.topAnchor.constraint(equalTo: receivedImageView.bottomAnchor, constant: 16),
            
            sendPixButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            sendPixButton.topAnchor.constraint(equalTo: pixMessageField.bottomAnchor, constant: 24),
            sendPixButton.widthAnchor.constraint(equalToConstant: 200),
            sendPixButton.heightAnchor.constraint(equalToConstant: 44),
            
            nicknameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            nicknameLabel.bottomAnchor.constraint(equalTo: logoutButton.topAnchor, constant: -20),
            
            logoutButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoutButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10),
        ])
    }
}
