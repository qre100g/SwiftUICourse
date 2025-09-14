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
                
            }.navigationTitle("SwiftUI Course")
        }
    }
}

#Preview {
    ContentView()
}
