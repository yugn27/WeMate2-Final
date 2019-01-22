//
//  SearchGroupCell.swift
//  WeMate
//
//  Created by Yash Nayak on 09/01/19.
//  Copyright © 2019 Yash Nayak. All rights reserved.
//

import UIKit

class SearchGroupCell: UITableViewCell {

    @IBOutlet weak var groupNameLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell (groupName: String) {
        self.groupNameLbl.text = groupName
        //self.layer.cornerRadius = self.bounds.height / 2
    }

}
