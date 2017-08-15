//
//  ViewController.swift
//  Schedule
//
//  Created by Samar Sunkaria on 8/14/17.
//  Copyright © 2017 Samar Sunkaria. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let tableFilePath = Bundle.main.url(forResource: "timeTable", withExtension: "json")
    lazy var timeTableJSON: String = {
        [unowned self] in
        
        var JSON: String?
        if let filePath = self.tableFilePath {
            JSON = try? String(contentsOf: self.tableFilePath ?? URL(fileURLWithPath: ""))
        }
        return JSON ?? ""
    }()
    
    var timeTable: Table?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //print(timeTableJSON)
        timeTable = Table.parseTimeTableJSON(from: timeTableJSON)
        print(timeTable!)
    }
    

}
