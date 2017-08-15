//
//  ScheduleTableViewController.swift
//  Schedule
//
//  Created by Samar Sunkaria on 8/14/17.
//  Copyright © 2017 Samar Sunkaria. All rights reserved.
//

import UIKit

class ScheduleTableViewController: UITableViewController {

    let cellId = "Time Table Cell"
    
    let tableFilePath = Bundle.main.url(forResource: "timeTable", withExtension: "json")
    lazy var timeTableJSON: String = {
        [unowned self] in
        
        var JSON: String?
        if let filePath = self.tableFilePath {
            JSON = try? String(contentsOf: self.tableFilePath ?? URL(fileURLWithPath: ""))
        }
        return JSON ?? ""
        }()
    
    var table: Table?
    
    var dayTimeTable: [Course]? {
        get {
            return table?.groups["COE8"]?.day[navigationController?.tabBarItem.title ?? "Monday"]
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 60
        
        tableView.tableFooterView = UIView()
        tableView.allowsSelection = false
        
        tableView.register(UINib(nibName: "CourseCell", bundle: nil) , forCellReuseIdentifier: cellId)
        
        navigationController?.navigationBar.topItem?.title = navigationController?.tabBarItem.title
        
        table = Table.parseTimeTableJSON(from: timeTableJSON)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dayTimeTable?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? CourseCell {
            cell.courseCode.text = dayTimeTable?[indexPath.row].courseCode
            cell.courseTitle.text = dayTimeTable?[indexPath.row].courseTitle
            cell.type.text = dayTimeTable?[indexPath.row].type
            cell.location.text = dayTimeTable?[indexPath.row].location
            cell.instructor.text = dayTimeTable?[indexPath.row].instructor
            cell.time.text = "\(dayTimeTable?[indexPath.row].startTime ?? "") to \(dayTimeTable?[indexPath.row].endTime ?? "")"
            return cell
        }

        return UITableViewCell()
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
