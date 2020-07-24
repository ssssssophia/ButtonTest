//
//  blurView.swift
//  ButtonTest
//
//  Created by Wang Sunyechu on 7/22/20.
//  Copyright © 2020 Wang Sunyechu. All rights reserved.
//

import SwiftUI

struct blurView: UIViewRepresentable {
    
    typealias UIViewType = UIView
    var style: UIBlurEffect.Style
    
    func makeUIView(context: UIViewRepresentableContext<blurView>) -> UIView {
        let view = UIView(frame: CGRect.zero)
        view.backgroundColor = .clear
        
        let blurEffect = UIBlurEffect(style: style)
        let blurview = UIVisualEffectView(effect: blurEffect)
        blurview.translatesAutoresizingMaskIntoConstraints = false
        view.insertSubview(blurview, at: 0)
        
        NSLayoutConstraint.activate([
            blurview.widthAnchor.constraint(equalTo: view.widthAnchor),
            blurview.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<blurView>) {
        
    }
}


