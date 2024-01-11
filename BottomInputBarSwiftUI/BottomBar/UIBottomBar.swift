//
//  UIButtonBar.swift
//  BottomInputBarSwiftUI
//
//  Created by Cao, Jiannan on 1/10/24.
//

import UIKit

class UIBottomBar : UIView {
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // var backgroundView: UIView { self }
    var views: Views!
    
    init(hostingView: UIView, frame: CGRect = .zero) {
        super.init(frame: frame)
        self.views = Views(hostingView: hostingView, superview: self)
    }
    
    var keyboardConstraints: WindowConstrints? {
        didSet {
            oldValue?.uninstall()
            keyboardConstraints?.install()
        }
    }
    
    var superViewConstraints: SuperViewConstraints? {
        didSet {
            oldValue?.uninstall()
            superViewConstraints?.install()
        }
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        superViewConstraints = SuperViewConstraints(source: views,  target: views.floatingView)
    }
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        keyboardConstraints = WindowConstrints(source: views, target: WindowConstrints.Target(window: window))
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        keyboardConstraints?.updateKeyboardDismissPadding()
    }
    
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        views.hostingView.systemLayoutSizeFitting(targetSize, withHorizontalFittingPriority: horizontalFittingPriority, verticalFittingPriority: verticalFittingPriority)
    }
}

