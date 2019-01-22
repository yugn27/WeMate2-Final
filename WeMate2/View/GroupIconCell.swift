//
//  GroupIconCell.swift
//  WeMate
//
//  Created by Yash Nayak on 09/01/19.
//  Copyright © 2019 Yash Nayak. All rights reserved.
//

import UIKit

class GroupIconCell: UICollectionViewCell {
    
    @IBOutlet weak var icon: UIImageView!
    
    func configureCell (image: UIImage) {
        icon.image = image
    }
}
