//
// StretchyImageView.swift
// 
// Created by Alessio Sardella on 04/04/2019.
// Copyright 2019 Lepaya <http://www.lepaya.com>. All rights reserved.
//

import UIKit
import SnapKit

final class StretchyImageView: UIView {
    
    private var imageView: UIImageView!
    
    init(frame: CGRect, image: UIImage) {
        
        super.init(frame: frame)
        
        self.imageView = UIImageView(frame: self.bounds)
        self.imageView.image = image
        self.imageView.contentMode = .scaleAspectFill
        self.imageView.layer.masksToBounds = true
        addSubview(self.imageView)
        
    }
    
    public final func makeImageStretchy(bindTopToView binder: UIView) {
        
        self.imageView.snp.makeConstraints { (make) in
            
                make.left.right.equalTo(self)
                make.top.equalTo(binder)
                make.bottom.equalTo(self.snp.bottom)
            
        }
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
