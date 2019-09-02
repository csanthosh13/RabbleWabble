//
//  RandomQuestionStrategy.swift
//  RabbleWabble
//
//  Created by Santosh Chandrasekharan on 29/08/19.
//  Copyright © 2019 Santosh Chandrasekharan. All rights reserved.
//

import Foundation

// 1
import GameplayKit.GKRandomSource

public class RandomQuestionStrategy: BaseQuestionStrategy {
    public convenience init(
        questionGroupCaretaker: QuestionGroupCaretaker) {
        let questionGroup =
            questionGroupCaretaker.selectedQuestionGroup!
        let randomSource = GKRandomSource.sharedRandom()
        let questions = randomSource.arrayByShufflingObjects(
            in: questionGroup.questions) as! [Question]
        self.init(questionGroupCaretaker: questionGroupCaretaker,
                  questions: questions)
    }
}
