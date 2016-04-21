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
    var keepTrackKeys = []
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

    
    @IBAction func clear () {
        showValue = 0
        display.text = "\(showValue)"
    }
    
    @IBAction func operate (sender: UIButton) {
        let operation = sender.currentTitle!
        
        switch operation {
            case "+": display.text ("\(num1 + num2) ")
            case "-": display.text ("\(num1 - num2) ")
            case "*": display.text ("\(num1 * num2) ")
            case "/": display.text ("\(num1 / num2) ")
            case "%": display.text ("\(num1 % num2) ")
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

