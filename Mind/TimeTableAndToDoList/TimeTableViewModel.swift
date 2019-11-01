//
//  TimeTableViewModel.swift
//  Mind
//
//  Created by Левкутник Дмитрий on 10/31/19.
//  Copyright © 2019 Левкутник Дмитрий. All rights reserved.
//

import Foundation
import CoreData

class TimeTableViewModel {
    
    //MARK: - Variables and Constants
    private var timeTableArray: [TimeTablePoint] = []
    private let context = AppDelegate.context
    
    var getUpcomingRecods: [TimeTablePoint] {
        get {
            return timeTableArray.filter({$0.timeOfEnd! < Date()}).sorted(by: { $0.timeOfStart! < $1.timeOfStart!
            })
        }
    }
    
    
    //MARK: - Methods
    func fetchTimeTable() {
        
        let fetchRequest: NSFetchRequest<TimeTablePoint> = TimeTablePoint.fetchRequest()
        do {
            timeTableArray = try context.fetch(fetchRequest)
        } catch {
            print("Can't fetch time table. Error: \(error)")
        }
        
    }
    
    func saveTimeTableRecord(name: String, notification: Bool, timeOfStart: Date, timeOfEnd: Date) {
        let timeRecord = NSEntityDescription.entity(forEntityName: "TimeTablePoint", in: context)!
        
        let timeTablePoint = NSManagedObject(entity: timeRecord, insertInto: context)
        timeTablePoint.setValue(name, forKey: "name")
        timeTablePoint.setValue(notification, forKey: "notification")
        timeTablePoint.setValue(timeOfStart, forKey: "timeOfStart")
        timeTablePoint.setValue(timeOfEnd, forKey: "timeOfEnd")
        
        do {
            try context.save()
        } catch {
            print("Can't save time table record record. Error: \(error)")
        }
    }
    
    
}
