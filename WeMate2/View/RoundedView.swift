//
//  RoundedOutlineTextView.swift
//  WeMate
//
//  Created by Yash Nayak on 09/01/19.
//  Copyright © 2019 Yash Nayak. All rights reserved.
//

import UIKit
@IBDesignable
class RoundedView: UIView {
        @IBInspectable var cornerRadius: CGFloat = 7.0 {
            didSet {
                self.layer.cornerRadius = self.bounds.height / 2
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
        self.layer.cornerRadius = self.bounds.height / 2
    }
}
