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
        recipientNameField.borderStyle = .roundedRect
        recipientNameField.autocapitalizationType = .none
        recipientNameField.font = UIFont.systemFont(ofSize: 15)
        recipientNameField.textColor = .label
        recipientNameField.placeholder = "Write recipient nickname..."

        pickImageButton.translatesAutoresizingMaskIntoConstraints = false
        pickImageButton.setTitle("Pick image", for: .normal)
        pickImageButton.setTitleColor(.label, for: .normal)
        pickImageButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)

        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 12
        imageView.backgroundColor = .systemGray6

        sendPixButton.translatesAutoresizingMaskIntoConstraints = false
        sendPixButton.setTitle("Pix it! ✨", for: .normal)
        sendPixButton.setTitleColor(.secondaryLabel, for: .normal)
        sendPixButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        
        NSLayoutConstraint.activate([
            recipientNameField.centerXAnchor.constraint(equalTo: centerXAnchor),
            recipientNameField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 120),
            recipientNameField.widthAnchor.constraint(equalToConstant: 250),
            recipientNameField.heightAnchor.constraint(equalToConstant: 35),
            
            pickImageButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            pickImageButton.topAnchor.constraint(equalTo: recipientNameField.bottomAnchor, constant: 20),
            
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.topAnchor.constraint(equalTo: pickImageButton.bottomAnchor, constant: 20),
            imageView.widthAnchor.constraint(equalToConstant: 200),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            
            sendPixButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            sendPixButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20)
        ])
    }
}
