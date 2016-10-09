//
//  DataRUITests.swift
//  DataRUITests
//
//  Created by daniel martinez gonzalez on 7/10/16.
//  Copyright © 2016 daniel martinez gonzalez. All rights reserved.
//

import XCTest

class DataRUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let app = XCUIApplication()
        setupSnapshot(app: app)
        app.launch()
        
        let shareButton = app.navigationBars["DataR.View"].buttons["Share"]
        snapshot(name: "0Launch")
        shareButton.tap()
        
        let tablesQuery = app.tables
        tablesQuery.staticTexts["Ingles"].tap()
        snapshot(name: "1Launch")
        
        
    }
    
}
