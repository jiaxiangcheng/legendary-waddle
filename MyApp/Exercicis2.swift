
import UIKit


var ExCorrectesMaxSuma = 0
var ExIncorrectesMaxSuma = 0
var TimeusedMaxSuma = 0
var NivellMaxSuma = 0
var accMaxSuma:Double = 0
var ExperminuteMaxSuma:Double = 0

var ExCorrectesMaxResta = 0
var ExIncorrectesMaxResta = 0
var TimeusedMaxResta = 0
var NivellMaxResta = 0
var accMaxResta:Double = 0
var ExperminuteMaxResta:Double = 0

class Exercicis2: UIViewController {
    
    @IBOutlet weak var operation: UILabel!
    @IBOutlet weak var firstnum: UILabel!
    @IBOutlet weak var secondnum: UILabel!
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var time: UISlider!
    @IBOutlet weak var coment: UILabel!
    @IBOutlet var doneoutlet: UIButton!
    @IBOutlet var showtime: UILabel!
    
    var tempsmax = 15
    
    var random1 = arc4random_uniform(100)
    var random2 = arc4random_uniform(100)
    
    //per comprobar l'usuari ha escrit algu o no
    var escrit = false
    
    var tipudeop = String()
    
    //timer
    var tempsrestant = -1
    var timer = NSTimer()
    
    //introduir introduir
    var num = String()
    var aux = ""
    var istyping = true
    
    @IBAction func operation(sender: AnyObject) {
        let number = sender.currentTitle
        result.text = result.text! + number!!
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
        let resultat = Int(firstnum.text!)! + Int(secondnum.text!)!
        let resultat2 = Int(firstnum.text!)! - Int(secondnum.text!)!
        if (operation.text == "+") {
            if (Int(result.text!)! == resultat) {
                self.seguentex()
                ++numexdone
                ++ExcorrectesSumaCopia
                if (numexdone == 8) {
                    nivell = 2
                    tempsmax = 12
                }
                if (numexdone == 15){
                    nivell = 3
                    tempsmax = 10
                }
                if (numexdone == 25) {
                    nivell = 4
                    tempsmax = 8
                }
                if (numexdone == 30) {
                    nivell = 5
                    tempsmax = 7
                }
            }
            else {
                coment.text = "Wrong Answer! Try again"
                coment.textColor = UIColor.redColor()
                coment.textAlignment = NSTextAlignment.Center
                result.text = ""
                ++ExincorrectesSuma
            }
        }
        else {
            if (Int(result.text!)! == resultat2) {
                self.seguentex()
                ++numexdone
                ++ExcorrectesRestaCopia
                if (numexdone == 8) {
                    nivell = 2
                    tempsmax = 12
                }
                if (numexdone == 15) {
                    nivell = 3
                    tempsmax = 10
                }
                if (numexdone == 20) {
                    nivell = 4
                    tempsmax = 8
                }
                if (numexdone == 30) {
                    nivell = 5
                    tempsmax = 7
                }
            }
            else {
                coment.text = "Wrong Answer! Try again"
                coment.textColor = UIColor.redColor()
                coment.textAlignment = NSTextAlignment.Center
                result.text = ""
                ++ExincorrectesResta
            }
        }
        doneoutlet.enabled = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "temps", userInfo: nil, repeats: true)
        if (tipudeop == "Suma") {
            operation.text = "+"
        }
        if (tipudeop == "Resta") {
            operation.text = "-"
        }
        
        doneoutlet.enabled = false
        firstnum.text = String(random1)
        secondnum.text = String(random2)
        
        if (operation.text == "-") {
            if (Int(secondnum.text!)! >= Int(firstnum.text!)!) {
                swap(&firstnum.text, &secondnum.text)
            }
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func temps() {
        ++timetotalused
        ++tempsrestant
        if (nivell == 1) {
            if (tempsrestant == 15) {
                finestraalert()
                timer.invalidate()
            }
            time.enabled = false
            time.value = Float(tempsrestant)
        }
        if (nivell == 2) {
            time.maximumValue = 12
            if (tempsrestant == 12) {
                finestraalert()
                timer.invalidate()
            }
            time.enabled = false
            time.value = Float(tempsrestant)
        }
        if (nivell == 3) {
            time.maximumValue = 10
            if (tempsrestant == 10) {
                finestraalert()
                timer.invalidate()
            }
            time.enabled = false
            time.value = Float(tempsrestant)
        }
        if (nivell == 4) {
            time.maximumValue = 8
            if (tempsrestant == 8) {
                finestraalert()
                timer.invalidate()
            }
            time.enabled = false
            time.value = Float(tempsrestant)
        }
        if (nivell == 5) {
            time.maximumValue = 7
            if (tempsrestant == 7) {
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
        let alert = UIAlertController(title: "Well done!", message:"Check your result in the previous screen." , preferredStyle: .Alert)
        let action = UIAlertAction(title: "Acept", style: .Default) { _ in
            //accio que fas despres de clicar el OK
            
        }
        alert.addAction(action)
        self.presentViewController(alert, animated: true){}
    }
    
    func seguentex(){
        random1 = arc4random_uniform(100)
        random2 = arc4random_uniform(100)
        firstnum.text = String(random1)
        secondnum.text = String(random2)
        result.text = ""
        
        //reset del temps
        tempsrestant = -1
        coment.text = ""
        if (operation.text == "-") {
            if (Int(secondnum.text!)! >= Int(firstnum.text!)!) {
                var temp = String()
                temp = secondnum.text!
                secondnum.text = firstnum.text
                firstnum.text = temp
            }
        }
    }
}