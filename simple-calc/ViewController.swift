//
//  ViewController.swift
//  simple-calc
//
//  Created by iGuest on 4/21/16.
//  Copyright © 2016 Brittney Hoy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display : UILabel!
    
    var isNumberPressed = false
    var keepTrackKeys = [Double]()
    var num1 = 0.0
    var num2 = 0.0
    
    var showValue : Double {
        get {
            return NSNumberFormatter ().numberFromString(display.text!)!.doubleValue
        } set {
            display.text = "\(newValue)"
            isNumberPressed = false
        }
    }
    
    @IBAction func numberPressed (sender: UIButton) {
        let digit = sender.currentTitle!
        
        if isNumberPressed {
            display.text = display.text! + digit
        } else {
            display.text = digit
            isNumberPressed = true
        }
        
    }

    @IBAction func enter() {
        isNumberPressed = false
        keepTrackKeys.append(showValue)
    }
    
    
    @IBAction func clear () {
        showValue = 0
        display.text = "\(Int(showValue))"
    }
    
    @IBAction func operate (sender: UIButton) {
        let operation = sender.currentTitle!
        num1 = showValue

        if isNumberPressed {
            enter()
        }

        switch operation {
            case "+": display.text = "\(num1 + showValue)"
            case "-": display.text = "\(num1 - showValue)"
            case "x": display.text = "\(num1 * showValue)"
            case "/": display.text = "\(num1 / showValue)"
            case "%": display.text = "\(num1 % showValue)"
        default: break
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

