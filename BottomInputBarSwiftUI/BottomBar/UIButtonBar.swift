//
//  UIButtonBar.swift
//  BottomInputBarSwiftUI
//
//  Created by Cao, Jiannan on 1/10/24.
//

import UIKit

@dynamicMemberLookup
class UIBottomBar : UIView {
    init(content: UIView) {
        views = Views(content: content)
        super.init(frame: .zero)
        superViewConstraints = SuperViewConstraints(source: views, target: self)
        superViewConstraints?.install() // need, since init will not call didSet
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        targetViewConstraints = RootViewConstraints(source: views, target: window?.rootViewController?.view)
    }
    
    override func updateConstraints() {
        super.updateConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        targetViewConstraints?.updateKeyboardDismissPadding()
    }
    
    // views, constraints
    
    let views: Views
    subscript<T>(dynamicMember keyPath: KeyPath<Views, T>) -> T {
        views[keyPath: keyPath]
    }
    
    var targetViewConstraints: RootViewConstraints? {
        didSet {
            oldValue?.uninstall()
            targetViewConstraints?.install()
        }
    }
    var superViewConstraints: SuperViewConstraints? {
        didSet {
            oldValue?.uninstall()
            superViewConstraints?.install()
        }
    }
}
