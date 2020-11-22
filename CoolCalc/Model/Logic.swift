//
//  Logic.swift
//  CoolCalc
//
//  Created by Kelly O'Brien on 4/20/20.
//  Copyright © 2020 Kismet Development. All rights reserved.
//

import Foundation

struct Logic {
   
    var number: Double?
    var intermediateCalculation: (firstNumber: Double, operation: String)?
    
    
    mutating func setNumber(_ number:Double) {
        self.number = number
    }
    
    mutating func calculate(sign: String) -> Double? {
        
        if let num = number {
            
            switch sign {
            case "C":
                return 0
            case "+/-":
                return num * -1
            case "%":
                return num * 0.01
            case "=":
            return performCalculation(secondNumber: num)
            default:
                intermediateCalculation = (firstNumber: num, operation: sign)
            }
        }
        return nil
    }
   
    func performCalculation(secondNumber: Double) -> Double? {
        
        if let firstNumber = intermediateCalculation?.firstNumber,
            let operation = intermediateCalculation?.operation {
            switch operation {
            case "+":
                return firstNumber + secondNumber
            case "-":
                return firstNumber - secondNumber
            case "x":
                return firstNumber * secondNumber
            case "/":
                return firstNumber / secondNumber
            default:
                return nil
            }
        }
        return nil
    }   
}
