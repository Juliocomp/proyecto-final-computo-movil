//
//  CeldaTableViewCell.swift
//  cm_07
//
//  Created by Germán Santos Jaimes on 18/09/24.
//

import UIKit

class CeldaTableViewCell: UITableViewCell {

    @IBOutlet weak var letrero: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
