//
//  HistoryTableViewCell.swift
//  emissi0n
//
//  Created by Gulshan Meem on 11/6/22.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {

    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var distance: UILabel!
    @IBOutlet weak var emission: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
 
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
