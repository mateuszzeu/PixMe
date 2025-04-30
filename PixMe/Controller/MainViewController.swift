//
//  MainViewController.swift
//  PixMe
//
//  Created by Liza on 26/04/2025.
//

import UIKit

class MainViewController: UIViewController {
    
    private let mainView = MainView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        setupAction()
        loadNickname()
    }
    
    private func setupAction() {
        mainView.logoutButton.addTarget(self, action: #selector(logoutTapped), for: .touchUpInside)
        mainView.createPixButton.addTarget(self, action: #selector(createPixViewView), for: .touchUpInside)
    }
    
    private func loadNickname() {
        let nickname = UserDefaults.standard.string(forKey: "loggedInNickname") ?? "Unknown User"
        mainView.nicknameLabel.text = "Hello \(nickname)"
    }
    
    @objc private func logoutTapped() {
        UserDefaults.standard.removeObject(forKey: "loggedInNickname")
        let loginVC = LoginViewController()
        navigationController?.setViewControllers([loginVC], animated: true)
    }
    
    @objc private func createPixViewView() {
        let createVC = CreatePixViewController()
        navigationController?.pushViewController(createVC, animated: true)
    }
}


