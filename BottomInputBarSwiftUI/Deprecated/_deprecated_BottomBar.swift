//
//  BottomBar.swift
//  BottomInputBarSwiftUI
//
//  Created by Cao, Jiannan on 1/9/24.
//
/*
import SwiftUI
/*
struct UIBottomBarRepresentable<Content: View> : UIViewRepresentable {
    
    @ViewBuilder
    let content: Content
    
    func makeUIView(context: Context) -> UIBottomBar<Content> {
        UIBottomBar(content: content)
        //view.setContentHuggingPriority(.required, for: .vertical)
    }
    
    func updateUIView(_ uiView: UIBottomBar<Content>, context: Context) {
        
    }
    
    func sizeThatFits(_ proposal: ProposedViewSize, uiView: UIBottomBar<Content>, context: Context) -> CGSize? {
        print("intrinsicContentSize", uiView.hostingView.intrinsicContentSize)
        return CGSize(width: proposal.replacingUnspecifiedDimensions().width, height: 34 + 16)
        //print(uiView.frame.size, proposal)
        //return nil
        
        /*var targetSize = proposal.replacingUnspecifiedDimensions()
        var size = uiView.textField.systemLayoutSizeFitting(targetSize, withHorizontalFittingPriority: .required, verticalFittingPriority: .fittingSizeLevel)
        size.height += 16
        print("size", size)

        // uiView.sizeToFit()
        
        //let size = CGSize(width: targetSize.width, height: uiView.backdrop.frame.height)
        // print(uiView.frame.size)
        return size*/
    }
}*/
/*
#Preview {
    BottomBar()
}
*/

struct KeyboardLayoutGuide : UIViewRepresentable {
    
    
    func makeUIView(context: Context) -> UIKeyboardLayoutGuide {
        UIKeyboardLayoutGuide()
        //view.setContentHuggingPriority(.required, for: .vertical)
    }
    
    func updateUIView(_ uiView: UIKeyboardLayoutGuide, context: Context) {
        
    }
    
    func sizeThatFits(_ proposal: ProposedViewSize, uiView: UIKeyboardLayoutGuide, context: Context) -> CGSize? {
        CGSize(width: proposal.replacingUnspecifiedDimensions().width, height: 34 + 16)
    }
    /*
    func sizeThatFits(_ proposal: ProposedViewSize, uiView: UIKeyboardLayoutGuide, context: Context) -> CGSize? {
        //print(uiView.frame.size, proposal)
        //return nil
        
        var targetSize = proposal.replacingUnspecifiedDimensions()
        targetSize.height = 0
        
        let size = uiView.systemLayoutSizeFitting(targetSize, withHorizontalFittingPriority: .required, verticalFittingPriority: .defaultLow)
        
        //let size = CGSize(width: targetSize.width, height: uiView.backdrop.frame.height)
        //print(size)
        return size
    }*/
}


class UIKeyboardLayoutGuide : UIView {
    let guideView: UIView!
    
    var targetView: UIView?
    let textField: UITextField!

    
    init(targetView: UIView? = nil) {
        self.targetView = targetView
        
        self.guideView = {
            let guideView = UIView()
            guideView.layer.borderColor = UIColor.red.cgColor
            guideView.layer.borderWidth = 1
            guideView.backgroundColor = .red
            return guideView
        }()
        
        self.textField = {
            let textField = UITextField()
            textField.borderStyle = .roundedRect
            textField.borderStyle = .roundedRect
            textField.backgroundColor = .green
            return textField
        }()
        
        
        super.init(frame: .zero)
        
        installView()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func installView() {
        
        backgroundColor = .yellow
        //layer.borderColor = UIColor.red.cgColor
        //layer.borderWidth = 1
        isUserInteractionEnabled = true
        
        //translatesAutoresizingMaskIntoConstraints = false
        guideView.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        //addSubview(backdrop)
        addSubview(guideView)
        addSubview(textField)
        
        
    }
    
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        
        guard let targetView = window?.rootViewController?.view else {
            return
        }
        
        NSLayoutConstraint.deactivate(guideView.constraints)
        NSLayoutConstraint.deactivate(textField.constraints)

        //targetView.keyboardLayoutGuide.usesBottomSafeArea = false
        NSLayoutConstraint.activate([
            //view.safeAreaLayoutGuide.leadingAnchor.constraint(lessThanOrEqualTo: textField.leadingAnchor),
            //view.safeAreaLayoutGuide.trailingAnchor.constraint(greaterThanOrEqualTo: textField.trailingAnchor),
            guideView.leadingAnchor.constraint(equalTo: targetView.keyboardLayoutGuide.leadingAnchor),
            guideView.trailingAnchor.constraint(equalTo: targetView.keyboardLayoutGuide.trailingAnchor),
            guideView.topAnchor.constraint(equalTo: targetView.keyboardLayoutGuide.topAnchor),
            guideView.bottomAnchor.constraint(equalTo: targetView.keyboardLayoutGuide.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            textField.leadingAnchor.constraint(equalToSystemSpacingAfter: guideView.leadingAnchor, multiplier: 1.0),
            guideView.trailingAnchor.constraint(equalToSystemSpacingAfter: textField.trailingAnchor, multiplier: 1.0),
            guideView.topAnchor.constraint(equalToSystemSpacingBelow: textField.bottomAnchor, multiplier: 1.0)
        ])
        
        /*NSLayoutConstraint.activate([
            
            targetView.keyboardLayoutGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: textField.bottomAnchor, multiplier: 1.0),
        ])*/
        
    }
    
    /*
    override func updateConstraints() {
        defer {
            super.updateConstraints()
        }
    
        guard let targetView = window?.rootViewController?.view else {
            return
        }
        
        //guideView.removeFromSuperview()
        //targetView.addSubview(guideView)
        
        if guideView.constraints.isEmpty {
            
        }
    }*/
}
/*

import UIKit
class UIBottomBar<Content : View> : UIView {
    
    let content: Content
    // let textField: UITextField!
    let hostingView: UIView!
    let guideView: UIView!
    let backdrop: UIVisualEffectView!
    
    //let hostingVC: UIHostingController<Content>
    
    init(content: Content) {
        self.content = content
        self.backdrop = UIVisualEffectView(effect: UIBlurEffect(style: .regular))
        /*self.textField = {
            let textField = UITextField()
            textField.borderStyle = .roundedRect
            return textField
        }()*/
        
        
        
        
        self.guideView = {
            let guideView = UIView()
            guideView.layer.borderColor = UIColor.clear.cgColor
            guideView.layer.borderWidth = 1
            return guideView
        }()
        
        //let hostingVC =
        //self.hostingVC = hostingVC

        self.hostingView = {
            let hostView = _UIHostingView(rootView: content)
            hostView.backgroundColor = .clear
            return hostView
        }()
        
    
        super.init(frame: .zero)
        
        installView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func installView() {
        
        //backgroundColor = .green
        layer.borderColor = UIColor.green.cgColor
        layer.borderWidth = 1
        isUserInteractionEnabled = true
        
        translatesAutoresizingMaskIntoConstraints = false
        //textField.translatesAutoresizingMaskIntoConstraints = false
        hostingView.translatesAutoresizingMaskIntoConstraints = false
        guideView.translatesAutoresizingMaskIntoConstraints = false
        backdrop.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(backdrop)
        // addSubview(textField)
        addSubview(guideView)
        addSubview(hostingView)
        
        /*NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalToSystemSpacingBelow: backdrop.topAnchor, multiplier: 1.0),
            backdrop.bottomAnchor.constraint(greaterThanOrEqualToSystemSpacingBelow: textField.bottomAnchor, multiplier: 1.0),
            textField.leadingAnchor.constraint(equalToSystemSpacingAfter: backdrop.leadingAnchor, multiplier: 1.0),
            backdrop.trailingAnchor.constraint(equalToSystemSpacingAfter: textField.trailingAnchor, multiplier: 1.0),
        ])*/
        
        NSLayoutConstraint.activate([
            hostingView.topAnchor.constraint(equalTo: backdrop.topAnchor),
            backdrop.bottomAnchor.constraint(greaterThanOrEqualTo: hostingView.bottomAnchor),
            hostingView.leadingAnchor.constraint(equalTo: backdrop.leadingAnchor),
            backdrop.trailingAnchor.constraint(equalTo: hostingView.trailingAnchor),
        ])
        
        
        /*NSLayoutConstraint.activate([
            textField.height
        ])*/
        
        
        NSLayoutConstraint.activate([
            backdrop.topAnchor.constraint(equalTo: topAnchor),
            backdrop.bottomAnchor.constraint(equalTo: bottomAnchor),
            backdrop.leadingAnchor.constraint(equalTo: leadingAnchor),
            backdrop.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
            
        
        //backdrop.setContentCompressionResistancePriority(.required, for: .vertical)
        backdrop.setContentHuggingPriority(.required, for: .vertical)
        //setContentCompressionResistancePriority(.required, for: .vertical)
        setContentHuggingPriority(.required, for: .vertical)
    }
    
    var targetView: UIView? {
        didSet {
            
            guard let targetView else {
                return self.targetViewConstraints = []
            }
            
            targetView.keyboardLayoutGuide.usesBottomSafeArea = false
            var constraints : [NSLayoutConstraint] = []
            constraints += [
                backdrop.leadingAnchor.constraint(equalTo: targetView.keyboardLayoutGuide.leadingAnchor),
                backdrop.trailingAnchor.constraint(equalTo: targetView.keyboardLayoutGuide.trailingAnchor),
                backdrop.bottomAnchor.constraint(equalTo: targetView.keyboardLayoutGuide.topAnchor),
            ]
            
            /*NSLayoutConstraint.activate([
                //view.safeAreaLayoutGuide.leadingAnchor.constraint(lessThanOrEqualTo: textField.leadingAnchor),
                //view.safeAreaLayoutGuide.trailingAnchor.constraint(greaterThanOrEqualTo: textField.trailingAnchor),
                textField.leadingAnchor.constraint(greaterThanOrEqualTo: targetView.safeAreaLayoutGuide.leadingAnchor),
                textField.trailingAnchor.constraint(lessThanOrEqualTo: targetView.safeAreaLayoutGuide.trailingAnchor),
                textField.bottomAnchor.constraint(lessThanOrEqualTo: targetView.safeAreaLayoutGuide.bottomAnchor)
            ])*/
            
            constraints += [
                //view.safeAreaLayoutGuide.leadingAnchor.constraint(lessThanOrEqualTo: textField.leadingAnchor),
                //view.safeAreaLayoutGuide.trailingAnchor.constraint(greaterThanOrEqualTo: textField.trailingAnchor),
                hostingView.leadingAnchor.constraint(greaterThanOrEqualTo: targetView.safeAreaLayoutGuide.leadingAnchor),
                hostingView.trailingAnchor.constraint(lessThanOrEqualTo: targetView.safeAreaLayoutGuide.trailingAnchor),
                hostingView.bottomAnchor.constraint(lessThanOrEqualTo: targetView.safeAreaLayoutGuide.bottomAnchor)
            ]
            
            constraints += [
                //view.safeAreaLayoutGuide.leadingAnchor.constraint(lessThanOrEqualTo: textField.leadingAnchor),
                //view.safeAreaLayoutGuide.trailingAnchor.constraint(greaterThanOrEqualTo: textField.trailingAnchor),
                guideView.leadingAnchor.constraint(equalTo: targetView.keyboardLayoutGuide.leadingAnchor),
                guideView.trailingAnchor.constraint(equalTo: targetView.keyboardLayoutGuide.trailingAnchor),
                guideView.topAnchor.constraint(equalTo: targetView.keyboardLayoutGuide.topAnchor),
                guideView.bottomAnchor.constraint(equalTo: targetView.keyboardLayoutGuide.bottomAnchor)
            ]
            
            self.targetViewConstraints = constraints
        }
    }
    
    var targetViewConstraints: [NSLayoutConstraint] = [] {
        didSet {
            NSLayoutConstraint.deactivate(oldValue)
            NSLayoutConstraint.activate(targetViewConstraints)
        }
    }
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        targetView = window?.rootViewController?.view
        
        
        // guard let targetView else { return }
        
        

        
        
        /*hostingView
        
        hostingView.observe(\.contentSize, changeHandler: <#T##(UIView, NSKeyValueObservedChange<Value>) -> Void#>)
        print("XX", hostingView.systemLayoutSizeFitting(.zero))
        print("XXX", frame.height)*/
        
        //setContentHuggingPriority(.defaultLow, for: .vertical)
        //setContentCompressionResistancePriority(.required, for: .vertical)
        // setContentHuggingPriority(.required, for: .vertical)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        targetView?.keyboardLayoutGuide.keyboardDismissPadding = hostingView.intrinsicContentSize.height
    }
    
    /*override var intrinsicContentSize: CGSize {
        hostingView.intrinsicContentSize
    }*/
    
    
    
    /*func update() {
        
    }*/
    
    /*
    func update() {
        // keyboardDismissPadding
        view.keyboardLayoutGuide.keyboardDismissPadding = backdrop.frame.height
        
        // safeAreaInsets
        var addtional = UIEdgeInsets()
        addtional.bottom += max(0, view.safeAreaLayoutGuide.layoutFrame.maxY - backdrop.frame.minY)
        topViewController?.additionalSafeAreaInsets = addtional
        // viewSafeAreaInsetsDidChange()
    }*/
}

*/
*/





