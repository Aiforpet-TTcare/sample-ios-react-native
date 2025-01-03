//
//  CameraTypeCell.swift
//  Example
//
//  Created by Jay Lee on 5/23/24.
//

import UIKit

class CameraTypeCell: UITableViewCell {
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
