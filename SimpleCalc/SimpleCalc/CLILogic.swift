//
//  CLILogic.swift
//  SimpleCalc
//
//  Created by Shawn Namdar on 12/8/15.
//  Copyright © 2015 Shawn Namdar. All rights reserved.
//

import Foundation

    func input() -> String {
        let keyboard = NSFileHandle.fileHandleWithStandardInput()
        let inputData = keyboard.availableData
        let result = NSString(data: inputData, encoding:NSUTF8StringEncoding) as!String
        let returnString = result.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        if returnString.lowercaseString.rangeOfString("exit") == nil {
            return returnString
        } else {
            exit(0)
        }
    }

