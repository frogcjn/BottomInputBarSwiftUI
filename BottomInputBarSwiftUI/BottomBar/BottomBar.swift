//
//  BottomBar.swift
//  BottomInputBarSwiftUI
//
//  Created by Cao, Jiannan on 1/10/24.
//

import SwiftUI

extension View {
    func bottomBar<Content: View>(@ViewBuilder content: @escaping () -> Content) -> some View {
        modifier(BottomBar.Modifier(barContent: content))
    }
}

struct BottomBar {
    @Observable
    class Publisher {
        var height: CGFloat?
        
        @ObservationIgnored
        var uiBottomBar: UIBottomBar?
    }
    
    struct Modifier<BarContent : View>: ViewModifier {
        
        @ViewBuilder
        let barContent: () -> BarContent
        
        @State
        private var publisher = BottomBar.Publisher()
        
        func body(content: Content) -> some View {
            content
                .safeAreaPadding(.bottom, publisher.height)
                .introspect(.viewController, on: .iOS(.v17)) {
                    guard publisher.uiBottomBar == nil else { return }
                    let uiBottomBar = UIBottomBar(content: _UIHostingView(rootView: barContent().readSize { publisher.height = $0.height }))
                    $0.view.addSubview(uiBottomBar)
                    publisher.uiBottomBar = uiBottomBar
                }
        }
    }
}
