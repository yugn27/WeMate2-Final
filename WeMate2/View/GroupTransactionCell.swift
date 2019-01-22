//
//  GroupTransactionCell.swift
//  WeMate
//
//  Created by Yash Nayak on 09/01/19.
//  Copyright © 2019 Yash Nayak. All rights reserved.
//

import UIKit

class GroupTransactionCell: UITableViewCell {

    @IBOutlet weak var owingView: RoundedView!
    @IBOutlet weak var amountLbl: UILabel!
    
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var owingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(description: String, owing: Bool, date: String, amount: Float) {
        self.descriptionLbl.text = description
        self.dateLbl.text = date
        self.amountLbl.text = String(format: "₹%.2f", amount)
        if owing {
            self.owingLabel.text = "YOU OWE:"
            self.owingView.backgroundColor = #colorLiteral(red: 0.8078431373, green: 0.1137254902, blue: 0.007843137255, alpha: 1)
        } else {
            self.owingLabel.text = "YOU ARE OWED:"
            self.owingView.backgroundColor = #colorLiteral(red: 0.2784313725, green: 0.6941176471, blue: 0.3137254902, alpha: 1)
        }
    }

}
