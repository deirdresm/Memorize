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
        let emojiLength = EmojiMemoryGame.emojis.count
        let expectedCount = emojiLength * 2
        // verify we have two instances per emoji
        XCTAssertEqual(emojiLength, expectedCount)
        
        XCTAssertTrue(game.cards[0].isFaceUp)
        game.choose(game.cards[0])
        XCTAssertFalse(game.cards[0].isFaceUp)
    }

/*    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
*/
}
