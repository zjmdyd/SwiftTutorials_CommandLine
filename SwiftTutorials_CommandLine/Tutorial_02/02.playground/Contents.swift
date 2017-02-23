//: Playground - noun: a place where people can play

import UIKit

func randomIntBetween(low:Int, high:Int) -> Int {
    let range = high - (low - 1)
    return (Int(arc4random()) % range) + (low - 1)
}

var guess = 7
let answer = randomIntBetween(low: 1, high: 100)

if(guess < answer) {
    print("Lower")
}else if(guess > answer) {
    print("Higher")
}else {
    print("Correct, the answer was \(answer)")
}
