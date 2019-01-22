//
//  RoundedOutlineButton.swift
//  WeMate
//
//  Created by Yash Nayak on 09/01/19.
//  Copyright © 2019 Yash Nayak. All rights reserved.
//

import UIKit
@IBDesignable
class RoundedOutlineButton: UIButton {
    @IBInspectable var cornerRadius: CGFloat = 7.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
            self.layer.borderWidth = 1.0
            self.layer.borderColor = self.currentTitleColor.cgColor
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
        self.layer.borderWidth = 1.0
        self.layer.borderColor = self.currentTitleColor.cgColor
    }
}
