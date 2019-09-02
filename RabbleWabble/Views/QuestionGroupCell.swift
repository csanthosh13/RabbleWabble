//
//  QuestionGroupCell.swift
//  RabbleWabble
//
//  Created by Santosh Chandrasekharan on 27/08/19.
//  Copyright © 2019 Santosh Chandrasekharan. All rights reserved.
//

import UIKit

class QuestionGroupCell: UITableViewCell {
    
    @IBOutlet public var titleLabel: UILabel!
    @IBOutlet public var percentageLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
