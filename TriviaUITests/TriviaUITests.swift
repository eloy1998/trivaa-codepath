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
            app.launchArguments.append("--uitesting") // Optional: signal to your app it's under test
            app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        // Optional: reset app state if needed between tests
        let app = XCUIApplication()
        if app.buttons["Reset"].exists {
            app.buttons["Reset"].tap()
        }
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        // Example: check if Start button appears on launch
                let startButton = app.buttons["Start"]
                XCTAssertTrue(startButton.exists, "Start button should be visible on launch")

                // Tap the Start button
                startButton.tap()

                // Verify that the question label appears
                let questionLabel = app.staticTexts["QuestionLabel"]
                XCTAssertTrue(questionLabel.waitForExistence(timeout: 2), "Question label should appear after tapping Start")

                // Tap on answer A
                let answerA = app.buttons["AnswerA"]
                XCTAssertTrue(answerA.exists, "AnswerA button should be visible")
                answerA.tap()

                // Tap Next
                let nextButton = app.buttons["Next"]
                XCTAssertTrue(nextButton.waitForExistence(timeout: 2), "Next button should appear after selecting an answer")
                nextButton.tap()
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
}
