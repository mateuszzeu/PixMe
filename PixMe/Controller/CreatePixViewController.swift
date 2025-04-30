//
//  CreatePixViewController.swift
//  PixMe
//
//  Created by Liza on 29/04/2025.
//

import UIKit

class CreatePixViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    private let createPixView = CreatePixView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = createPixView
        setupActions()
    }
    
    private func setupActions() {
        createPixView.sendPixButton.addTarget(self, action: #selector(sendPix), for: .touchUpInside)
        createPixView.pickImageButton.addTarget(self, action: #selector(openImagePicker), for: .touchUpInside)
    }
    
    @objc private func sendPix() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func openImagePicker() {
        let actionSheet = UIAlertController(title: "Choose Image Source", message: nil, preferredStyle: .actionSheet)
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { _ in
                self.presentPicker(sourceType: .camera)
            }))
        }
        
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { _ in
            self.presentPicker(sourceType: .photoLibrary)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        present(actionSheet, animated: true)
    }
    
    private func presentPicker(sourceType: UIImagePickerController.SourceType) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = sourceType
        present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        
        if let image = info[.originalImage] as? UIImage {
            createPixView.imageView.image = image
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
}
