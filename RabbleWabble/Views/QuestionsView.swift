//
//  QuestionsView.swift
//  RabbleWabble
//
//  Created by Santosh Chandrasekharan on 27/08/19.
//  Copyright © 2019 Santosh Chandrasekharan. All rights reserved.
//

import UIKit

class QuestionsView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    @IBOutlet public var answerLabel: UILabel!
    @IBOutlet public var correctCountLabel: UILabel!
    @IBOutlet public var incorrectCountLabel: UILabel!
    @IBOutlet public var promptLabel: UILabel!
    @IBOutlet public var hintLabel: UILabel!

}
