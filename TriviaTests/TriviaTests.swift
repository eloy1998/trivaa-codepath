import XCTest
@testable import Trivia

final class TriviaTests: XCTestCase {

    var game: TriviaGame!

    override func setUpWithError() throws {
        game = TriviaGame()
    }

    override func tearDownWithError() throws {
        game = nil
    }

    func testExample() throws {
        let question = Question(
            text: "What is the capital of France?",
            correctAnswer: "Paris",
            allAnswers: ["London", "Paris", "Berlin"]
        )

        game.currentQuestion = question

        // Test correct answer
        game.submitAnswer("Paris")
        XCTAssertEqual(game.score, 1, "Score should be 1 after correct answer")

        // Test incorrect answer
        game.submitAnswer("London")
        XCTAssertEqual(game.score, 1, "Score should remain 1 after wrong answer")
    }

    func testPerformanceExample() throws {
        self.measure {
            for _ in 0..<1000 {
                _ = game.generateRandomQuestion()
            }
        }
    }
}
