//
//  ToDoListUITestsLaunchTests.swift
//  ToDoListUITests
//
//  Created by Slav Kurochkin on 6/22/24.
//

import XCTest

final class ToDoListUITestsLaunchTests: XCTestCase {

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
    
    func testSwitch() throws {
        
        let app = XCUIApplication()
        // app.buttons["Create An Account"].tap()
        app.navigationBars["_TtGC7SwiftUI19UIHosting"].buttons["Back"].tap()
        
        let collectionViewsQuery = app.collectionViews
        collectionViewsQuery/*@START_MENU_TOKEN@*/.buttons["Log in"]/*[[".cells.buttons[\"Log in\"]",".buttons[\"Log in\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let pleaseFillInAllFieldsStaticText = collectionViewsQuery/*@START_MENU_TOKEN@*/.staticTexts["Please fill in all fields"]/*[[".cells.staticTexts[\"Please fill in all fields\"]",".staticTexts[\"Please fill in all fields\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        pleaseFillInAllFieldsStaticText.tap()
        
                
    }
}
