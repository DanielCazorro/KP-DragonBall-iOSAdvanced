//
//  KP_DragonBall_iOSAdvancedTests.swift
//  KP-DragonBall-iOSAdvancedTests
//
//  Created by Daniel Cazorro Frías on 23/10/23.
//

import XCTest
@testable import KP_DragonBall_iOSAdvanced

final class KP_DragonBall_iOSAdvancedTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}

class SecureDataProviderTests: XCTestCase {
    var secureDataProvider: SecureDataProvider!

    override func setUp() {
        super.setUp()
        secureDataProvider = SecureDataProvider()
    }

    override func tearDown() {
        secureDataProvider = nil
        super.tearDown()
    }

    func testSaveToken() {
        let token = "mi_token_secreto"
        secureDataProvider.save(token: token)

        if let savedToken = secureDataProvider.getToken() {
            XCTAssertEqual(savedToken, token, "El token guardado debe ser igual al token original")
        } else {
            XCTFail("No se pudo recuperar el token guardado")
        }
    }

    func testGetToken() {
        let token = "mi_token_secreto"
        secureDataProvider.save(token: token)

        if let savedToken = secureDataProvider.getToken() {
            XCTAssertEqual(savedToken, token, "El token recuperado debe ser igual al token original")
        } else {
            XCTFail("No se pudo recuperar el token guardado")
        }
    }

    func testDeleteToken() {
        let token = "mi_token_secreto"
        secureDataProvider.save(token: token)

        // Elimina el token
        secureDataProvider.deleteToken()

        XCTAssertNil(secureDataProvider.getToken(), "El token debe haber sido eliminado y debe ser nulo")
    }
}
