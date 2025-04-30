//
//  MainViewController.swift
//  PixMe
//
//  Created by Liza on 26/04/2025.
//

import UIKit
import CoreData

class MainViewController: UIViewController {
    
    private let mainView = MainView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        setupAction()
        loadNickname()
        loadReceivedPix()
    }
    
    private func setupAction() {
        mainView.logoutButton.addTarget(self, action: #selector(logoutTapped), for: .touchUpInside)
        mainView.createPixButton.addTarget(self, action: #selector(createPixViewView), for: .touchUpInside)
    }
    
    private func loadNickname() {
        let nickname = UserDefaults.standard.string(forKey: "loggedInNickname") ?? "Unknown User"
        mainView.nicknameLabel.text = "Hello \(nickname)"
    }
    
    private func loadReceivedPix() {
        guard let nickname = UserDefaults.standard.string(forKey: "loggedInNickname") else { return }
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let request = Pix.fetchRequest() as! NSFetchRequest<Pix>
        
        request.predicate = NSPredicate(format: "recipient == %@", nickname)
        request.sortDescriptors = [NSSortDescriptor(key: "date", ascending: false)]
        request.fetchLimit = 1
        
        do {
            let results = try context.fetch(request)
            if let pix = results.first {
                let image = UIImage(data: pix.imageData)
                mainView.receivedImageView.image = image
            }
        } catch {
            showAlert(title: "Error", message: "Failed to fetch Pix: \(error).")
        }
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


