//
//  MessageList.swift
//  BottomInputBarSwiftUI
//
//  Created by Cao, Jiannan on 1/10/24.
//

import SwiftUI

struct MessageList: View {
    var body: some View {
        List {
            TextField("123", text: .constant("123"))
            ForEach(Array(1..<20), id: \.self) {
                Text("\($0)")
            }
        }
        .scrollDismissesKeyboard(.interactively)
        .bottomBar {
            TextField("123", text: .constant("123"))
                .textFieldStyle(.roundedBorder)
                .padding()
        }
        .navigationTitle("Message List")
        .navigationBarTitleDisplayMode(.inline)
    }
}
