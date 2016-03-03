//
//  Table.swift
//  MyApp
//
//  Created by Jia XiangCheng on 4/2/16.
//  Copyright © 2016 Jia XiangCheng. All rights reserved.
//

import UIKit

class Table: UIViewController {
    
    var taula = Int()
    @IBOutlet weak var tablecalculs: UITableView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet var Open: UIBarButtonItem!
    
    @IBAction func indexChange(sender: AnyObject) {
        
        tablecalculs.reloadData()
        switch segmentedControl.selectedSegmentIndex
        {
        case 0: taula = 1
        case 1: taula = 2
        case 2: taula = 3
        case 3: taula = 4
        case 4: taula = 5
        case 5: taula = 6
        case 6: taula = 7
        case 7: taula = 8
        case 8: taula = 9
        case 9: taula = 10
        default:
            break;
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Open.target = self.revealViewController()
        Open.action = Selector("revealToggle:")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
        
        cell.textLabel?.text = "\(taula) x \(indexPath.row + 1) = \(taula * (indexPath.row + 1))"
        
        return cell
        
    }
    
    //NUMEROS DE CELES
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
}
