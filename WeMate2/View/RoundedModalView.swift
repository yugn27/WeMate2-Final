//
//  RoundedModalView.swift
//  WeMate
//
//  Created by Yash Nayak on 09/01/19.
//  Copyright © 2019 Yash Nayak. All rights reserved.
//

import UIKit
@IBDesignable
class RoundedModalView: UIView {
    @IBInspectable var cornerRadius: CGFloat = 7.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    override func awakeFromNib() {
        self.setupView()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.setupView()
    }
    
    func setupView () {
        self.layer.cornerRadius = cornerRadius
    }
}
