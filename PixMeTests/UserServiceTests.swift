//
//  UserServiceTests.swift
//  PixMe
//
//  Created by Liza on 03/05/2025.
//

import CoreData
import XCTest
@testable import PixMe

final class UserServiceTests: XCTestCase {
    
    func testCreatingUserStoresDataInCoreData() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let nickname = "testUser"
        let email = "test@example.com"
        let password = "1234"
        
        
        UserService.createUser(email: email, nickname: nickname, password: password)
        
        
        let request = User.fetchRequest() as! NSFetchRequest<User>
        request.predicate = NSPredicate(format: "nickname == %@", nickname)
        
        let result = try? context.fetch(request)
        
        XCTAssertEqual(result?.first?.email, email)
        XCTAssertEqual(result?.first?.password, password)
    }
    
    func testAuthenticationSucceedsWithCorrectCredentials() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let nickname = "authTestUser"
        let email = "auth@example.com"
        let password = "secure123"
        
        UserService.createUser(email: email, nickname: nickname, password: password)
        
        let success = UserService.authenticateUser(nickname: nickname, password: password)
        
        XCTAssertTrue(success)
    }
    
    func testAuthenticationFailsWithWrongPassword() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let nickname = "wrongUser"
        let correctPassword = "realpass"
        let wrongPassword = "wrongpass"
        
        UserService.createUser(email: "wrong@example.com", nickname: nickname, password: correctPassword)
        
        let result = UserService.authenticateUser(nickname: nickname, password: wrongPassword)
        
        XCTAssertFalse(result, "Authentication should fail with wrong password")
    }

    
    override func tearDownWithError() throws {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let testNicknames = ["testUser", "authTestUser", "wrongUser"]

        for nickname in testNicknames {
            let request = User.fetchRequest() as! NSFetchRequest<User>
            request.predicate = NSPredicate(format: "nickname == %@", nickname)
            
            let results = try context.fetch(request)
            for user in results {
                context.delete(user)
            }
        }
        try context.save()
    }
    
}
