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
                TextField("123", text: .constant("123"))
                    .textFieldStyle(.roundedBorder)
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
            .safeAreaInset(edge: .bottom) {
                BottomBar {
                    TextField("123", text: .constant("123"))
                        .textFieldStyle(.roundedBorder)
                        .padding()
                }.border(.red.opacity(0.5))
            }
            .navigationTitle("Message List")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
