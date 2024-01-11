//
//  UIBottomBar.Views.swift
//  BottomInputBarSwiftUI
//
//  Created by Cao, Jiannan on 1/10/24.
//

import UIKit

extension UIBottomBar {
    struct Views {
        
        let hostingView: UIView
        let backgroundView: UIView
        let floatingView: UIView
        // let guideView: UIView
         
        init(hostingView: UIView, superview: UIView) {
             /*self.guideView = {
                 let guideView = UIView()
                 guideView.translatesAutoresizingMaskIntoConstraints = false
                 //guideView.layer.borderColor = UIColor.red.cgColor
                 //guideView.layer.borderWidth = 1
                 guideView.backgroundColor = .yellow
                 return guideView
             }()*/

            hostingView.translatesAutoresizingMaskIntoConstraints = false
            self.hostingView = hostingView
            
            let backgroundView = UIVisualEffectView(effect: UIBlurEffect(style: .regular))
            backgroundView.translatesAutoresizingMaskIntoConstraints = false
            self.backgroundView = backgroundView
            
            let floatingView = UIView()
            floatingView.layer.borderColor = UIColor.green.cgColor
            floatingView.layer.borderWidth = 1
            floatingView.translatesAutoresizingMaskIntoConstraints = false
            self.floatingView = floatingView
 
            // superview
            superview.translatesAutoresizingMaskIntoConstraints = false
            superview.addSubview(floatingView)
            floatingView.addSubview(backgroundView)
            floatingView.addSubview(hostingView)
        }
    }
}
