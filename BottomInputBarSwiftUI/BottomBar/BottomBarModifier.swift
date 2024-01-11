//
//  Wrapper.swift
//  BottomInputBarSwiftUI
//
//  Created by Cao, Jiannan on 1/10/24.
//

import SwiftUI

extension View {
    func bottomBar<Content: View>(@ViewBuilder content: () -> Content) -> some View {
        modifier(Modifier(barContent: content))
    }
}

struct Modifier<BarContent : View>: ViewModifier {
    
    @ViewBuilder
    let barContent: BarContent
    
    @State
    private var height: CGFloat?
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottom) {
            content
                .safeAreaPadding(.bottom, height)
                .ignoresSafeArea(.all, edges: .bottom) // this is for SwiftUI layout interactive dissmissing animation bug
            
            UIBottomBar.ViewRepresentable {
                barContent
            } background: {
                Color.clear.background(Material.bar).readSize { height = $0.height }
            }.border(.blue)
        }
    }
}
