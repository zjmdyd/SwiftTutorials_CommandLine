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
    
    func input() -> String {    // 返回值(declared by the ->)类型:String
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
            age = number
        }
    }
    
    func printInfo() {
        print("\(firstName) \(lastName) is \(age) years old")
    }
}

func testRepeatWhile () {
    var response: String
    
    /**
     *   数组
     */
    var people: [Person] = []
    
    /*
    *   repeat...while... 类似于do...while...
    */
    repeat {
        let p = Person()
        p.enterInfo()
        
        people.append(p)
        print("Number of People in the database: \(people.count)")
        p.printInfo()
        print("Do you want to enter another name? (y/n)")
        response = p.input()
    } while(response == "y")
    
    /*
    *   for Loops
    */
    for onePerson in people {
        onePerson.printInfo()
    }
}