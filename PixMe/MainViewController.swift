//
//  MainViewController.swift
//  PixMe
//
//  Created by Liza on 26/04/2025.
//

import UIKit

class MainViewController: UIViewController {
    
    let receivedImageView = UIImageView()
    let pixMessageLabel = UILabel()
    let sendPixButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
    }
    
    private func setupUI() {
        view.addSubview(receivedImageView)
        view.addSubview(pixMessageLabel)
        view.addSubview(sendPixButton)
        
        receivedImageView.image = UIImage(systemName: "photo")
        receivedImageView.contentMode = .scaleAspectFit
        receivedImageView.translatesAutoresizingMaskIntoConstraints = false
        
        pixMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        pixMessageLabel.textAlignment = .center
        pixMessageLabel.attributedText = NSAttributedString(
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
            
            pixMessageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pixMessageLabel.topAnchor.constraint(equalTo: receivedImageView.bottomAnchor, constant: 16),
            
            sendPixButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            sendPixButton.topAnchor.constraint(equalTo: pixMessageLabel.bottomAnchor, constant: 24),
            sendPixButton.widthAnchor.constraint(equalToConstant: 200),
            sendPixButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
}


