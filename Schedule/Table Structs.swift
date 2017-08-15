//
//  Table Structs.swift
//  Schedule
//
//  Created by Samar Sunkaria on 8/14/17.
//  Copyright © 2017 Samar Sunkaria. All rights reserved.
//

import Foundation

struct Table {
    var groups: [String : Schedule]
    
    static func parseTimeTableJSON(from JSON: String) -> Table? {
        let table = try? JSONSerialization.jsonObject(with: JSON.data(using: .utf8)!, options: []) as? [String : Any]
        if let table = table??["tables"] as? [String : Any] {
            for (_, value) in table {
                var timeTable = Table(groups: [String : Schedule]())
                if let groups = ((value as? [String: Any])?.first)?.value as? [String: Any] {
                    for (group, value) in groups {
                        var schedule = Schedule(day: [String : [Course]]())
                        if let days = value as? [String : Any] {
                            for (day, value) in days {
                                var courseArray = [Course]()
                                if let courses = value as? [[String :String]] {
                                    for course in courses {
                                        let courseObj = Course(
                                            courseCode: course["courseCode"],
                                            type: course["type"],
                                            courseTitle: course["courseTitle"],
                                            startTime: course["startTime"],
                                            endTime: course["endTime"],
                                            location: course["location"],
                                            instructor: course["instructor"]
                                        )
                                        
                                        courseArray.append(courseObj)
                                    }
                                }
                                schedule.day[day] = courseArray
                            }
                        }
                        timeTable.groups[group] = schedule
                    }
                }
                return timeTable
            }
            
        }
        return nil
    }
}

struct Schedule {
    var day: [String : [Course]]
}

struct Course {
    var courseCode: String?
    var type: String?
    var courseTitle: String?
    var startTime: String?
    var endTime: String?
    var location: String?
    var instructor: String?
}
