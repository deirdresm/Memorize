//
//  MemorizeTests.swift
//  MemorizeTests
//
//  Created by Deirdre Saoirse Moen on 1/26/21.
//

import XCTest
@testable import Memorize

class MemorizeTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInitializationCounts() throws {
        
        let game = EmojiMemoryGame()

        // verify we have 2-5 pairs of cards
        XCTAssertGreaterThanOrEqual(game.cards.count, 2*2)
        XCTAssertLessThanOrEqual(game.cards.count, 5*2)
    }
    
    func testShuffling() throws {
        var randomness = 0
        let game = EmojiMemoryGame()

        // verify that at least most of them aren't the same as their pair card
        
        for index in 0 ..< game.cards.count/2 {
            if game.cards[index * 2] == game.cards[index * 2 + 1] {
                randomness -= 1
            } else {
                randomness += 1
            }
        }
        XCTAssertGreaterThanOrEqual(randomness, 0)
    }
    
    func testCardToggling() throws {
        let game = EmojiMemoryGame()

        XCTAssertFalse(game.cards[0].isFaceUp)
        game.choose(0)
        XCTAssertTrue(game.cards[0].isFaceUp)

    }

/*    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
*/
}
