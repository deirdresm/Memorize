//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Deirdre Saoirse Moen on 1/26/21.
//

import SwiftUI

@main
struct MemorizeApp: App {
    var body: some Scene {
        WindowGroup {
            EmojiGameView(viewModel: EmojiMemoryGame())
        }
    }
}
