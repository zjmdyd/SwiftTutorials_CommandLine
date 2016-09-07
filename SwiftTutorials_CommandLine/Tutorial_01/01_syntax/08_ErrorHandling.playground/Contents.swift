//: Playground - noun: a place where people can play

import UIKit
/**
 *  You represent errors using any type that adops the ErrorType protocol.
 */

enum PrinterError: ErrorType {
    case OutOfPaper
    case NoToner
    case OnFire
}

/**
 Use throw to throw an error and throws to mark a function that can throw an error. If you throw an error in a function, the function returns immediately and the code that called the function handles the error.
 */
func sendToPrinter(printerName: String) throws -> String {
    if printerName == "Never has Toner" {
        throw PrinterError.NoToner
    }
    
    return "Job sent"
}

/**
 *  There are several ways to handle errors. One way is to use do-catch. Inside the do block, you mark code that can throw an error by writing try in front of it. Inside the catch block, the error is automatically given the name error unless you can give it a different name.
 */
do {
    let printerResponse = try sendToPrinter("Bi Sheng") // writing try in front of it
    print(printerResponse)
}catch {
    print(error)    // the error is automatically given the name error
}

do {
    let printerResponse = try sendToPrinter("Never has Toner")
    print(printerResponse)
}catch {
    print(error)
}