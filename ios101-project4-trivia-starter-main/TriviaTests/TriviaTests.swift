//
//  TriviaTests.swift
//  TriviaTests
//
//  Created by Mari Batilando on 4/6/23.
//

import XCTest
@testable import Trivia

final class TriviaTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        try super.tearDownWithError()
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        let json = """
        {
            "category": "Science: Computers",
            "type": "multiple",
            "difficulty": "medium",
            "question": "What does CPU stand for?",
            "correct_answer": "Central Processing Unit",
            "incorrect_answers": ["Central Process Unit", "Computer Personal Unit", "Central Processor Unit"]
        }
        """.data(using: .utf8)!
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testTriviaQuestionService() {
        let service = TriviaQuestionService()
        let expectation = self.expectation(description: "Fetching trivia questions")

        service.fetchTriviaQuestions { questions in
            XCTAssertNotNil(questions)
            XCTAssertFalse(questions!.isEmpty)
            expectation.fulfill()
        }

        waitForExpectations(timeout: 5, handler: nil)
    }

}
