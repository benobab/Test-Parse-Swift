//
//  Cell.swift
//  Test
//
//  Created by BenLacroix on 17/06/2015.
//  Copyright (c) 2015 BenLacroix. All rights reserved.
//

import UIKit

class TextCell: UITableViewCell {

     @IBOutlet weak var dataLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
