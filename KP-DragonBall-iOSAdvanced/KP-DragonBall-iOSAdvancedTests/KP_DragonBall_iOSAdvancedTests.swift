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

final class ValidationLoginTest: XCTestCase {
    private var sut: LoginViewModel!
    
    override func setUp() {
        let dataLock = SecureDataProvider()
        sut = LoginViewModel(apiProvider: ApiProvider(),
                             secureDataProvider: dataLock)
    }
    
    func test_good_pass() throws {
        let goodPass = "GokuFull"
        let isgoodPass = sut.isValid(password: goodPass)
        
        XCTAssertTrue(isgoodPass)
    }
    
    func test_good_email() throws {
        let goodEmail = "danielcazorro@hotmail.com"
        let isgoodEmail = sut.isValid(email: goodEmail)
        
        XCTAssertTrue(isgoodEmail)
    }
    
    func test_bad_pass() throws {
        let badPass = "16"
        let isbadPass = sut.isValid(email: badPass)
        
        XCTAssertFalse(isbadPass)
    }
    
    func test_bad_email() throws {
        let badEmail = "danielcazorrohotmail.com"
        let isbadEmail = sut.isValid(email: badEmail)
        
        XCTAssertFalse(isbadEmail)
    }
}
