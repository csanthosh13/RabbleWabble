//
//  AppSettingsViewController.swift
//  RabbleWabble
//
//  Created by Santosh Chandrasekharan on 30/08/19.
//  Copyright © 2019 Santosh Chandrasekharan. All rights reserved.
//

import UIKit

class AppSettingsViewController: UITableViewController {
    // 2
    // MARK: - Properties
    public let appSettings = AppSettings.shared
    private let cellIdentifier = "basicCell"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        // 3
        tableView.tableFooterView = UIView()
        // 4
        tableView.register(UITableViewCell.self,
                           forCellReuseIdentifier: cellIdentifier)
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        // 1
        return QuestionStrategyType.allCases.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: cellIdentifier, for: indexPath)
        // 2
        let questionStrategyType =
            QuestionStrategyType.allCases[indexPath.row]
        // 3
        cell.textLabel?.text = questionStrategyType.title()
        // 4
        if appSettings.questionStrategyType ==
            questionStrategyType {
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
            }
        return cell
     }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
// MARK: - UITableViewDelegate
extension AppSettingsViewController {
    public override func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath) {
        let questionStrategyType =
            QuestionStrategyType.allCases[indexPath.row]
        appSettings.questionStrategyType = questionStrategyType
        tableView.reloadData()
    }
}
