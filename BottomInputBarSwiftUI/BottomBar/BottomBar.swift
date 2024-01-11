//
//  Wrapper.swift
//  BottomInputBarSwiftUI
//
//  Created by Cao, Jiannan on 1/10/24.
//

import SwiftUI
    
struct BottomBar<BottomBar: View> : UIViewRepresentable {
    @ViewBuilder
    let bottomBar: BottomBar
    
    typealias UIViewType = UIBottomBar
    
    func makeUIView(context: Context) -> UIViewType {
        UIBottomBar(hostingView: _UIHostingView(rootView: bottomBar))
    }
        
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    func sizeThatFits(_ proposal: ProposedViewSize, uiView: Self.UIViewType, context: Self.Context) -> CGSize? {
        uiView.systemLayoutSizeFitting(
            {
                var size = proposal.replacingUnspecifiedDimensions()
                size.height = UIView.layoutFittingCompressedSize.height
                return size
            }(),
            withHorizontalFittingPriority: .defaultHigh,
            verticalFittingPriority: .fittingSizeLevel
        )
    }
 }
