//
//  CalculatorLogic.swift
//  SimpleCalc
//
//  Created by Shawn Namdar on 12/8/15.
//  Copyright © 2015 Shawn Namdar. All rights reserved.
//

//
//  CalculatorLogic.swift
//  SimpleCalcUI
//
//  Created by Shawn Namdar on 10/22/15.
//  Copyright © 2015 Shawn Namdar. All rights reserved.
//

import Foundation

enum CalculatorType {
    case RPN
    case Standard
}

var operatorArray: [String] = ["+","-","*","/","%"]
var functionArray: [String] = ["count","avg","fact"]
var equals: String = "="

func parse(stringEquation: String) -> [String] {
    return stringEquation.componentsSeparatedByString(" ")
}

func add(equation: [String]) -> String {
    return "\(Float(equation[0])! + Float(equation[2])!)"
}

func subtract(equation: [String]) -> String {
    return "\(Float(equation[0])! - Float(equation[2])!)"
}

func multiply(equation: [String]) -> String {
    return "\(Float(equation[0])! * Float(equation[2])!)"
}

func divide(equation: [String]) -> String {
    return "\(Float(equation[0])! / Float(equation[2])!)"
}

func mod(equation: [String]) -> String {
    return "\(Float(equation[0])! % Float(equation[2])!)"
}

func factorial(equation: [String]) -> String {
    var answer: Float = Float(equation[0])!
    for var index = answer-1; index > 0; --index {
        answer = answer * index
    }
    return "\(answer)"
}

func count(equation: [String], calculatorType: CalculatorType) -> String {
    var answer: Int
    if equation.count == 1 {
        return "\(equation.count)"
    }
    answer = equation.count - 1
    return "\(answer)"
}

func avg(equation: [String], calculatorType: CalculatorType) -> String {
    let equationCount = Int(count(equation, calculatorType: calculatorType))!
    var answer: Float = Float(equation[0])!
    for var index = 1; index < equation.count; ++index {
        if equation[index] != "avg" && equation[index] != "" {
            answer += Float(equation[index])!
        }
    }
    return "\(answer / Float(equationCount))"
}

func solve(stringEquation: String, locationFromLast: Int) -> String {
    let answer: String = ""
    var equation: [String] = parse(stringEquation)
        switch equation[equation.count-locationFromLast] {
        case "+":
            return add(equation)
        case "-":
            return subtract(equation)
        case "*":
            return multiply(equation)
        case "/":
            return divide(equation)
        case "%":
            return mod(equation)
        case "fact":
            return factorial(equation)
        case "count":
            return count(equation, calculatorType: .Standard)
        case "avg":
            return avg(equation, calculatorType: .Standard)
        default:
            break
        }
        return answer
}
