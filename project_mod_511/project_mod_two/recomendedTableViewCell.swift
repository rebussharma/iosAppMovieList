//
//  recomendedTableViewCell.swift
//  project_mod_two
//
//  Created by Fall2017 on 11/28/17.
//  Copyright © 2017 Fall2017. All rights reserved.
//

import UIKit

class recomendedTableViewCell: UITableViewCell {

    @IBOutlet weak var recomendedName: UITextView!
    
    @IBOutlet weak var recomendedImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
