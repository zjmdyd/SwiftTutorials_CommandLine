//: [Previous](@previous)

import UIKit

class Person {
    var firstName = ""
    var lastName = ""
    var age = 0
    
    func input() -> String {
        let keyboard = FileHandle.standardInput
        let inputData = keyboard.availableData
        let rawString = NSString(data: inputData, encoding:String.Encoding.utf8.rawValue)
        if let string = rawString {
            return string.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
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
newPerson.changeFirstName(newFirstname: "Paul")

