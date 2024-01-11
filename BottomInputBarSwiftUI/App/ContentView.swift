//
//  ContentView2.swift
//  BottomInputBarSwiftUI
//
//  Created by Cao, Jiannan on 1/10/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            MessageList()
                .navigationTitle("Message List")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}
