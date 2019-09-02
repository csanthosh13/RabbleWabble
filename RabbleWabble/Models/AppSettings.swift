//
//  AppSettings.swift
//  RabbleWabble
//
//  Created by Santosh Chandrasekharan on 30/08/19.
//  Copyright © 2019 Santosh Chandrasekharan. All rights reserved.
//

import Foundation

public class AppSettings {
    // MARK: - Keys
    private struct Keys {
        static let questionStrategy = "questionStrategy"
    }
    // MARK: - Static Properties
    public static let shared = AppSettings()
    // MARK: - Object Lifecycle
    // MARK: - Instance Properties
    public var questionStrategyType: QuestionStrategyType {
        get {
            let rawValue = userDefaults.integer(
                forKey: Keys.questionStrategy)
            return QuestionStrategyType(rawValue: rawValue)!
        } set {
            userDefaults.set(newValue.rawValue,
                             forKey: Keys.questionStrategy)
        }
    }
    private let userDefaults = UserDefaults.standard
    // MARK: - Instance Methods
    public func questionStrategy(
        for questionGroupCareTaker: QuestionGroupCaretaker) -> QuestionStrategy {
        return questionStrategyType.questionStrategy(
            for: questionGroupCareTaker)
    }
    private init() { }
}

// MARK: - QuestionStrategyType
public enum QuestionStrategyType: Int, CaseIterable {
    case random
    case sequential
    // MARK: - Instance Methods
    public func title() -> String {
        switch self {
        case .random:
            return "Random"
        case .sequential:
            return "Sequential"
        }
    }
    public func questionStrategy(
        for questionGroupCaretaker: QuestionGroupCaretaker)
        -> QuestionStrategy {
            switch self {
            case .random:
                return RandomQuestionStrategy(
                    questionGroupCaretaker: questionGroupCaretaker)
            case .sequential:
                return SequentialQuestionStrategy(
                    questionGroupCaretaker: questionGroupCaretaker)
            }
    }
}
