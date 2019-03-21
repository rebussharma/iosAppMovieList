//
//  segueSoftwareTableViewCell.swift
//  project_mod_two
//
//  Created by Fall2017 on 11/2/17.
//  Copyright © 2017 Fall2017. All rights reserved.
//

import UIKit

class segueSoftwareTableViewCell: UITableViewCell {
  
    @IBOutlet weak var softwareName: UITextView!
    
  
    @IBOutlet weak var softwareImage: UIImageView!
  
    @IBOutlet weak var cost: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
