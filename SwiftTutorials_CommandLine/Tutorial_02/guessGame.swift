//
//  guessGame.swift
//  SwiftTutorials_CommandLine
//
//  Created by ZJ on 1/13/16.
//  Copyright © 2016 ZJ. All rights reserved.
//

import Foundation

func guessGame() {
    
    let answer = randomIntBetween(1, high: 100)
    var turn = 1
    
    while(true) {
        print("Guess #\(turn) : Enter a number between 1 and 100.")
        
        let userinput = input();
        let inputAsInt = Int(userinput);
        
        if let guess = inputAsInt {
            if(guess > answer) {
                print("guess \(guess) Higher than \(answer)!")
            } else if(guess < answer) {
                print("guess \(guess) Lower than \(answer)!")
            } else {
                print("Correct! The answer was \(answer).")
                break;
            }
        }else {
            print("Invalid input! please enter a number")
            continue;
        }
        turn++;
    }
    
    print("It took you \(turn) tries")
}