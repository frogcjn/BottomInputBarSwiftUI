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
    
    typealias UIViewType = UIFloatingView
    
    func makeUIView(context: Context) -> UIViewType {
        UIFloatingView(content: UIBottomBar(content: _UIHostingView(rootView: bottomBar)))
    }
        
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    func sizeThatFits(_ proposal: ProposedViewSize, uiView: Self.UIViewType, context: Self.Context) -> CGSize? {
        return uiView.content.systemLayoutSizeFitting(
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

class UIFloatingView : UIView {
    let content: UIView
    
    init(content: UIView, frame: CGRect = .zero) {
        self.content = content
        super.init(frame: frame)
        addSubview(content)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
