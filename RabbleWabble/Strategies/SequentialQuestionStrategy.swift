//
//  SequentialQuestionStrategy.swift
//  RabbleWabble
//
//  Created by Santosh Chandrasekharan on 28/08/19.
//  Copyright © 2019 Santosh Chandrasekharan. All rights reserved.
//

import Foundation

public class SequentialQuestionStrategy: BaseQuestionStrategy {
    public convenience init(
        questionGroupCaretaker: QuestionGroupCaretaker) {
        let questionGroup =
            questionGroupCaretaker.selectedQuestionGroup!
        let questions = questionGroup.questions
        self.init(questionGroupCaretaker: questionGroupCaretaker,
                  questions: questions)
    }
}
