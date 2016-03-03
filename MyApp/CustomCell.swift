//
//  PlaceCell.swift
//  Lugares favoritos
//
//  Created by vriusgil on 29/01/16.
//  Copyright © 2015 Victor Rius. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet var label1: UILabel!
    @IBOutlet var label2: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
