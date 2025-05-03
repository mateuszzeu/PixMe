//
//  PixService.swift
//  PixMe
//
//  Created by Liza on 03/05/2025.
//

import UIKit
import CoreData

struct PixService {
    
    static func createPix(sender: String, recipient: String, imageData: Data) throws {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let pix = Pix(context: context)
        pix.sender = sender
        pix.recipient = recipient
        pix.imageData = imageData
        pix.date = Date()
        
        try context.save()
    }
}
