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
                proxy.scrollTo(data.last!, anchor: .bottom)
            }
            .onReceive(NotificationCenter.default.publisher(for: UIApplication.keyboardDidShowNotification)) { _ in
                withAnimation {
                    proxy.scrollTo(data.last!, anchor: .bottom)
                }
            }
        }
        .scrollDismissesKeyboard(.interactively)
        .bottomBar {
            TextField("123", text: .constant("123"))
                .textFieldStyle(.roundedBorder)
                .padding()
        }
    }
}

import SwiftUI

struct SizePreferenceKey: PreferenceKey {
  static var defaultValue: CGSize = .zero
  static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
      let next = nextValue()
      value.width += next.width
      value.height += next.height
  }
}

extension View {
    func readSize(onChange: @escaping (CGSize) -> Void) -> some View {
        background(
            GeometryReader { geometryProxy in
                Color.clear.preference(key: SizePreferenceKey.self, value: geometryProxy.size)
            }
          )
        .onPreferenceChange(SizePreferenceKey.self, perform: onChange)
    }
}
