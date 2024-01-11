//
//  UIBottomBar.Constraints.swift
//  BottomInputBarSwiftUI
//
//  Created by Cao, Jiannan on 1/10/24.
//

import UIKit

protocol Constraints {
    associatedtype Source
    associatedtype Target
    init?(source: Source, target: Target?)
    func install()
    func uninstall()
    
    var constraints: [NSLayoutConstraint] { get }
}

extension Constraints {
    func install() {
        NSLayoutConstraint.activate(constraints)
    }
    
    func uninstall() {
        NSLayoutConstraint.deactivate(constraints)
    }
}

extension UIBottomBar {
    struct SuperViewConstraints : Constraints {
        
        private let source: UIBottomBar.Views
        private let target: UIView
        let constraints: [NSLayoutConstraint]
        
        init?(source: UIBottomBar.Views, target: UIView? = nil) {
            guard let target else { return nil }
            
            let hostingView = source.hostingView
            let backgroundView = source.backgroundView
            
            let constraints = [
                backgroundView.topAnchor.constraint(equalTo: target.topAnchor),
                backgroundView.bottomAnchor.constraint(equalTo: target.bottomAnchor),
                backgroundView.leadingAnchor.constraint(equalTo: target.leadingAnchor),
                backgroundView.trailingAnchor.constraint(equalTo:target.trailingAnchor),
                
                hostingView.topAnchor.constraint(equalTo: backgroundView.topAnchor),
                hostingView.bottomAnchor.constraint(lessThanOrEqualTo: backgroundView.bottomAnchor),
                hostingView.leadingAnchor.constraint(greaterThanOrEqualTo: backgroundView.leadingAnchor),
                hostingView.trailingAnchor.constraint(lessThanOrEqualTo: backgroundView.trailingAnchor)
            ]
            
            self.source = source
            self.target = target
            self.constraints = constraints
        }
    }
    
    struct WindowConstrints : Constraints {
        
        let source: UIBottomBar.Views
        let target: Target
        
        
        let constraints: [NSLayoutConstraint]
        
        init?(source: UIBottomBar.Views, target: Target?) {
            
            let hostingView = source.hostingView
            let backgroundView = source.backgroundView
            
            guard let target else { return nil }
            let window = target.window
            let keyboardLayoutGuide = target.keyboardLayoutGuide
            let safeAreaLayoutGuide = target.safeAreaLayoutGuide
            
            hostingView.setContentCompressionResistancePriority(.required, for: .horizontal)
            let constraints = [
                // backgroundView == window (without top)
                backgroundView.leadingAnchor.constraint(equalTo: window.leadingAnchor),
                backgroundView.trailingAnchor.constraint(equalTo: window.trailingAnchor),
                backgroundView.bottomAnchor.constraint(equalTo: window.bottomAnchor),
                
                // hostingView | keyboard (V)
                hostingView.bottomAnchor.constraint(equalTo: keyboardLayoutGuide.topAnchor),
                
                // hostingView == keyboard (H)
                hostingView.centerXAnchor.constraint(equalTo: keyboardLayoutGuide.centerXAnchor),
                {
                    let constraint = hostingView.widthAnchor.constraint(equalTo: keyboardLayoutGuide.widthAnchor)
                    constraint.priority -= 1
                    return constraint
                }(),
                
                // hostingView <= safeArea
                hostingView.topAnchor.constraint(greaterThanOrEqualTo: safeAreaLayoutGuide.topAnchor),
                hostingView.bottomAnchor.constraint(lessThanOrEqualTo: safeAreaLayoutGuide.bottomAnchor),
                hostingView.leadingAnchor.constraint(greaterThanOrEqualTo: safeAreaLayoutGuide.leadingAnchor),
                hostingView.trailingAnchor.constraint(lessThanOrEqualTo: safeAreaLayoutGuide.trailingAnchor)
            ]
            
            self.source = source
            self.target = target
            self.constraints = constraints
        }
        
        func updateKeyboardDismissPadding() {
            target.keyboardLayoutGuide.keyboardDismissPadding = source.hostingView.intrinsicContentSize.height
        }
        
        struct Target {
            let window: UIWindow
            let keyboardLayoutGuide: UIKeyboardLayoutGuide
            let safeAreaLayoutGuide: UILayoutGuide
            init?(window: UIWindow?) {
                guard let window, let rootView = window.rootViewController?.view else { return nil }
                self.window = window
                keyboardLayoutGuide = rootView.keyboardLayoutGuide
                safeAreaLayoutGuide = window.safeAreaLayoutGuide
            }
        }
    }
}


