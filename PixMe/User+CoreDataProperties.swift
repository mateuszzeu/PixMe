//
//  User+CoreDataProperties.swift
//  PixMe
//
//  Created by Liza on 27/04/2025.
//

import Foundation
import CoreData

extension User {

    @NSManaged public var email: String
    @NSManaged public var nickname: String
    @NSManaged public var password: String
}
