//: Playground - noun: a place where people can play

import UIKit

///
/**
*   String 
*   these two strings are both empty, and are equivalent to each other
*/
var emptyString = ""            // empty string literal
var anotherString = String()    // initalizer syntax

if emptyString.isEmpty {
    print("Nothing to see here")
}

var variableString = "hourse"
variableString += " and carriage"

/**
*  Working with Characters
*/

for character in "Dog!🐶".characters {
    print(character)
}

 /// Alternatively, you can create a stand-alone Character constant or variable from a single-character string literal by providing a Character type annotation:
let exclamationMark: Character = "!"

/// String values can be constructed by passing an array of Character values as an argument to its initializer:
let catCharacters: [Character] = ["C", "a", "t"]
let catString = String(catCharacters)
print(catString)

 /// String values can be added together (or concatenated) with the addition operator (+) to create a new String value:
let s1 = "hello"
let s2 = " there"
var welcome = s1 + s2

var s3 = "baby"
s3 += s2

/// You can append a Character value to a String variable with the String type’s append() method:
welcome.append(exclamationMark)

/// Counting Characters
/// Note that Swift’s use of extended grapheme clusters for Character values means that string concatenation and modification may not always affect a string’s character count.
print(s3.characters.count)
s3 += "\u{301}"
print(s3.characters.count)

/**
*  String Indices
Use the startIndex property to access the position of the first Character of a String. The endIndex property is the position after the last character in a String. As a result, the endIndex property isn’t a valid argument to a string’s subscript. If a String is empty, startIndex and endIndex are equal.
*/
var greeting = "Guten Tag!"
greeting[greeting.startIndex]

/**
*  A String.Index value can access its immediately preceding index by calling the predecessor() method, and its immediately succeeding(随后的) index by calling the successor() method.
*/
greeting[greeting.endIndex.predecessor()]
let index = greeting.startIndex.advancedBy(3)
greeting[index]

/**
*  Use the indices property of the characters property to create a Range of all of the indexes used to access individual characters in a string.
*/

for index in greeting.characters.indices {
    print("\(greeting[index])", terminator: "")
}

greeting.insert("!", atIndex: greeting.endIndex)
greeting.insertContentsOf("hello".characters, at: greeting.endIndex)




