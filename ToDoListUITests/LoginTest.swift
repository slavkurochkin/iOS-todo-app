//
//  ToDoListUITestsLaunchTests.swift
//  ToDoListUITests
//
//  Created by Slav Kurochkin on 6/22/24.
//


import XCTest

final class SlavTest: XCTestCase {
    
    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    func testLogin() throws {
        let app = XCUIApplication()
        app.launchArguments.append("--uitesting")
        app.launch()
        
        let collectionViewsQuery = XCUIApplication().collectionViews
        collectionViewsQuery/*@START_MENU_TOKEN@*/.textFields["emailInput"]/*[[".cells",".textFields[\"Email Address\"]",".textFields[\"emailInput\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        collectionViewsQuery.textFields["emailInput"].typeText("great@gmail.com")
        app.keyboards.buttons["return"].tap()
        
        let passwordinputSecureTextField = collectionViewsQuery/*@START_MENU_TOKEN@*/.secureTextFields["passwordInput"]/*[[".cells",".secureTextFields[\"Password\"]",".secureTextFields[\"passwordInput\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
        passwordinputSecureTextField.tap()
        passwordinputSecureTextField.typeText("password")
        app.keyboards.buttons["return"].tap()

        collectionViewsQuery/*@START_MENU_TOKEN@*/.buttons["loginBtn"]/*[[".cells",".buttons[\"Log in\"]",".buttons[\"loginBtn\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        XCTAssert(app/*@START_MENU_TOKEN@*/.navigationBars["To Do List"]/*[[".otherElements[\"homeTab\"].navigationBars[\"To Do List\"]",".navigationBars[\"To Do List\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.staticTexts["To Do List"].waitForExistence(timeout: 10))
        
        app.tabBars["Tab Bar"].buttons["Profile"].tap()
        app/*@START_MENU_TOKEN@*/.buttons["Log Out"]/*[[".otherElements[\"profileTab\"].buttons[\"Log Out\"]",".buttons[\"Log Out\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
    }
}

