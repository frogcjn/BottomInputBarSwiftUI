//
//  MessageList.swift
//  BottomInputBarSwiftUI
//
//  Created by Cao, Jiannan on 1/10/24.
//

import SwiftUI

struct MessageList: View {
        
    var body: some View {
        ScrollViewReader { proxy in
            List {
                ForEach(Array(1..<20), id: \.self) {
                    Text("\($0)")
                }
            }
            .onReceive(NotificationCenter.default.publisher(for: UIApplication.keyboardDidShowNotification)) { _ in
                withAnimation {
                    proxy.scrollTo(19, anchor: .bottom)
                }
            }
            .onAppear {
                proxy.scrollTo(19, anchor: .bottom)
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
}
