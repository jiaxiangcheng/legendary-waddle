//
//  ViewController.swift
//  slider menu
//
//  Created by Jia XiangCheng on 4/2/16.
//  Copyright © 2016 Jia XiangCheng. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    
    
    @IBOutlet var Open: UIBarButtonItem!
    var varView = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        Open.target = self.revealViewController()
        Open.action = Selector("revealToggle:")
        
        self.revealViewController().rearViewRevealWidth = 180
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

