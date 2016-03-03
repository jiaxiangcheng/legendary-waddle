//
//  Second.swift
//  slider menu
//
//  Created by Jia XiangCheng on 4/2/16.
//  Copyright © 2016 Jia XiangCheng. All rights reserved.
//

import Foundation

class CalculatorGesture: UIViewController {
    override func viewDidLoad() {
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }
}