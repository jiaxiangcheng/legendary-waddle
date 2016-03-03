
import UIKit

class Polygon: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    
    var Array = ["Square", "Rectangle", "Triangle", "Circumference", "Rhombus", "Rhomboid", "Trapeze", "Pentagon (Regular)"]
    var Fila = 0
    
    var counter = 1
    var isanimated = false
    var timer = NSTimer()
    
    @IBOutlet var ScrollView: UIScrollView!
    @IBOutlet var Image: UIImageView!
    @IBOutlet var Open: UIBarButtonItem!
    @IBOutlet var Piker: UIPickerView!
    @IBOutlet var squarelength: UITextField!
    @IBOutlet var rectangleheight: UITextField!
    @IBOutlet var rectanglewidth: UITextField!
    @IBOutlet var triangleheight: UITextField!
    @IBOutlet var trianglewidth: UITextField!
    @IBOutlet var circumferenceradius: UITextField!
    @IBOutlet var rhombusdia1: UITextField!
    @IBOutlet var rhombusdia2: UITextField!
    @IBOutlet var rhomboidbase: UITextField!
    @IBOutlet var rhomboidheight: UITextField!
    @IBOutlet var trapezoidbase1: UITextField!
    @IBOutlet var trapezoidbase2: UITextField!
    @IBOutlet var trapezoidheight: UITextField!
    @IBOutlet var pentagonlength: UITextField!
    @IBOutlet var pentagonapothem: UITextField!
    
    //outlet dels reset
    @IBOutlet var pentagon: UIButton!
    @IBOutlet var square: UIButton!
    @IBOutlet var rectangle: UIButton!
    @IBOutlet var triangle: UIButton!
    @IBOutlet var rhombus: UIButton!
    @IBOutlet var rhomboid: UIButton!
    @IBOutlet var circumference: UIButton!
    @IBOutlet var trapezoid: UIButton!
    
    //outlet dels result
    @IBOutlet var square1: UIButton!
    @IBOutlet var rectangle1: UIButton!
    @IBOutlet var triangle1: UIButton!
    @IBOutlet var circumference1: UIButton!
    @IBOutlet var rhombus1: UIButton!
    @IBOutlet var rhomboid1: UIButton!
    @IBOutlet var trapezoid1: UIButton!
    @IBOutlet var pentagon1: UIButton!
    
    
    @IBOutlet var result7: UILabel!
    @IBOutlet var result6: UILabel!
    @IBOutlet var result5: UILabel!
    @IBOutlet var result4: UILabel!
    @IBOutlet var result3: UILabel!
    @IBOutlet var result2: UILabel!
    @IBOutlet var result1: UILabel!
    @IBOutlet var result0: UILabel!
    
    
    @IBOutlet var imatge: UIImageView!
    @IBOutlet var animationbutton: UIButton!
    @IBAction func animation(sender: AnyObject) {
        if (isanimated) == true {
            timer.invalidate()
            isanimated = false
            animationbutton.setTitle("Start", forState: .Normal)
        }
        else {
            isanimated = true
            animationbutton.setTitle("Stop", forState: .Normal)
            timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "animation", userInfo: nil, repeats: true)
        }
    }
    func animation() {
        if (counter == 7) {
            counter = 1
        }
        else {
            imatge.image = UIImage(named: "\(counter)")
            ++counter
        }
    }
    
    @IBAction func backtop1(sender: AnyObject) {
        ScrollView.setContentOffset(CGPointMake(0, 0), animated: true)
    }
    @IBAction func squareresult(sender: AnyObject) {
        result0.text = String(Int(squarelength.text!)! * Int(squarelength.text!)!)
        result0.textColor = UIColor.whiteColor()
        result0.textAlignment = NSTextAlignment.Center
    }
    @IBAction func squarereset(sender: AnyObject) {
        result0.text = ""
        squarelength.text = ""
    }
    @IBAction func rectangleresult(sender: AnyObject) {
        result1.text = String(Int(rectangleheight.text!)! * Int(rectanglewidth.text!)!)
        result1.textColor = UIColor.whiteColor()
        result1.textAlignment = NSTextAlignment.Center
    }
    @IBAction func rectanglereset(sender: AnyObject) {
        result1.text = ""
        rectanglewidth.text = ""
        rectangleheight.text = ""
    }
    @IBAction func triangleresult(sender: AnyObject) {
        result2.text = String((Int(triangleheight.text!)! * Int(trianglewidth.text!)!) / 2)
        result2.textColor = UIColor.whiteColor()
        result2.textAlignment = NSTextAlignment.Center
    }
    @IBAction func trianglereset(sender: AnyObject) {
        result2.text = ""
        trianglewidth.text = ""
        triangleheight.text = ""
    }
    @IBAction func circumferenceresult(sender: AnyObject) {
        result3.text = String(3.1415 * Double(circumferenceradius.text!)!)
        result3.textColor = UIColor.whiteColor()
        result3.textAlignment = NSTextAlignment.Center
    }
    
    @IBAction func circumferencereset(sender: AnyObject) {
        result3.text = ""
        circumferenceradius.text = ""
    }
    
    @IBAction func rhombusresult(sender: AnyObject) {
        result4.text = String((Int(rhombusdia1.text!)! * Int(rhombusdia2.text!)!) / 2)
        result4.textColor = UIColor.whiteColor()
        result4.textAlignment = NSTextAlignment.Center
    }
    
    @IBAction func rhombusreset(sender: AnyObject) {
        result4.text = ""
        rhombusdia2.text = ""
        rhombusdia1.text = ""
    }
    
    @IBAction func rhomboidresult(sender: AnyObject) {
        result5.text = String(Int(rhomboidbase.text!)! + Int(rhomboidheight.text!)!)
        result5.textColor = UIColor.whiteColor()
        result5.textAlignment = NSTextAlignment.Center
    }
    
    @IBAction func rhomboidreset(sender: AnyObject) {
        result5.text = ""
        rhomboidheight.text = ""
        rhomboidbase.text = ""
    }
    
    @IBAction func trapezoidresult(sender: AnyObject) {
        let aux = (Int(trapezoidbase1.text!)! * Int(trapezoidbase2.text!)!) / 2
        result6.text = String((Int(trapezoidheight.text!)!) * aux)
        result6.textColor = UIColor.whiteColor()
        result6.textAlignment = NSTextAlignment.Center
    }
    
    @IBAction func trapezoidreset(sender: AnyObject) {
        result6.text = ""
        trapezoidheight.text = ""
        trapezoidbase1.text = ""
        trapezoidbase2.text = ""
    }
    
    @IBAction func pentagonresult(sender: AnyObject) {
        result7.text = String((Int(pentagonlength.text!)! * Int(pentagonapothem.text!)!) / 2)
        result7.textColor = UIColor.whiteColor()
        result7.textAlignment = NSTextAlignment.Center
    }
    
    @IBAction func pentagonreset(sender: AnyObject) {
        result7.text = ""
        pentagonapothem.text = ""
        pentagonlength.text = ""
    }
    
    @IBAction func Acept(sender: AnyObject) {
        if (Fila == 0 || Fila == 1 || Fila == 2) {
            ScrollView.setContentOffset(CGPointMake(0, 730), animated: true)
        }
        if (Fila == 3 || Fila == 4 || Fila == 5) {
            ScrollView.setContentOffset(CGPointMake(0, 1385), animated: true)
        }
        if (Fila == 6 || Fila == 7) {
            ScrollView.setContentOffset(CGPointMake(0, 2015), animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ScrollView.contentSize.height = 6000
        
        Open.target = self.revealViewController()
        Open.action = Selector("revealToggle:")
        
        Piker.delegate = self
        Piker.dataSource = self
        
        imatge.image = UIImage(named: "1")
        Image.image = UIImage(named: "square")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //clicar el intro per amagar el teclat
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //quan volem editar el text el scroll view puja
    func textFieldDidBeginEditing(textField: UITextField) {
        if (textField == triangleheight || textField == trianglewidth) {
            ScrollView.setContentOffset(CGPointMake(0, 900), animated: true)
        }
        if (textField == rhomboidbase || textField == rhomboidheight) {
            ScrollView.setContentOffset(CGPointMake(0, 1585), animated: true)
        }
    }
    
    //quan acabem de editar el text el scrollview torna al seu lloc
    func textFieldDidEndEditing(textField: UITextField) {
        if (Fila == 0 || Fila == 1 || Fila == 2) {
            ScrollView.setContentOffset(CGPointMake(0, 730), animated: true)
        }
        if (Fila == 3 || Fila == 4 || Fila == 5) {
            ScrollView.setContentOffset(CGPointMake(0, 1385), animated: true)
        }
        if (Fila == 6 || Fila == 7) {
            ScrollView.setContentOffset(CGPointMake(0, 2015), animated: true)
        }
        
    }
    
    //Per posar noms a cada opcio del picker
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Array[row]
    }
    
    //retorna num de files
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Array.count
    }
    
    //return the number of section
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        Fila = row
        if (Fila == 0) {
            Image.image = UIImage(named: "square")
        }
        if (Fila == 1) {
            Image.image = UIImage(named: "rectangle")
        }
        if (Fila == 2) {
            Image.image = UIImage(named: "triangle")
        }
        if (Fila == 3) {
            Image.image = UIImage(named: "cercle")
        }
        if (Fila == 4) {
            Image.image = UIImage(named: "rombe")
        }
        if (Fila == 5) {
            Image.image = UIImage(named: "romboide")
        }
        if (Fila == 6) {
            Image.image = UIImage(named: "trapezi")
        }
        if (Fila == 7) {
            Image.image = UIImage(named: "pentagon")
        }
    }
}
