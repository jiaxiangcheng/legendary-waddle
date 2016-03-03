//
//  Funcions.swift
//  MyApp
//
//  Created by Jia XiangCheng on 17/02/16.
//  Copyright © 2016 Jia XiangCheng. All rights reserved.
//

import UIKit
import Foundation

class Funcions: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var runprima: UIButton!
    @IBOutlet var runmcm: UIButton!
    @IBOutlet var runmcd: UIButton!
    @IBOutlet var ScrollView: UIScrollView!
    @IBOutlet var Open: UIBarButtonItem!
    @IBOutlet var primareset: UIButton!
    @IBOutlet var primaresult: UILabel!
    @IBOutlet var prima: UITextField!
    @IBOutlet var mcmresult: UILabel!
    @IBOutlet var mcmsecondnum: UITextField!
    @IBOutlet var mcmfirstnum: UITextField!
    @IBOutlet var mcdfirstnum: UITextField!
    @IBOutlet var mcdsecondnum: UITextField!
    @IBOutlet var mcdresult: UILabel!
    
    @IBOutlet var mcdResult: UIButton!
    @IBOutlet var mcdReset: UIButton!
    @IBOutlet var mcmResult: UIButton!
    @IBOutlet var mcmReset: UIButton!
    @IBOutlet var primaResult: UIButton!
    @IBOutlet var primaReset: UIButton!
    
    
    @IBAction func runmcd(sender: AnyObject) {
        let copia1 = mcdfirstnum.text
        let copia2 = mcdsecondnum.text
        while (Int(mcdfirstnum.text!)! != 0 && Int(mcdsecondnum.text!)! != 0) {
            let aux = Int(mcdfirstnum.text!)! % Int(mcdsecondnum.text!)!
            mcdfirstnum.text = mcdsecondnum.text
            mcdsecondnum.text = String(aux)
        }
        mcdresult.text = String(Int(mcdfirstnum.text!)! + Int(mcdsecondnum.text!)!)
        mcdresult.textColor = UIColor.whiteColor()
        mcdresult.textAlignment = NSTextAlignment.Center
        mcdfirstnum.text = copia1
        mcdsecondnum.text = copia2
        mcdResult.enabled = false
    }
    
    @IBAction func mcdreset(sender: AnyObject) {
        mcdfirstnum.text = ""
        mcdsecondnum.text = ""
        mcdresult.text = ""
    }
    
    @IBAction func runmcm(sender: AnyObject) {
        let result = mcm(Int(mcmfirstnum.text!)!, b: Int(mcmsecondnum.text!)!)
        mcmresult.text = String(result)
        mcmresult.textColor = UIColor.whiteColor()
        mcmresult.textAlignment = NSTextAlignment.Center
        mcmResult.enabled = false
    }
    
    @IBAction func mcmreset(sender: AnyObject) {
        mcmfirstnum.text = ""
        mcmsecondnum.text = ""
        mcmresult.text = ""
    }
    
    @IBAction func runprima(sender: AnyObject) {
        if (esprimer(Double(prima.text!)!) == true) {
            primaresult.text = "YES"
        }
        else {
            primaresult.text = "NO"
        }
        primaresult.textColor = UIColor.whiteColor()
        primaresult.textAlignment = NSTextAlignment.Center
        primaResult.enabled = false
    }
    
    @IBAction func primareset(sender: AnyObject) {
        primaresult.text = ""
        prima.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Open.target = self.revealViewController()
        Open.action = Selector("revealToggle:")
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        mcdResult.enabled = false
        mcdReset.enabled = false
        mcmResult.enabled = false
        mcmReset.enabled = false
        primaResult.enabled = false
        primaReset.enabled = false
        
    }

    //clicar el intro per amagar el teclat
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    //quan volem editar el text el scroll view puja
    func textFieldDidBeginEditing(textField: UITextField) {
        if (textField == prima) {
            ScrollView.setContentOffset(CGPointMake(0, 250), animated: true)
        }
        primaResult.enabled = true
        primaReset.enabled = true
    }
    
    //quan acabem de editar el text el scrollview torna al seu lloc
    func textFieldDidEndEditing(textField: UITextField) {
        ScrollView.setContentOffset(CGPointMake(0, 0), animated: true)
        if (textField == mcdfirstnum || textField == mcdsecondnum) {
            mcdResult.enabled = true
            mcdReset.enabled = true
        }
        if (textField == mcmfirstnum || textField == mcmsecondnum) {
            mcmResult.enabled = true
            mcmReset.enabled = true
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func mcd (var a:Int, var b:Int) -> Int {
        while (b != 0) {
            let modul = a % b;
            a = b;
            b = modul;
        }
        return a;
    }
    
    func mcm ( a:Int,  b: Int) -> Int {
        if (a > b) {
            return (a / mcd(a, b: b)) * b
        }
        else {
            return (b / mcd(a, b: b)) * a
        }
    }
    
    func esprimer( n:Double) -> Bool {
        if ((n == 0) || (n == 1)) {
            return false
        }
        for (var i:Double = 2; i <= sqrt(n); ++i) {
            if (n % i == 0) {
                return false
            }
        }
        return true
    }
}





