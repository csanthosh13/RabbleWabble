//
//  QuestionGroupCareTaker.swift
//  RabbleWabble
//
//  Created by Santosh Chandrasekharan on 01/09/19.
//  Copyright © 2019 Santosh Chandrasekharan. All rights reserved.
//

import Foundation

// 1
public final class QuestionGroupCaretaker {
    // MARK: - Properties
    // 2
    private let fileName = "QuestionGroupData"
    public var questionGroups: [QuestionGroup] = []
    public var selectedQuestionGroup: QuestionGroup!
    // MARK: - Object Lifecycle
    public init() {
        // 3
        loadQuestionGroups()
    }
    // 4
    private func loadQuestionGroups() {
        if let questionGroups =
            try? DiskCaretaker.retrieve([QuestionGroup].self,
                                        from: fileName) {
            self.questionGroups = questionGroups
        } else {
            let bundle = Bundle.main
            let url = bundle.url(forResource: fileName,
                                 withExtension: "json")!
            self.questionGroups = try!
                DiskCaretaker.retrieve([QuestionGroup].self, from: url)
            try! save()
        }
    }
    // MARK: - Instance Methods
    // 5
    public func save() throws {
        try DiskCaretaker.save(questionGroups, to: fileName)
    }
}
