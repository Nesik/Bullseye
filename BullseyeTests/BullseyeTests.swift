//
//  BullseyeTests.swift
//  BullseyeTests
//
//  Created by Robert Wrzochal on 21/06/2022.
//

import XCTest
@testable import Bullseye

class BullseyeTests: XCTestCase {
    
    var game: Game!

    override func setUpWithError() throws {
        game = Game()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        game = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testNewRound(){
        game.startNewRound(points: 100)
        XCTAssertEqual(game.score, 100)
        XCTAssertEqual(game.round, 2)
    }
    
    func testScoreExact(){
        let guess = game.target
        let score = game.points(sliderValue: guess)
        XCTAssertEqual(score, 200)
        
    }

    func testScoreClose(){
        let guess = game.target + 2
        let score = game.points(sliderValue: guess)
        XCTAssertEqual(score, 98 + 50)
        
    }
    
    func testRestart(){
        game.startNewRound(points: 100)
        XCTAssertNotEqual(game.score, 0)
        XCTAssertNotEqual(game.round, 1)
        game.restart()
        XCTAssertEqual(game.score, 0)
        XCTAssertEqual(game.round, 1)

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
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
