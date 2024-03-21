//
//  TriviaUITests.swift
//  TriviaUITests
//
//  Created by Mari Batilando on 4/6/23.
//

import XCTest

final class TriviaUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        let app = XCUIApplication()
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        try super.tearDownWithError()
        
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
    
    func testQuestionDisplay() {
        let app = XCUIApplication()
        app.launch()
        
        let questionLabel = app.staticTexts["questionLabel"]
        XCTAssert(questionLabel.exists)
    }
    
    func testAnswerButtonsExist() {
            let app = XCUIApplication()
            
            // Assuming you have four answer buttons with accessibility identifiers set to "answerButton0", "answerButton1", etc.
            let answerButton0 = app.buttons["answerButton0"]
            XCTAssert(answerButton0.exists, "Answer Button 0 does not exist.")

            let answerButton1 = app.buttons["answerButton1"]
            XCTAssert(answerButton1.exists, "Answer Button 1 does not exist.")

            let answerButton2 = app.buttons["answerButton2"]
            XCTAssert(answerButton2.exists, "Answer Button 2 does not exist.")

            let answerButton3 = app.buttons["answerButton3"]
            XCTAssert(answerButton3.exists, "Answer Button 3 does not exist.")
        }
    
    func testSelectingAnAnswer() {
        let app = XCUIApplication()
        
        // Tapping an answer button. You might need to wait for the button to become hittable if there's a network request involved.
        let answerButton0 = app.buttons["answerButton0"]
        if answerButton0.waitForExistence(timeout: 5) {
            answerButton0.tap()
            // You can add more checks here to verify the app's behavior after tapping an answer
        } else {
            XCTFail("Answer Button 0 did not become available in time.")
        }
    }

}
