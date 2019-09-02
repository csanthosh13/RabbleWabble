//
//  SelectQuestionGroupViewController.swift
//  RabbleWabble
//
//  Created by Santosh Chandrasekharan on 27/08/19.
//  Copyright © 2019 Santosh Chandrasekharan. All rights reserved.
//

import UIKit

// MARK: - QuestionViewControllerDelegate
extension SelectQuestionGroupViewController:
QuestionViewControllerDelegate {
    public func questionViewController(
        _ viewController: QuestionViewController,
        didCancel questionGroup: QuestionStrategy) {
        navigationController?.popToViewController(self,
                                                  animated: true)
    }
    public func questionViewController(
        _ viewController: QuestionViewController,
        didComplete questionGroup: QuestionStrategy) {
        navigationController?.popToViewController(self,
                                                  animated: true)
    }
}

// MARK: - CreateQuestionGroupViewControllerDelegate
extension SelectQuestionGroupViewController:
CreateQuestionGroupViewControllerDelegate {
    public func createQuestionGroupViewControllerDidCancel(
        _ viewController: CreateQuestionGroupViewController) {
        dismiss(animated: true, completion: nil)
    }
    public func createQuestionGroupViewController(
        _ viewController: CreateQuestionGroupViewController,
        created questionGroup: QuestionGroup) {
        questionGroupCaretaker.questionGroups.append(questionGroup)
        try? questionGroupCaretaker.save()
        dismiss(animated: true, completion: nil)
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource
extension SelectQuestionGroupViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView,
                          numberOfRowsInSection section: Int)
        -> Int {
            return questionGroups.count
    }
    public func tableView(_ tableView: UITableView,
                          cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(
                withIdentifier: "QuestionGroupCell") as! QuestionGroupCell
            let questionGroup = questionGroups[indexPath.row]
            cell.titleLabel.text = questionGroup.title
            // 1
            questionGroup.score.runningPercentage.addObserver(
            cell, options: [.initial, .new]) {
                // 2
                [weak cell] (percentage, _) in
                // 3
                DispatchQueue.main.async {
                    // 4
                    cell?.percentageLabel.text = String(format: "%.0f %%",
                                                        round(100 * percentage))
                }
            }
            return cell
    }
}

// MARK: - UITableViewDelegate
extension SelectQuestionGroupViewController: UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView,
                          willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        selectedQuestionGroup = questionGroups[indexPath.row]
        return indexPath
    }
    
    public func tableView(_ tableView: UITableView,
                          didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    public override func prepare(for segue: UIStoryboardSegue,
                                 sender: Any?) {
        // 1
        if let viewController =
            segue.destination as? QuestionViewController {
            viewController.questionStrategy = appSettings.questionStrategy(for: questionGroupCaretaker)
            viewController.delegate = self
        // 2
        } else if let navController =
            segue.destination as? UINavigationController,
            let viewController =
            navController.topViewController as?
            CreateQuestionGroupViewController {
            viewController.delegate = self
        }
        // 3
        // Whatevs... skip anything else
    }
}


class SelectQuestionGroupViewController: UIViewController {

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - Outlets
    @IBOutlet internal var tableView: UITableView! {
        didSet {
            tableView.tableFooterView = UIView()
        }
    }
    // MARK: - Properties
    private let appSettings = AppSettings.shared
    private let questionGroupCaretaker = QuestionGroupCaretaker()
    private var questionGroups: [QuestionGroup] {
        return questionGroupCaretaker.questionGroups
    }
    private var selectedQuestionGroup: QuestionGroup! {
        get { return questionGroupCaretaker.selectedQuestionGroup }
        set { questionGroupCaretaker.selectedQuestionGroup = newValue }
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        questionGroups.forEach {
            print("\($0.title): " +
                "correctCount \($0.score.correctCount), " +
                "incorrectCount \($0.score.incorrectCount)"
            )
        }
    }

}
