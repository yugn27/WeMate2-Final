//
//  GroupCell.swift
//  WeMate
//
//  Created by Yash Nayak on 09/01/19.
//  Copyright © 2019 Yash Nayak. All rights reserved.
//

import UIKit

class GroupCell: UITableViewCell {

    @IBOutlet weak var groupType: UIImageView!
    @IBOutlet weak var groupNameLbl: UILabel!
    @IBOutlet weak var memberNumLbl: UILabel!
    
    func configureCell(groupName: String, memberCount: Int) {
        self.groupNameLbl.text = groupName
        self.memberNumLbl.text = "\(memberCount) members"
    }
}
