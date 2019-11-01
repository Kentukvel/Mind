//
//  TimeTableViewController.swift
//  Mind
//
//  Created by Левкутник Дмитрий on 10/31/19.
//  Copyright © 2019 Левкутник Дмитрий. All rights reserved.
//

import UIKit

class TimeTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    
    var timeTableViewModel = TimeTableViewModel()
    var arrayOfTimeTable = [TimeTablePoint]()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentedControlTimeToDoOutlet: UISegmentedControl!
    
    
    @IBAction func addButton(_ sender: UIButton) {
        if segmentedControlTimeToDoOutlet.selectedSegmentIndex == 0 {
            performSegue(withIdentifier: "addTaskToTimeTableSegue", sender: nil)
        } else {
            
        }
    }
    
    @IBAction func segmentedControlTimeToDo(_ sender: UISegmentedControl) {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        segmentedControlTimeToDoOutlet.selectedSegmentIndex = 0
        
        timeTableViewModel.fetchTimeTable()
        arrayOfTimeTable = timeTableViewModel.getUpcomingRecods
        
        tableView.reloadData()
    }
    

   
    //MARK: - TableView DataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfTimeTable.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellTest", for: indexPath)
        cell.textLabel?.text = arrayOfTimeTable[indexPath.row].name
        
        return cell
    }
    
    //MARK: - TableView Delegate Methods
    
    

   
}
