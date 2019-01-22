//
//  UI.swift
//  WeMate
//
//  Created by Yash Nayak on 09/01/19.
//  Copyright © 2019 Yash Nayak. All rights reserved.
//

import Foundation
import UIKit
import UIColor_Hex_Swift

enum UI {
    struct Colours {
        static let background = UIColor("#F2F2F2")
        static let offBlack = UIColor("#292727")
        static let defaultBackground = UIColor("#E1E1E1")
        static let lightGrey = UIColor("#D4D4D4")
        static let pink = UIColor("#FF3469")
        static let white = UIColor("#FFFFFF")
        static let rosePink = UIColor("#f88285")
        static let peachyPink = UIColor("#ff9c86")
        static let grdOrange = UIColor("#F39C4C")
        static let grdOrange2 = UIColor("#EE7530")
        // yash test
        
        
    }
    
    struct Font {
        static func regular(_ size: CGFloat = 15) ->   UIFont { return UIFont(name: "AvenirNext-Regular", size: size)! }
        static func medium(_ size: CGFloat = 15) ->   UIFont { return UIFont(name: "AvenirNext-Medium", size: size)! }
        static func demiBold(_ size: CGFloat = 15) ->   UIFont { return UIFont(name: "AvenirNext-DemiBold", size: size)! }
        static func bold(_ size: CGFloat = 15) ->   UIFont { return UIFont(name: "AvenirNext-Bold", size: size)! }
    }
}

