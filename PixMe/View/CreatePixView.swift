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
        backgroundColor = .systemBackground
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
        
        recipientNameField.translatesAutoresizingMaskIntoConstraints = false
        recipientNameField.layer.cornerRadius = 16
        recipientNameField.layer.borderWidth = 0.5
        recipientNameField.layer.borderColor = UIColor.quaternaryLabel.cgColor
        recipientNameField.autocapitalizationType = .none
        recipientNameField.font = UIFont.systemFont(ofSize: 15)
        recipientNameField.textColor = .label
        recipientNameField.placeholder = "Write recipient nickname..."
        recipientNameField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 50))
        recipientNameField.leftViewMode = .always

        pickImageButton.translatesAutoresizingMaskIntoConstraints = false
        var config = UIButton.Configuration.borderedTinted()
        config.title = "Pick Image"
        config.image = UIImage(systemName: "photo.on.rectangle")
        config.imagePadding = 8
        config.imagePlacement = .leading
        config.baseBackgroundColor = .secondaryLabel
        config.baseForegroundColor = .white
        config.cornerStyle = .capsule
        config.contentInsets = NSDirectionalEdgeInsets(top: 14, leading: 20, bottom: 14, trailing: 20)
        pickImageButton.configuration = config

        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 16
        imageView.clipsToBounds = true
        imageView.layer.borderColor = UIColor.quaternaryLabel.cgColor
        imageView.layer.borderWidth = 0.5

        sendPixButton.translatesAutoresizingMaskIntoConstraints = false
        sendPixButton.setTitle("Pix it! ✨", for: .normal)
        sendPixButton.setTitleColor(.secondaryLabel, for: .normal)
        sendPixButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        
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
