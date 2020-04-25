//
//  ViewController.swift
//  CoolCalc
//
//  Created by Kelly O'Brien on 4/19/20.
//  Copyright © 2020 Kismet Development. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isDoneTyping = true
    private var calculator = Logic()
    
    private var displayNumber: Double {
        get {
            guard let number = Double(displayLabel.text!) else { return 00 }
            return number
        } set {
            if newValue == floor(newValue) {
                displayLabel.text = String(format: "%.0f", newValue)
            } else {
                displayLabel.text = newValue.computeDecimal()
            }
        }
    }
                
    @IBAction func numberButtonPressed(_ sender: UIButton) {
        
        if let number = sender.currentTitle {

            if isDoneTyping {
                displayLabel.text = number
                isDoneTyping = false
            } else {
                if number == "." {
                    if displayLabel.text!.contains(".") {
                        return
                    }
                }
                displayLabel.text! += number
            }
        }
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        
        isDoneTyping = true
        
        if let sign = sender.currentTitle {
            calculator.setNumber(displayNumber)

            if let result = calculator.calculate(sign: sign) {
                displayNumber = result
            }
        }
    }
}

extension Double {
    func computeDecimal() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        numberFormatter.maximumFractionDigits = 8
        return numberFormatter.string(from: NSNumber(value: self)) ?? ""
    }
}
