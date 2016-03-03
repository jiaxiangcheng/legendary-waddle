//
//  Sumateoria.swift
//  MyApp
//
//  Created by Jia XiangCheng on 16/2/3.
//  Copyright © 2016年 Jia XiangCheng. All rights reserved.
//

import UIKit

var ExcorrectesSuma = 0
var ExcorrectesSumaCopia = 0
var ExincorrectesSuma = 0
var TimeusedSuma = 0
var nivellSuma = 0
var accSuma = 0

var ExcorrectesResta = 0
var ExcorrectesRestaCopia = 0
var ExincorrectesResta = 0
var TimeusedResta = 0
var nivellResta = 0
var accResta = 0

var ExcorrectesMult = 0
var ExcorrectesMultCopia = 0
var ExincorrectesMult = 0
var TimeusedMult = 0
var nivellMult = 0
var accMult = 0

var ExcorrectesDiv = 0
var ExcorrectesDivCopia = 0
var ExincorrectesDiv = 0
var TimeusedDiv = 0
var nivellDiv = 0
var accDiv = 0

var numexdone = 0
var timetotalused = 0

var nivell = 1

class Teoria: UIViewController {
    
    var titol = String()
    var operacio = ""
    
    @IBOutlet var ExCorrectes: UILabel!
    @IBOutlet var ExIncorectes: UILabel!
    @IBOutlet var Level: UILabel!
    @IBOutlet var TimeUsed: UILabel!
    @IBOutlet var ExPerMinute: UILabel!
    @IBOutlet var Accuracy: UILabel!
    
    var Timer = NSTimer()
    
    @IBOutlet weak var navibar: UINavigationBar!
    @IBAction func ferexcicis(sender: AnyObject) {
        if (operacio == "Suma" || operacio == "Resta") {
            performSegueWithIdentifier("sumairesta", sender: nil)
        }
        if (operacio == "Multiplicacio" || operacio == "Divisio") {
            performSegueWithIdentifier("multidiv", sender: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = titol
    }
    
    override func viewWillAppear(animated: Bool) {
        //per assegurar que actualitzi nomes si fem una millora de ex encerts
            if (operacio == "Suma" && ExcorrectesSuma <= ExcorrectesSumaCopia) {
            ExCorrectes.text = String(ExCorrectesMaxSuma)
            ExIncorectes.text = String(ExIncorrectesMaxSuma)
            Accuracy.text = NSString(format: "%.2f", accMaxSuma) as String + " %"
            TimeUsed.text = String(TimeusedMaxSuma)
            Level.text = String(NivellMaxSuma)
            ExPerMinute.text = NSString(format: "%.2f", ExperminuteMaxSuma) as String + "/sec"
            }
        
            if (operacio == "Suma" && ExcorrectesSumaCopia > ExCorrectesMaxSuma) {
            ExcorrectesSuma = ExcorrectesSumaCopia
            ExCorrectesMaxSuma = ExcorrectesSumaCopia
            ExIncorrectesMaxSuma = ExincorrectesSuma
            let aux3 = ExcorrectesSuma
            if (ExcorrectesSumaCopia >= aux3) {
                ExCorrectes.text = String(ExcorrectesSuma)
                ExIncorectes.text = String(ExIncorrectesMaxSuma)
                nivellSuma = nivell
                NivellMaxSuma = nivell
                Level.text = String(nivellSuma)
                if (Double((ExcorrectesSumaCopia + ExincorrectesSuma)) > 0) {
                    let aux = (Double(ExcorrectesSumaCopia) / Double((ExcorrectesSumaCopia + ExincorrectesSuma))) * 100
                    accMaxSuma = aux
                    Accuracy.text = NSString(format: "%.2f", aux) as String + " %"
                }
                //per primer cop
                else {
                    Accuracy.text = "0 %"
                }
                if (timetotalused == 0) {
                    TimeUsed.text = "0''"
                }
                else {
                    TimeusedMaxSuma = timetotalused
                    TimeUsed.text = String(timetotalused - 1) + "''"
                }
                //per primer cop
                if (timetotalused == 0) {
                    ExPerMinute.text = "0/sec"
                }
                else {
                    let aux2 = Double(ExcorrectesSumaCopia) / (Double(timetotalused))
                    ExperminuteMaxSuma = aux2
                    ExPerMinute.text = NSString(format: "%.2f", aux2) as String + "/sec"
                }
                ExincorrectesSuma = 0
                timetotalused = 0
            }
        }
        if (operacio == "Resta" && ExcorrectesResta <= ExcorrectesRestaCopia) {
            ExCorrectes.text = String(ExCorrectesMaxResta)
            ExIncorectes.text = String(ExIncorrectesMaxResta)
            Accuracy.text = NSString(format: "%.2f", accMaxResta) as String + " %"
            TimeUsed.text = String(TimeusedMaxResta)
            Level.text = String(NivellMaxResta)
            ExPerMinute.text = NSString(format: "%.2f", ExperminuteMaxResta) as String + "/sec"
        }
        if (operacio == "Resta" && ExcorrectesRestaCopia > ExcorrectesResta) {
            ExcorrectesResta = ExcorrectesRestaCopia
            ExCorrectesMaxResta = ExcorrectesRestaCopia
            ExIncorrectesMaxResta = ExincorrectesResta
            let aux3 = ExcorrectesResta
            if (ExcorrectesRestaCopia >= aux3) {
                ExCorrectes.text = String(ExcorrectesResta)
                ExIncorectes.text = String(ExIncorrectesMaxResta)
                nivellResta = nivell
                NivellMaxResta = nivell
                Level.text = String(nivellResta)
                if (Double((ExcorrectesRestaCopia + ExincorrectesResta)) > 0) {
                    let aux = (Double(ExcorrectesRestaCopia) / Double((ExcorrectesRestaCopia + ExincorrectesResta))) * 100
                    accMaxResta = aux
                    Accuracy.text = NSString(format: "%.2f", aux) as String + " %"
                }
                else {
                    Accuracy.text = "0 %"
                }
                if (timetotalused == 0) {
                    TimeUsed.text = "0''"
                }
                else {
                    TimeusedMaxResta = timetotalused
                    TimeUsed.text = String(timetotalused - 1) + "''"
                }
                if (timetotalused == 0) {
                    ExPerMinute.text = "0/sec"
                }
                else {
                    let aux2 = Double(ExcorrectesRestaCopia) / (Double(timetotalused))
                    ExperminuteMaxResta = aux2
                    ExPerMinute.text = NSString(format: "%.2f", aux2) as String + "/sec"
                }
                ExincorrectesResta = 0
                timetotalused = 0
            }
        }
        if (operacio == "Multiplicacio" && ExcorrectesMult <= ExcorrectesMultCopia) {
            ExCorrectes.text = String(ExCorrectesMaxMult)
            ExIncorectes.text = String(ExIncorrectesMaxMult)
            Accuracy.text = NSString(format: "%.2f", accMaxMult) as String + " %"
            TimeUsed.text = String(TimeusedMaxMult)
            Level.text = String(NivellMaxMult)
            ExPerMinute.text = NSString(format: "%.2f", ExperminuteMaxMult) as String + "/sec"
        }
        if (operacio == "Multiplicacio" && ExcorrectesMultCopia > ExCorrectesMaxMult) {
            ExcorrectesMult = ExcorrectesMultCopia
            ExCorrectesMaxMult = ExcorrectesMult
            ExIncorrectesMaxMult = ExincorrectesMult
            let aux3 = ExcorrectesMult
            if (ExcorrectesMultCopia >= aux3) {
                ExCorrectes.text = String(ExcorrectesMult)
                ExIncorectes.text = String(ExIncorrectesMaxMult)
                nivellMult = nivell
                NivellMaxMult = nivell
                Level.text = String(nivellMult)
                if (Double((ExcorrectesMultCopia + ExincorrectesMult)) > 0) {
                    let aux = (Double(ExcorrectesMultCopia) / Double((ExcorrectesMultCopia + ExincorrectesMult))) * 100
                    accMaxMult = aux
                    Accuracy.text = NSString(format: "%.2f", aux) as String + " %"
                }
                else {
                    Accuracy.text = "0 %"
                }
                if (timetotalused == 0) {
                    
                    TimeUsed.text = "0''"
                }
                else {
                    TimeusedMaxMult = timetotalused
                    TimeUsed.text = String(timetotalused - 1) + "''"
                }
                if (timetotalused == 0) {
                    ExPerMinute.text = "0/sec"
                }
                else {
                    let aux2 = Double(ExcorrectesMultCopia) / (Double(timetotalused))
                    ExperminuteMaxMult = aux2
                    ExPerMinute.text = NSString(format: "%.2f", aux2) as String + "/sec"
                }
                ExincorrectesMult = 0
                timetotalused = 0
            }
        }
        if (operacio == "Divisio" && ExcorrectesDiv <= ExcorrectesDivCopia) {
            ExCorrectes.text = String(ExCorrectesMaxDiv)
            ExIncorectes.text = String(ExIncorrectesMaxDiv)
            Accuracy.text = NSString(format: "%.2f", accMaxDiv) as String + " %"
            TimeUsed.text = String(TimeusedMaxDiv)
            Level.text = String(NivellMaxDiv)
            ExPerMinute.text = NSString(format: "%.2f", ExperminuteMaxDiv) as String + "/sec"
        }
        if (operacio == "Divisio" && ExcorrectesDivCopia > ExCorrectesMaxDiv) {
            ExcorrectesDiv = ExcorrectesDivCopia
            ExCorrectesMaxDiv = ExcorrectesDivCopia
            ExIncorrectesMaxDiv = ExincorrectesDiv
            let aux3 = ExcorrectesDiv
            if (ExcorrectesDivCopia >= aux3) {
                ExCorrectes.text = String(ExcorrectesDiv)
                ExIncorectes.text = String(ExincorrectesDiv)
                nivellDiv = nivell
                NivellMaxDiv = nivell
                Level.text = String(nivellDiv)
                if (Double((ExcorrectesDivCopia + ExincorrectesDiv)) > 0) {
                    let aux = (Double(ExcorrectesDivCopia) / Double((ExcorrectesDivCopia + ExincorrectesDiv))) * 100
                    accMaxDiv = aux
                    Accuracy.text = NSString(format: "%.2f", aux) as String + " %"
                }
                else {
                    Accuracy.text = "0 %"
                }
                if (timetotalused == 0) {
                    TimeUsed.text = "0''"
                }
                else {
                    TimeusedMaxDiv = timetotalused
                    TimeUsed.text = String(timetotalused - 1) + "''"
                }
                if (timetotalused == 0) {
                    ExPerMinute.text = "0/sec"
                }
                else {
                    let aux2 = Double(ExcorrectesDivCopia) / (Double(timetotalused))
                    ExperminuteMaxDiv = aux2
                    ExPerMinute.text = NSString(format: "%.2f", aux2) as String + "/sec"
                }
                ExincorrectesDiv = 0
                timetotalused = 0
            }
        }
        //resetejar els ex enserts de la partida anterior
        ExcorrectesSumaCopia = 0
        ExcorrectesRestaCopia = 0
        ExcorrectesMultCopia = 0
        ExcorrectesDivCopia = 0
        ExcorrectesDiv = 0
        ExcorrectesMult = 0
        ExcorrectesSuma = 0
        ExcorrectesResta = 0
        nivell = 1
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //no sempre entrem a Exercicis2, quan cliquem a Mul o Div anem a Exercicis per tant no podem assegurar que sempre podem accedir a Exercicis2 per tant fem un if i un else en el cas de que no podem anar
        if let DestViewController: Exercicis2 = segue.destinationViewController as? Exercicis2 {
            if (self.title == "Sum") {
                DestViewController.tipudeop = "Suma"
            }
            if (self.title == "Subtraction") {
                DestViewController.tipudeop = "Resta"
            }
        } else if let DestViewController: Exercicis = segue.destinationViewController as? Exercicis {
            
            if (self.title == "Multiplication") {
                DestViewController.tipudeop2 = "Multiplicacio"
            }
            if (self.title == "Divition") {
                DestViewController.tipudeop2 = "Divisio"
            }
        }
    }
}