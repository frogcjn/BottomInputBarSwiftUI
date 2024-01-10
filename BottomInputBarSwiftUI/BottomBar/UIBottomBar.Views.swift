//
//  UIBottomBar.Views.swift
//  BottomInputBarSwiftUI
//
//  Created by Cao, Jiannan on 1/10/24.
//

import UIKit

extension UIBottomBar {
    struct Views {
         let backdrop: UIView
         let hostingView: UIView
         let guideView: UIView
         
         init(content: UIView) {
             self.backdrop = {
                 let backdrop = UIVisualEffectView(effect: UIBlurEffect(style: .regular))
                 backdrop.translatesAutoresizingMaskIntoConstraints = false
                 return backdrop
             }()
             
             self.guideView = {
                 let guideView = UIView()
                 guideView.translatesAutoresizingMaskIntoConstraints = false
                 guideView.layer.borderColor = UIColor.clear.cgColor
                 guideView.layer.borderWidth = 1
                 return guideView
             }()

             self.hostingView = {
                 let hostingView = content
                 hostingView.backgroundColor = .clear
                 hostingView.translatesAutoresizingMaskIntoConstraints = false
                 return hostingView
             }()
         }
         
     }
}
