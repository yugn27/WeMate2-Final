//
//  UITextFieldExt.swift
//  WeMate
//
//  Created by Yash Nayak on 09/01/19.
//  Copyright © 2019 Yash Nayak. All rights reserved.
//

import UIKit

extension UITextField {
    func underlined() {
        var frameRect: CGRect = self.frame
        frameRect.size.height = 30
        self.frame = frameRect
        let border = CALayer()
        let width = CGFloat(0.5)
        border.borderColor = UI.Colours.white.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width, height: self.frame.size.height)
        
        border.borderWidth = width
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
}
