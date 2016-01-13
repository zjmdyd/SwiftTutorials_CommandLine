//
//  Person.swift
//  PeopleDatabase
//
//  Created by ZJ on 1/6/16.
//  Copyright © 2016 ZJ. All rights reserved.
//

import Foundation

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
        
        print("What is \(firstName)'s last name?")
        lastName = input()
        
        print("How old is \(firstName) \(lastName)")
        
        let userInput = Int(input())
        if let number = userInput {
            age = number;
        }
    }
    
    func printInfo() {
        print("\(firstName) \(lastName) is \(age) years old")
    }
}