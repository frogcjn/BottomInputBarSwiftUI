//
//  MessageList.swift
//  BottomInputBarSwiftUI
//
//  Created by Cao, Jiannan on 1/10/24.
//

import SwiftUI

struct MessageList: View {
    
    let data = Array(1..<20)
        
    var body: some View {
        ScrollViewReader { proxy in
            List {
                TextField("123", text: .constant("123"))
                    .textFieldStyle(.roundedBorder)
                ForEach(data, id: \.self) {
                    Text("\($0)")
                }
            }
            .onAppear {
                proxy.scrollTo(data.last, anchor: .bottom)
            }
            .onReceive(NotificationCenter.default.publisher(for: UIApplication.keyboardDidShowNotification)) { _ in
                withAnimation {
                    proxy.scrollTo(data.last, anchor: .bottom)
                }
            }
        }
        .scrollDismissesKeyboard(.interactively)
        .safeAreaInset(edge: .bottom) {
            BottomBar {
                TextField("123", text: .constant("123"))
                    .textFieldStyle(.roundedBorder)
                    .padding()
            }
        }
    }
}
