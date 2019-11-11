//
//  ViewController.swift
//  Calculator
//
//  Created by MacStudent on 2019-10-30.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numberOnScreen:Double = 0;
    var previousNumber:Double = 0;
    var performingMath = false
    var operation = 0
    
    var result = 0.0
    
    @IBOutlet weak var label: UILabel!
    @IBAction func numbers(_ sender: UIButton)
        
    {
        
        if performingMath == true
        {
            label.text = ""
            if sender.tag == 18 //decimal
            {
                label.text = label.text! + String(".")
            }
            else{
                label.text = String(sender.tag-1)
            }
            numberOnScreen = Double(label.text!) ?? 0.0
            performingMath = false
        }
        else {
            if sender.tag == 18 //decimal
            {
                // print only one deciaml
                if (label.text?.contains("."))!{
                    return
                }
                
                
                label.text = label.text! + String(".")
            }
            else {
                label.text = label.text! + String(sender.tag-1)
            }
            numberOnScreen = Double(label.text!) ?? 0.0
       
       
        }
       
        
    }
    
    @IBAction func buttons(_ sender: UIButton)
    {
        
        if label.text != "" && sender.tag != 11 && sender.tag != 16
        {
            previousNumber = Double(label.text!)!
            
            if sender.tag == 12  // Divide
            {
                label.text = "/";
            }
            else if sender.tag == 13  // multiply
            {
                label.text = "*";
            }
            else if sender.tag == 14  // subtract
            {
                label.text = "-";
            }
            else if sender.tag == 15  // addition
            {
                label.text = "+";
            }
           else if sender.tag == 17 // percentage
            {
                label.text = String(previousNumber/100)
            }
            else if sender.tag == 18  // period
            {
                label.text = ".";
            }
            
                
                   
            operation = sender.tag
            performingMath = true;
        }
            
        else if sender.tag == 16
        {
            if operation == 12
            {
                label.text = String(format: "%.3f", previousNumber / numberOnScreen)
                result = Double(label.text!) ?? 0.0
                roundDoubleInt()
            }
           else if operation == 13
            {
                label.text = String(format: "%.3f", previousNumber * numberOnScreen)
                 result = Double(label.text!) ?? 0.0
                roundDoubleInt()
            }
            else if operation == 14
            {
                label.text = String(format: "%.3f", previousNumber - numberOnScreen)
                 result = Double(label.text!) ?? 0.0
                roundDoubleInt()
            }
           else if operation == 15
            {
                label.text = String(format: "%.3f",previousNumber + numberOnScreen)
                 result = Double(label.text!) ?? 0.0
                roundDoubleInt()
            }
            else if operation == 17
            {
                label.text = String(format: "%.3f", previousNumber / 100)
                 result = Double(label.text!) ?? 0.0
                roundDoubleInt()
            }
            
    
    
        }
        else if sender.tag == 11
        {
            label.text = ""
            previousNumber = 0;
            numberOnScreen = 0;
            operation = 0;        }
        
    }
    func roundDoubleInt()  {

        print(result)
        
        if result.rounded(.up) == result.rounded(.down){
            
            let result = Int(self.result)
            label.text = String(result)
            self.result = Double(result)
        }else{
            label.text = String(result)
        }
        
        
        
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    
}

