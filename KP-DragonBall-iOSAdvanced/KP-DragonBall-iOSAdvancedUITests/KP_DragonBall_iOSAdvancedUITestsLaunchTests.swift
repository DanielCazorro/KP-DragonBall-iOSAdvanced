//
//  KP_DragonBall_iOSAdvancedUITestsLaunchTests.swift
//  KP-DragonBall-iOSAdvancedUITests
//
//  Created by Daniel Cazorro Frías on 23/10/23.
//

import XCTest

final class KP_DragonBall_iOSAdvancedUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
