//: [Previous](@previous)

import UIKit

class Person {
    var firstName = ""
    var lastName = ""
    var age = 0
    
    func input() -> String {
        let keyboard = NSFileHandle.fileHandleWithStandardInput()
        let inputData = keyboard.availableData
        let rawString = NSString(data: inputData, encoding:NSUTF8StringEncoding)
        if let string = rawString {
            return string.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        } else {
            return "Invalid input"
        }
    }
    
    func changeFirstName(newFirstname:String) {
        firstName = newFirstname
    }
    
    func enterInfo() {
        print("what is the first name?")
        firstName = input()
    }
    
    func printInfo() {
        print("first Name : \(firstName)")
    }
}

var newPerson = Person()
newPerson.firstName = "Ry"
newPerson.lastName = "Birstow"
newPerson.age = 18
newPerson.changeFirstName("Paul")

