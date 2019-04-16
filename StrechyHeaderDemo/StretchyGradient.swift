//
// File.swift
// 
// Created by Alessio Sardella on 15/04/2019.
// Copyright 2019 Lepaya <http://www.lepaya.com>. All rights reserved.
//

import UIKit
import SnapKit

final class StretchyGradient: UIView {
    
    var gradient: CAGradientLayer!
    
     init(frame: CGRect, color1: UIColor, color2: UIColor) {
        
        super.init(frame: frame)
        self.autoresizingMask = .flexibleHeight
        
        self.gradient = CAGradientLayer()
        self.gradient.frame = self.bounds
        self.gradient.startPoint = CGPoint(x: 0.5, y: 0.0)
        self.gradient.endPoint = CGPoint(x: 0.5, y: 1.0)
        self.gradient.colors = [color1.cgColor, color2.cgColor]
        self.layer.insertSublayer(self.gradient, at: 0)
    }
    
    /**
     Call this method to actually make the StretchyGradient 'stretchy'
     
     - Parameters:
        - binder: the top view to anchor the StretchyGradient, usually the superview of the UIScrollView
     */
    final func makeViewStretchy(bindTopToView binder: UIView) {
        
        if let superview = self.superview {
            self.snp.makeConstraints { (make) in
                
                make.left.right.equalTo(superview)
                make.top.equalTo(binder)
                make.bottom.equalTo(superview.snp.bottom)
                
            }
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        CATransaction.begin()
        CATransaction.setAnimationDuration(0)
        self.gradient.frame = self.bounds
        CATransaction.commit()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
