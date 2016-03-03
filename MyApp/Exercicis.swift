//  Exercicis.swift
//  MyApp
//  Created by Jia XiangCheng on 16/2/3.
//  Copyright © 2016年 Jia XiangCheng. All rights reserved.

import UIKit

var ExCorrectesMaxMult = 0
var ExIncorrectesMaxMult = 0
var TimeusedMaxMult = 0
var NivellMaxMult = 0
var accMaxMult:Double = 0
var ExperminuteMaxMult:Double = 0

var ExCorrectesMaxDiv = 0
var ExIncorrectesMaxDiv = 0
var TimeusedMaxDiv = 0
var NivellMaxDiv = 0
var accMaxDiv:Double = 0
var ExperminuteMaxDiv:Double = 0

class Exercicis: UIViewController {
    
    @IBOutlet weak var times: UISlider!
    @IBOutlet weak var operation: UILabel!
    @IBOutlet weak var firstnum: UILabel!
    @IBOutlet weak var secondnum: UILabel!
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var coment: UILabel!
    @IBOutlet var doneoutlet: UIButton!
    @IBOutlet var showtime: UILabel!
    @IBOutlet var time: UISlider!
    
    var tempsmax = 12

    //per evitar el numero
    var random1 = arc4random_uniform(10) + 1
    var random2 = arc4random_uniform(10) + 1
    
    //per comprobar l'usuari ha escrit algu o no
    var escrit = false
    
    var tipudeop2 = String()
    
    //timer
    var tempsrestant = -1
    var timer = NSTimer()
    
    //introduir introduir
    var num = String()
    var aux = ""
    var istyping = true
    
    var primerintent = true
    
    
    @IBAction func operation(sender: AnyObject) {
        let number = sender.currentTitle
        result.text = String(result.text! + number!!)
        result.textAlignment = NSTextAlignment.Center
        aux = sender.currentTitle!!
        
        escrit = true
        
        if (result != "") {
            doneoutlet.enabled = true
        }
    }
    
    @IBAction func sup(sender: AnyObject) {
        result.text = ""
        doneoutlet.enabled = false
    }
    
    @IBAction func done(sender: AnyObject) {
        let resultat = Int(firstnum.text!)! * Int(secondnum.text!)!
        let resultat2 = Int(firstnum.text!)! / Int(secondnum.text!)!
        if (operation.text == "x") {
            if (Int(result.text!)! == resultat) {
                self.seguentex()
                ++numexdone
                ++ExcorrectesMultCopia
                if (numexdone == 8) {
                    nivell = 2
                    tempsmax = 9
                }
                if (numexdone == 18) {
                    nivell = 3
                    tempsmax = 7
                }
                if (numexdone == 25){
                    nivell = 4
                    tempsmax = 6
                }
                if (numexdone == 30) {
                    nivell = 5
                    tempsmax = 5
                }
            }
            else {
                coment.text = "Wrong Answer! Try again"
                coment.textColor = UIColor.redColor()
                coment.textAlignment = NSTextAlignment.Center
                result.text = ""
                ++ExincorrectesMult
            }
        }
        else {
            if (Int(result.text!)! == resultat2) {
                self.seguentex()
                ++numexdone
                ++ExcorrectesDivCopia
                if (numexdone == 8) {
                    nivell = 2
                    tempsmax = 9
                }
                if (numexdone == 18) {
                    nivell = 3
                    tempsmax = 7
                }
                if (numexdone == 25){
                    nivell = 4
                    tempsmax = 6
                }
                if (numexdone == 30) {
                    nivell = 5
                    tempsmax = 5
                }
            }
            else {
                coment.text = "Wrong Answer! Try again"
                coment.textColor = UIColor.redColor()
                coment.textAlignment = NSTextAlignment.Center
                result.text = ""
                ++ExincorrectesDiv
            }
        }
        doneoutlet.enabled = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "temps", userInfo: nil, repeats: true)
        
        if (tipudeop2 == "Multiplicacio") {
            operation.text = "x"
        }
        if (tipudeop2 == "Divisio") {
            operation.text = "÷"
        }
        
        firstnum.text = String(random1)
        secondnum.text = String(random2)
        
        if (operation.text == "÷") {
            random1 = arc4random_uniform(100) + 1
            random2 = arc4random_uniform(10) + 1
            firstnum.text = String(random1)
            secondnum.text = String(random2)
            if (Int(firstnum.text!)! % Int(secondnum.text!)! != 0) {
                let residu = Int(firstnum.text!)! % Int(secondnum.text!)!
                let newfirstnum = Int(firstnum.text!)! - residu
                firstnum.text = String(newfirstnum)
            }
        }
        
        doneoutlet.enabled = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func temps() {
        ++timetotalused
        ++tempsrestant
        if (nivell == 1) {
            if (tempsrestant == 12) {
                finestraalert()
                timer.invalidate()
            }
            times.enabled = false
            times.value = Float(tempsrestant)
        }
        if (nivell == 2) {
            time.maximumValue = 9
            if (tempsrestant == 9) {
                finestraalert()
                timer.invalidate()
            }
            time.enabled = false
            time.value = Float(tempsrestant)
        }
        if (nivell == 3) {
            time.maximumValue = 7
            if (tempsrestant == 7) {
                finestraalert()
                timer.invalidate()
            }
            time.enabled = false
            time.value = Float(tempsrestant)
        }
        if (nivell == 4) {
            time.maximumValue = 6
            if (tempsrestant == 6) {
                finestraalert()
                timer.invalidate()
            }
            time.enabled = false
            time.value = Float(tempsrestant)
        }
        if (nivell == 5) {
            time.maximumValue = 5
            if (tempsrestant == 5) {
                finestraalert()
                timer.invalidate()
            }
            time.enabled = false
            time.value = Float(tempsrestant)
        }
        
        showtime.text = String(tempsmax - tempsrestant)
        showtime.textAlignment = NSTextAlignment.Center
    }
    
    func finestraalert() {
        let alert = UIAlertController(title: "Well done!", message:"Check your result in the previous screen.", preferredStyle: .Alert)
        let action = UIAlertAction(title: "Acept", style: .Default) { _ in
        }
        alert.addAction(action)
        self.presentViewController(alert, animated: true){}
    }
    
    func seguentex(){
        if (operation.text == "x") {
            random1 = arc4random_uniform(10) + 1
            random2 = arc4random_uniform(10) + 1
            firstnum.text = String(random1)
            secondnum.text = String(random2)
            result.text = ""
            tempsrestant = -1
            coment.text = ""
        }
        else {
            if (operation.text == "÷") {
                random1 = arc4random_uniform(100) + 1
                random2 = arc4random_uniform(10) + 1
                firstnum.text = String(random1)
                secondnum.text = String(random2)
                if (Int(firstnum.text!)! % Int(secondnum.text!)! != 0) {
                    let residu = Int(firstnum.text!)! % Int(secondnum.text!)!
                    let newfirstnum = Int(firstnum.text!)! - residu
                    firstnum.text = String(newfirstnum)
                }
                result.text = ""
                tempsrestant = -1
                coment.text = ""
            }
        }
    }
}
