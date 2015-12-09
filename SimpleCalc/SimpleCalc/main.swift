//
//  main.swift
//  SimpleCalc
//
//  Created by Shawn Namdar on 12/8/15.
//  Copyright © 2015 Shawn Namdar. All rights reserved.
//

import Foundation



func isFunction(possibleFunction : String) -> Bool {
    for var index = 0; index < functionArray.count; ++index {
        if possibleFunction.lowercaseString.rangeOfString(functionArray[index]) != nil{
            return true
        }
    }
    return false
}

func isOperator(possibleOperator : String) -> Bool {
    for var index = 0; index < operatorArray.count; ++index {
        if possibleOperator.containsString(operatorArray[index]) {
            return true
        }
    }
    return false
}

func calculate(firstValue : String){
    var equationString : String = firstValue
    if isFunction(equationString) {
        print( "\(solve(equationString, locationFromLast: 1))")
    } else {
        if isOperator(equationString) {
            print( "\(solve(equationString, locationFromLast: 2))")
        } else {
            let commandInput : String  = input()
            if isOperator(commandInput) {
                equationString.appendContentsOf(" \(commandInput)")
                equationString.appendContentsOf(" \(input())")
                print( "\(solve(equationString, locationFromLast: 2))")
            } else {
                if isFunction(commandInput) {
                    equationString.appendContentsOf(" \(commandInput)")
                } else {
                    equationString.appendContentsOf(" \(commandInput)")
                    var tempString : String = ""
                    repeat {
                        tempString = input()
                        equationString.appendContentsOf(" \(tempString)")
                    } while !isFunction(tempString)
                }
                print( "\(solve(equationString, locationFromLast: 1))")
            }
        }
    }
}

func mainCalc() {
    print("This is Simple Calc it is a simple calculator... type exit to quit")
    print("Please enter the problem")
    var inputString : String = input()
    while inputString.lowercaseString.rangeOfString("exit") == nil{
        calculate(inputString)
        print("Please enter the next problem")
        inputString = input()
    }
}

mainCalc()


