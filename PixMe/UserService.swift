//
//  UserService.swift
//  PixMe
//
//  Created by Liza on 27/04/2025.
//

import UIKit

struct UserService {
    
    static func createUser(email: String, nickname: String, password: String) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let user = User(context: context)
        user.email = email
        user.nickname = nickname
        user.password = password
        
        do {
            try context.save()
        }
        catch {
            context.rollback()
            fatalError("Core Data saving error: \(error.localizedDescription)")
        }
    }
}
