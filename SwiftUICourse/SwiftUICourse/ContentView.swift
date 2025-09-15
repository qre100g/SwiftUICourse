//
//  ContentView.swift
//  SwiftUICourse
//
//  Created by Mukesh Nagi Reddy on 14/09/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                
                NavigationLink("Word Scramble") { WordScramble() }
                NavigationLink("Animations Demo") { AnimationsDemo() }
                
            }.navigationTitle("SwiftUI")
        }
    }
}

#Preview {
    ContentView()
}
