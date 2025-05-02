//
//  CreatePixView.swift
//  PixMe
//
//  Created by Liza on 29/04/2025.
//

import UIKit

class CreatePixView: UIView {
    
    let recipientNameField = UITextField()
    let pickImageButton = UIButton(type: .system)
    let imageView = UIImageView()
    let sendPixButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = AppStyle.Colors.background
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(recipientNameField)
        addSubview(pickImageButton)
        addSubview(imageView)
        addSubview(sendPixButton)
        
        recipientNameField.applyInputFieldStyle(placeholder: "Write recipient nickname...")

        pickImageButton.translatesAutoresizingMaskIntoConstraints = false

        var config = UIButton.Configuration.tinted()
        config.title = "Pick Image"
        config.image = UIImage(systemName: "photo.on.rectangle")
        config.imagePadding = 8
        config.imagePlacement = .leading
        config.cornerStyle = .capsule
        config.contentInsets = NSDirectionalEdgeInsets(top: 12, leading: 20, bottom: 12, trailing: 20)
        config.baseForegroundColor = AppStyle.Colors.buttonSecondaryText

        pickImageButton.configuration = config

        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = AppStyle.Metrics.cornerRadius
        imageView.clipsToBounds = true
        imageView.layer.borderColor = AppStyle.Colors.border.cgColor
        imageView.layer.borderWidth = AppStyle.Metrics.borderWidth

        sendPixButton.translatesAutoresizingMaskIntoConstraints = false
        sendPixButton.setTitle("Pix it! ✨", for: .normal)
        sendPixButton.setTitleColor(AppStyle.Colors.textSecondary, for: .normal)
        sendPixButton.titleLabel?.font = AppStyle.Fonts.buttonPrimary
        
        NSLayoutConstraint.activate([
            recipientNameField.centerXAnchor.constraint(equalTo: centerXAnchor),
            recipientNameField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            recipientNameField.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8),
            recipientNameField.heightAnchor.constraint(equalToConstant: 50),
            
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.topAnchor.constraint(equalTo: recipientNameField.bottomAnchor, constant: 30),
            imageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor),
            
            pickImageButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            pickImageButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 60),
            
            sendPixButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            sendPixButton.topAnchor.constraint(equalTo: pickImageButton.bottomAnchor, constant: 90)
        ])
    }
}
