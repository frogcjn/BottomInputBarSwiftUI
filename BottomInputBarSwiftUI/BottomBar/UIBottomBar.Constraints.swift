//
//  UIBottomBar.Constraints.swift
//  BottomInputBarSwiftUI
//
//  Created by Cao, Jiannan on 1/10/24.
//

import UIKit

protocol Constraints {
    associatedtype Source
    associatedtype Target: UIView
    init?(source: Source, target: Target?)
    func install()
    func uninstall()
}

struct SuperViewConstraints : Constraints {
     
     private let source: UIBottomBar.Views
     private let target: UIView
     private let constraints: [NSLayoutConstraint]
     
     init?(source: UIBottomBar.Views, target: UIView? = nil) {
         guard let target else { return nil }

   
         let hostingView = source.hostingView
         let backdrop    = source.backdrop
         
         let constraints = [
            hostingView.topAnchor.constraint(equalTo: backdrop.topAnchor),
            backdrop.bottomAnchor.constraint(greaterThanOrEqualTo: hostingView.bottomAnchor),
            hostingView.leadingAnchor.constraint(equalTo: backdrop.leadingAnchor),
            backdrop.trailingAnchor.constraint(equalTo: hostingView.trailingAnchor),
        
            backdrop.topAnchor.constraint(equalTo: target.topAnchor),
            backdrop.bottomAnchor.constraint(equalTo: target.bottomAnchor),
            backdrop.leadingAnchor.constraint(equalTo: target.leadingAnchor),
            backdrop.trailingAnchor.constraint(equalTo: target.trailingAnchor),
        ]
         backdrop.setContentHuggingPriority(.required, for: .vertical)
         target.setContentHuggingPriority(.required, for: .vertical)

         self.source = source
         self.target = target
         self.constraints = constraints
     }
     
     func install() {
         //superView.backgroundColor = .green
         target.layer.borderColor = UIColor.green.cgColor
         target.layer.borderWidth = 1
         target.isUserInteractionEnabled = true
         target.translatesAutoresizingMaskIntoConstraints = false
         
         target.addSubview(source.backdrop)
         target.addSubview(source.guideView)
         target.addSubview(source.hostingView)
         
         NSLayoutConstraint.activate(constraints)
     }
     
     func uninstall() {
         NSLayoutConstraint.deactivate(constraints)
         
         source.backdrop.removeFromSuperview()
         source.guideView.removeFromSuperview()
         source.hostingView.removeFromSuperview()
     }
 }

struct RootViewConstraints : Constraints {
     
    private let source: UIBottomBar.Views
    private let target: UIView
    private let constraints: [NSLayoutConstraint]
    
    init?(source: UIBottomBar.Views, target: UIView?) {
        guard let target else { return nil }
        
        let hostingView = source.hostingView
        let guideView   = source.guideView
        let backdrop    = source.backdrop
        
        target.keyboardLayoutGuide.usesBottomSafeArea = false
        let constraints = [
                backdrop.leadingAnchor.constraint(equalTo: target.keyboardLayoutGuide.leadingAnchor),
                backdrop.trailingAnchor.constraint(equalTo: target.keyboardLayoutGuide.trailingAnchor),
                backdrop.bottomAnchor.constraint(equalTo: target.keyboardLayoutGuide.topAnchor),

                hostingView.leadingAnchor.constraint(greaterThanOrEqualTo: target.safeAreaLayoutGuide.leadingAnchor),
                hostingView.trailingAnchor.constraint(lessThanOrEqualTo: target.safeAreaLayoutGuide.trailingAnchor),
                hostingView.bottomAnchor.constraint(lessThanOrEqualTo: target.safeAreaLayoutGuide.bottomAnchor),

                guideView.leadingAnchor.constraint(equalTo: target.keyboardLayoutGuide.leadingAnchor),
                guideView.trailingAnchor.constraint(equalTo: target.keyboardLayoutGuide.trailingAnchor),
                guideView.topAnchor.constraint(equalTo: target.keyboardLayoutGuide.topAnchor),
                guideView.bottomAnchor.constraint(equalTo: target.keyboardLayoutGuide.bottomAnchor)
        ]
        
        self.source = source
        self.target = target
        self.constraints = constraints
    }
    
    func install() {
        NSLayoutConstraint.activate(constraints)
    }
    
    func uninstall() {
        NSLayoutConstraint.deactivate(constraints)
    }
    
    func updateKeyboardDismissPadding() {
        target.keyboardLayoutGuide.keyboardDismissPadding = source.hostingView.intrinsicContentSize.height
    }
 }

 
