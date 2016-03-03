//
//  Calculadora.swift
//  MyApp
//
//  Created by Jia XiangCheng on 3/2/16.
//  Copyright © 2016 Jia XiangCheng. All rights reserved.
//

import UIKit

class Calculadora: UIViewController {
    
    var suma = false
    var resta = false
    var mult = false
    var div = false
    
    var primernum = 0
    var segonnum = 0
    
    @IBOutlet var Open: UIBarButtonItem!
    
    @IBOutlet weak var Pantalla: UILabel!
    
    @IBAction func Nine(sender: AnyObject) {
        let num = segonnum * 10 + 9
        Pantalla.text = String(num)
        segonnum = num
    }
    @IBAction func Eight(sender: AnyObject) {
        let num = segonnum * 10 + 8
        Pantalla.text = String(num)
        segonnum = num
    }
    @IBAction func Seven(sender: AnyObject) {
        let num = segonnum * 10 + 7
        Pantalla.text = String(num)
        segonnum = num
    }
    @IBAction func Six(sender: AnyObject) {
        let num = segonnum * 10 + 6
        Pantalla.text = String(num)
        segonnum = num
    }
    @IBAction func Five(sender: AnyObject) {
        let num = segonnum * 10 + 5
        Pantalla.text = String(num)
        segonnum = num
    }
    @IBAction func Four(sender: AnyObject) {
        let num = segonnum * 10 + 4
        Pantalla.text = String(num)
        segonnum = num
    }
    @IBAction func Three(sender: AnyObject) {
        let num = segonnum * 10 + 3
        Pantalla.text = String(num)
        segonnum = num
    }
    @IBAction func Two(sender: AnyObject) {
        let num = segonnum * 10 + 2
        Pantalla.text = String(num)
        segonnum = num
    }
    @IBAction func One(sender: AnyObject) {
        let num = segonnum * 10 + 1
        Pantalla.text = String(num)
        segonnum = num
    }
    @IBAction func Zero(sender: AnyObject) {
        let num = segonnum * 10 + 0
        Pantalla.text = String(num)
        segonnum = num
    }
    @IBAction func Reset(sender: AnyObject) {
        primernum = 0
        segonnum = 0
        Pantalla.text = String(primernum)
    }
    @IBAction func Divisio(sender: AnyObject) {
        div = true
        primernum = segonnum
        segonnum = 0
    }
    @IBAction func Suma(sender: AnyObject) {
        suma = true
        primernum = segonnum
        segonnum = 0
    }
    @IBAction func Multiplicacio(sender: AnyObject) {
        mult = true
        primernum = segonnum
        segonnum = 0
    }
    @IBAction func Resta(sender: AnyObject) {
        resta = true
        primernum = segonnum
        segonnum = 0
    }
    @IBAction func Result(sender: AnyObject) {
        if (suma == true) {
            let total = primernum + segonnum
            Pantalla.text = String(total)
            suma = false
        }
        if (resta == true) {
            let total = primernum - segonnum
            Pantalla.text = String(total)
            resta = false
        }
        if (mult == true) {
            let total = primernum * segonnum
            Pantalla.text = String(total)
            mult = false
        }
        if (div == true) {
            let total = primernum / segonnum
            Pantalla.text = String(total)
            div = false
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Open.target = self.revealViewController()
        Open.action = Selector("revealToggle:")
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
