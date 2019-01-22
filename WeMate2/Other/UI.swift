//
//  UI.swift
//  divide
//
//  Created by Adil Jiwani on 2018-06-18.
//  Copyright © 2018 Adil Jiwani. All rights reserved.
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
    }
    
    struct Font {
        static func regular(_ size: CGFloat = 15) ->   UIFont { return UIFont(name: "AvenirNext-Regular", size: size)! }
        static func medium(_ size: CGFloat = 15) ->   UIFont { return UIFont(name: "AvenirNext-Medium", size: size)! }
        static func demiBold(_ size: CGFloat = 15) ->   UIFont { return UIFont(name: "AvenirNext-DemiBold", size: size)! }
        static func bold(_ size: CGFloat = 15) ->   UIFont { return UIFont(name: "AvenirNext-Bold", size: size)! }
    }
}

