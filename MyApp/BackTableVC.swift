//
//  BackTableVC.swift
//  slider menu
//
//  Created by Jia XiangCheng on 4/2/16.
//  Copyright © 2016 Jia XiangCheng. All rights reserved.
//

import Foundation

class BackTableVC: UITableViewController {
    
    var TableArray = [String]()
    
    override func viewDidLoad() {
        TableArray = ["Home", "Calculator", "Funtions", "Multiplication Table", "Polygon Area"]
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TableArray.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(TableArray[indexPath.row], forIndexPath: indexPath) as UITableViewCell
        
        cell.textLabel?.text = TableArray[indexPath.row]
        
        return cell
        
    }
    
}