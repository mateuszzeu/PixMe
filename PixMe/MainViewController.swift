//
//  MainViewController.swift
//  PixMe
//
//  Created by Liza on 26/04/2025.
//

import UIKit

class MainViewController: UIViewController {
    
    let receivedImageView = UIImageView()
    let pixMessageField = UILabel()
    let sendPixButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
    }
    
    private func setupUI() {
        view.addSubview(receivedImageView)
        view.addSubview(pixMessageField)
        view.addSubview(sendPixButton)
        
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
        
        NSLayoutConstraint.activate([
            receivedImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            receivedImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 120),
            receivedImageView.widthAnchor.constraint(equalToConstant: 100),
            receivedImageView.heightAnchor.constraint(equalToConstant: 100),
            
            pixMessageField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pixMessageField.topAnchor.constraint(equalTo: receivedImageView.bottomAnchor, constant: 16),
            
            sendPixButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            sendPixButton.topAnchor.constraint(equalTo: pixMessageField.bottomAnchor, constant: 24),
            sendPixButton.widthAnchor.constraint(equalToConstant: 200),
            sendPixButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
}


