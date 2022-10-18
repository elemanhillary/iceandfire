//
//  gameofthronesUITests.swift
//  gameofthronesUITests
//
//  Created by MacBook Pro on 10/16/22.
//

import XCTest

class gameofthronesUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
        
    func testIsHomeScreen() {
        let app = XCUIApplication()
        let isHome = app.staticTexts["FIRE AND ICE"].exists
        XCTAssert(isHome == true)
    }
    
    func testNavigation() {
        let app = XCUIApplication()
        let tables = app.tables
        tables["housesTable"].cells.element(boundBy: 0).tap()
    }
    
    func testScreenDetails() {
        let app = XCUIApplication()
        let stackView = app.otherElements["DetailView.StackView"]
        XCTAssert(stackView.exists == true)
        XCTAssert(stackView.children(matching: .staticText).count > 0)
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
