//
//  SizeReader.swift
//  BottomInputBarSwiftUI
//
//  Created by Cao, Jiannan on 1/11/24.
//

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
