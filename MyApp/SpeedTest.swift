//
//  SpeedTest.swift
//  MyApp
//
//  Created by Jia XiangCheng on 08/02/16.
//  Copyright © 2016 Jia XiangCheng. All rights reserved.
//

import UIKit

class SpeedTest: UIViewController {
    
    var randomop = arc4random_uniform(3) + 1
    var life = 100
    var tipusdeop = ["+", "-", "x", "÷"]
    
    var first = arc4random_uniform(10) + 1
    var second = arc4random_uniform(10) + 1
    var timer = NSTimer()
    var resultat = 0
    var string1 = ""
    var string2 = ""
    var string3 = ""
    var string4 = ""
    
    @IBOutlet var Resposta1: UIButton!
    @IBOutlet var Resposta2: UIButton!
    @IBOutlet var Resposta3: UIButton!
    @IBOutlet var Resposta4: UIButton!
    
    @IBOutlet var currentlife: UISlider!
    @IBOutlet var firstnum: UILabel!
    @IBOutlet var operation: UILabel!
    @IBOutlet var secondnum: UILabel!
    
    @IBAction func answer1(sender: AnyObject) {
        if (Int(string1) == resultat) {
            first = arc4random_uniform(10) + 1
            second = arc4random_uniform(10) + 1
            operation.text = tipusdeop[1]
            nextex()
        }
    }
    
    @IBAction func answer2(sender: AnyObject) {
        if (Int(string2) == resultat) {
            first = arc4random_uniform(10) + 1
            second = arc4random_uniform(10) + 1
            operation.text = tipusdeop[1]
            nextex()
        }
    }
    
    @IBAction func answer3(sender: AnyObject) {
        if (Int(string3) == resultat) {
            operation.text = tipusdeop[1]
            nextex()
        }
    }
    
    @IBAction func answer4(sender: AnyObject) {
        if (Int(string4) == resultat) {
            operation.text = tipusdeop[1]
            nextex()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "temps", userInfo: nil, repeats: true)
        operation.text = tipusdeop[1]
        nextex()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func nextex() {
        if (operation.text == "+") {
            firstnum.text = String(first)
            secondnum.text = String(second)
            
            resultat = Int(firstnum.text!)! + Int(secondnum.text!)!
            print(resultat)
            string1 = String(resultat + 1)
            string2 = String(resultat + 2)
            string3 = String(resultat + 3)
            string4 = String(resultat)
            Resposta1.setTitle(string1, forState: .Normal)
            Resposta2.setTitle(string2, forState: .Normal)
            Resposta3.setTitle(string3, forState: .Normal)
            Resposta4.setTitle(string4, forState: .Normal)
            
        }
        
        if (operation.text == "-") {
            if (second > first) {
                swap(&first, &second)
            }
            firstnum.text = String(first)
            secondnum.text = String(second)
            resultat = Int(firstnum.text!)! - Int(secondnum.text!)!
            
            string1 = String(resultat + 1)
            string2 = String(resultat + 2)
            string3 = String(resultat + 3)
            string4 = String(resultat)
            Resposta1.setTitle(string1, forState: .Normal)
            Resposta2.setTitle(string2, forState: .Normal)
            Resposta3.setTitle(string3, forState: .Normal)
            Resposta4.setTitle(string4, forState: .Normal)
            
            
        }
        /*
        if (operation.text == "x") {
        first = arc4random_uniform(10) + 1
        second = arc4random_uniform(10) + 1
        firstnum.text = String(first)
        secondnum.text = String(second)
        resultat = Int(first * second)
        
        string1 = String(resultat + 1)
        string2 = String(resultat + 2)
        string3 = String(resultat + 3)
        string4 = String(resultat)
        Resposta1.setTitle(string1, forState: .Normal)
        Resposta2.setTitle(string2, forState: .Normal)
        Resposta3.setTitle(string3, forState: .Normal)
        Resposta4.setTitle(string4, forState: .Normal)
        
        }
        
        else {
        first = arc4random_uniform(10) + 1
        second = arc4random_uniform(10) + 1
        firstnum.text = String(first)
        secondnum.text = String(second)
        resultat = Int(first / second)
        
        string1 = String(resultat + 1)
        string2 = String(resultat + 2)
        string3 = String(resultat + 3)
        string4 = String(resultat)
        Resposta1.setTitle(string1, forState: .Normal)
        Resposta2.setTitle(string2, forState: .Normal)
        Resposta3.setTitle(string3, forState: .Normal)
        Resposta4.setTitle(string4, forState: .Normal)
        
        }*/
    }
    
    func temps() {
        life = life - 2
        if (life == 0) {
            let alert = UIAlertController(title: "Game Over!", message:"Practice more to improve", preferredStyle: .Alert)
            let action = UIAlertAction(title: "Acept", style: .Default) { _ in
                //accio que fas despres de clicar el OK
            }
            alert.addAction(action)
            self.presentViewController(alert, animated: true){}
        }
        currentlife.value = Float(life)
    }
}