//
//  TextField.swift
//  BottomInputBarSwiftUI
//
//  Created by Cao, Jiannan on 1/10/24.
//

import SwiftUI

struct TextField : View {
    
    let title: String
    
    @Binding
    var text: String
    
    public init<S>(_ title: S, text: Binding<String>) where S : StringProtocol {
        self.title = String(title)
        self._text = text
    }
    
    var body : some View {
        SwiftUI.TextField(title, text: $text)
            .introspect(.textField, on: .iOS(.v17)) { $0.inputAccessoryView = nil }
    }
}
