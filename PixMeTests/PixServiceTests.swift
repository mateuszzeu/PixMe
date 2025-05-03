//
//  PixServiceTests.swift
//  PixMe
//
//  Created by Liza on 03/05/2025.
//

import CoreData
import XCTest
@testable import PixMe

final class PixServiceTests: XCTestCase {
    
    func testCreatingPixStoresDataInCoreData() throws {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let sender = "testUser"
        let recipient = "testRecipient"
        let imageData = "TestImage".data(using: .utf8)!
        
        try PixService.createPix(sender: sender, recipient: recipient, imageData: imageData)
        
        let request = Pix.fetchRequest() as! NSFetchRequest<Pix>
        request.predicate = NSPredicate(format: "sender == %@", sender)
        
        let result = try context.fetch(request).first
        
        XCTAssertEqual(result?.sender, sender)
        XCTAssertEqual(result?.recipient, recipient)
        XCTAssertEqual(result?.imageData, imageData)
    }
    
    override func tearDownWithError() throws {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let request = Pix.fetchRequest() as! NSFetchRequest<Pix>
        request.predicate = NSPredicate(format: "sender == %@", "testUser")
        
        let results = try context.fetch(request)
        for pix in results {
            context.delete(pix)
        }
        try context.save()
    }
}
