//
//  CreatePixViewController.swift
//  PixMe
//
//  Created by Liza on 29/04/2025.
//

import UIKit

class CreatePixViewController: UIViewController {
    
    private let createPixView = CreatePixView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = createPixView
        setupActions()
    }
    
    private func setupActions() {
        createPixView.sendPixButton.addTarget(self, action: #selector(sendPix), for: .touchUpInside)
    }
    
    @objc private func sendPix() {
        navigationController?.popViewController(animated: true)
    }
}
