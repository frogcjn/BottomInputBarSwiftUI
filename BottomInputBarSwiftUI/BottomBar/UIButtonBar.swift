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
    
    init(content: UIView) {
        views = Views(content: content)
        super.init(frame: .zero)
        
        //backgroundColor = .green
        layer.borderColor = UIColor.green.cgColor
        layer.borderWidth = 1
        isUserInteractionEnabled = true
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(views.backdrop)
        addSubview(views.guideView)
        addSubview(views.hostingView)
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        superViewConstraints = SuperViewConstraints(source: views, target: self)
        keyboardConstraints = KeyboardConstraints(source: views, target: superview)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        keyboardConstraints?.updateKeyboardDismissPadding()
    }
    
    // views, constraints
    
    let views: Views
    subscript<T>(dynamicMember keyPath: KeyPath<Views, T>) -> T {
        views[keyPath: keyPath]
    }
    
    var keyboardConstraints: KeyboardConstraints? {
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
}
