//: Playground - noun: a place where people can play

import UIKit

/**
 Constants and Variables
 
 Constants and variables associate a name (such as maximumNumberOfLoginAttempts or welcomeMessage) with a value of a particular type (such as the number 10 or the string "Hello"). The value of a constant cannot be changed once it is set, whereas a variable can be set to a different value in the future.
 
 Declaring Constants and Variables
 
 Constants and variables must be declared before they are used. You declare constants with the let keyword and variables with the var keyword. Here’s an example of how constants and variables can be used to track the number of login attempts a user has made:
 */
let maximumNumberOfLoginAttempts = 10
var currentLoginAttempt = 0

/*
 This code can be read as:
 
 “Declare a new constant called maximumNumberOfLoginAttempts, and give it a value of 10. Then, declare a new variable called currentLoginAttempt, and give it an initial value of 0.”
 
 In this example, the maximum number of allowed login attempts is declared as a constant, because the maximum value never changes. The current login attempt counter is declared as a variable, because this value must be incremented after each failed login attempt.
 
 You can declare multiple constants or multiple variables on a single line, separated by commas:
 */
var x = 0.0, y = 0.0, z = 0.0
/**
 NOTE
 
 If a stored value in your code is not going to change, always declare it as a constant with the let keyword. Use variables only for storing values that need to be able to change.
 */

/**
 Type Annotations
 
 You can provide a type annotation(注释，注解) when you declare a constant or variable, to be clear about the kind of values the constant or variable can store. Write a type annotation by placing a colon(冒号) after the constant or variable name, followed by a space, followed by the name of the type to use.
 
 This example provides a type annotation for a variable called welcomeMessage, to indicate that the variable can store String values:
 */
var welcomeMessage: String

/**
 The colon in the declaration means “…of type…,” so the code above can be read as:
 
 “Declare a variable called welcomeMessage that is of type String.” (语法不理解)
 
 The phrase “of type String” means “can store any String value.” Think of it as meaning “the type of thing” (or “the kind of thing”) that can be stored.
 
 The welcomeMessage variable can now be set to any string value without error:
 */
welcomeMessage = "Hello"
/**
 You can define multiple related variables of the same type on a single line, separated by commas, with a single type annotation after the final variable name:
 */
var red, green, blue: Double
/**
 NOTE
 
 It is rare that you need to write type annotations in practice. If you provide an initial value for a constant or variable 
    at the point(在这个时候) that it is defined, Swift can almost always infer the type to be used for that constant or variable, as described in Type Safety and Type Inference. In the welcomeMessage example above, no initial value is provided, and so the type of the welcomeMessage variable is specified with a type annotation rather than being inferred from an initial value.
 */

/**
Naming Constants and Variables

Constant and variable names can contain almost any character, including Unicode characters:
*/
let π = 3.14159
let 你好 = "你好世界"
let 🐶🐮 = "dogcow"
/**
 Constant and variable names cannot contain whitespace characters, mathematical(数学的) symbols, arrows, private-use (or invalid) Unicode code points, or line- and box-drawing characters(方框绘制字符). Nor can they begin with a number, although numbers may be included elsewhere within the name.
 
 Once you’ve declared a constant or variable of a certain type, you can’t redeclare it again with the same name, or change it to store values of a different type. Nor can you change a constant into a variable or a variable into a constant.
 
 NOTE
 
 If you need to give a constant or variable the same name as a reserved Swift keyword, surround the keyword with backticks (`) when using it as a name. However, avoid using keywords as names unless you have absolutely no choice.
 
 You can change the value of an existing variable to another value of a compatible type. In this example, the value of friendlyWelcome is changed from "Hello!" to "Bonjour!":
 Unlike a variable, the value of a constant cannot be changed once it is set. Attempting to do so is reported as an error when your code is compiled:
 */

/**
 Printing Constants and Variables
 
 You can print the current value of a constant or variable with the print(_:separator:terminator:) function:
 */
var friendlyWelcome = "Hello!"
print(friendlyWelcome)
/**
 The print(_:separator:terminator:) function is a global function that prints one or more values to an appropriate(适当的) output. In Xcode, for example, the print(_:separator:terminator:) function prints its output in Xcode’s “console” pane. The separator and terminator parameter have default values, so you can omit them when you call this function. By default, the function terminates the line it prints by adding a line break. To print a value without a line break after it, pass an empty string as the terminator—for example, print(someValue, terminator: ""). For information about parameters with default values, see Default Parameter Values.
 
 Swift uses string interpolation to include the name of a constant or variable as a placeholder in a longer string, and to prompt Swift to replace it with the current value of that constant or variable. Wrap the name in parentheses and escape it with a backslash before the opening parenthesis:
 */
print("The current value of friendlyWelcome is \(friendlyWelcome)")
print(welcomeMessage, welcomeMessage, separator: "...", terminator: "E")











