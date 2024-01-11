//
//  UIBottomBar.Views.swift
//  BottomInputBarSwiftUI
//
//  Created by Cao, Jiannan on 1/10/24.
//

import UIKit

extension UIBottomBar {
    struct Views {
        
        let barView: UIView
        let backgroundView: UIView
        let floatingView: UIView
         
        init(barView: UIView, backgroundView: UIView, superview: UIView) {

            barView.translatesAutoresizingMaskIntoConstraints = false
            self.barView = barView
            
            //let backgroundView = UIVisualEffectView(effect: UIBlurEffect(style: .regular))
            backgroundView.translatesAutoresizingMaskIntoConstraints = false
            self.backgroundView = backgroundView
            
            let floatingView = UIView()
            //floatingView.layer.borderColor = UIColor.green.cgColor
            //floatingView.layer.borderWidth = 1
            floatingView.translatesAutoresizingMaskIntoConstraints = false
            self.floatingView = floatingView
 
            // superview
            //superview.translatesAutoresizingMaskIntoConstraints = false
            superview.addSubview(floatingView)
            floatingView.addSubview(backgroundView)
            floatingView.addSubview(barView)
        }
    }
}
