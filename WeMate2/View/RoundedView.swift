//
//  RoundedOutlineTextView.swift
//  divide
//
//  Created by Adil Jiwani on 2017-11-29.
//  Copyright © 2017 Adil Jiwani. All rights reserved.
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
