//
//  AlamofirePOCTests.swift
//  AlamofirePOCTests
//
//  Created by Ernesto Gonzalez on 5/1/19.
//  Copyright © 2019 Ernesto Gonzalez. All rights reserved.
//

import XCTest
@testable import AlamofirePOC

class AlamofirePOCTests: XCTestCase {
    
    var clientServices: ClientServices!
    var retrievedData: [String: Any]!

    override func setUp() {
        clientServices = ClientServices.shared
        retrievedData = nil
    }

    override func tearDown() {
        clientServices = nil
        retrievedData = nil
    }

    func testAuthenticateUser() {
        let mockUserRouter = MockUserRouter.authenticateUser(email: "joe.doe@email.com", password: "Test1234")
        clientServices.authenticateUser(configuration: mockUserRouter as APIConfiguration) { session, _ in
            self.retrievedData = session
        }
        
        let predicate = NSPredicate(format: "retrievedData != nil")
        let promise = expectation(for: predicate, evaluatedWith: self, handler: nil)
        let response = XCTWaiter.wait(for: [promise], timeout: 5.0)
        guard response == XCTWaiter.Result.completed else {
            XCTAssert(false, "The call to get the URL ran into some other error")
            return
        }
        
        XCTAssertNotNil(retrievedData, "No data recived from the server")
    }

}
