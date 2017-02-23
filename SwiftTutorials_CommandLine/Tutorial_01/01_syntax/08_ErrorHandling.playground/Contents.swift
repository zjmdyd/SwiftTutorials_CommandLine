//: Playground - noun: a place where people can play

import UIKit
/**
 *  You represent errors using any type that adops the ErrorType protocol.
 */
enum PrinterError: Error {
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
    }else if printerName == "OnFire" {
        throw PrinterError.OnFire
    }
    
    return "Job sent"
}

/**
 *  There are several ways to handle errors. One way is to use do-catch. Inside the do block, you mark code that can throw an error by writing try in front of it. Inside the catch block, the error is automatically given the name error unless you can give it a different name.
 */
do {
    let printerResponse = try sendToPrinter(printerName: "Bi Sheng") // writing try in front of it
    print(printerResponse)
}catch {
    print(error)    // the error is automatically given the name error
}

do {
    let printerResponse = try sendToPrinter(printerName: "Never has Toner")
    print(printerResponse)
}catch {
    print(error)
}

/**
 *  You can provide multiple catch blocks that handle specific errors. You write a pattern after catch just as you do after case in a switch.
 */
do {
    let printerResponse = try sendToPrinter(printerName: "Never has Toner")
    print(printerResponse)
}catch PrinterError.OnFire {
    print("I'll just pust this over here, with the rest of the fire.")
}catch let printerError as PrinterError {
    print("Printer error: \(printerError).")
}catch {
    print(error)
}

/**
 *  Use defer to write a block of code that is executed after all other code in the function, just before the function returns. The code is executed regardless of whether the function throws an error. You can use defer to write setup and cleanup code next to each other, even though they need to be executed at different times.
 */
var fridgeIsOpen = false
let fridgeContent = ["milk", "eggs", "leftovers"]
func fridgeContains(itemName: String) -> Bool {
    defer {
        print("hhh")
        fridgeIsOpen = false;
    }
    
    let result = fridgeContent.contains(itemName)
    fridgeIsOpen = true;
    print("aaa")

    return result
}
fridgeContains(itemName: "banana")
fridgeContains(itemName: "milk")
fridgeIsOpen

        
