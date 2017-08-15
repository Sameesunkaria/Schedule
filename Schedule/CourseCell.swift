//
//  CourseCell.swift
//  Schedule
//
//  Created by Samar Sunkaria on 8/14/17.
//  Copyright © 2017 Samar Sunkaria. All rights reserved.
//

import UIKit

class CourseCell: UITableViewCell {
    
    @IBOutlet weak var courseCode: UILabel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var courseTitle: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var instructor: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
