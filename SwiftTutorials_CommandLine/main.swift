//
//  main.swift
//  SwiftTutorials_CommandLine
//
//  Created by ZJ on 1/13/16.
//  Copyright © 2016 ZJ. All rights reserved.
//

import Foundation

//guessGame()

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

testRepeatWhile()
