//
//  Pix+CoreDataProperties.swift
//  PixMe
//
//  Created by Liza on 30/04/2025.
//

import Foundation
import CoreData

extension Pix {

    @NSManaged public var date : Date
    @NSManaged public var imageData : Data
    @NSManaged public var recipient: String
    @NSManaged public var sender: String
}
