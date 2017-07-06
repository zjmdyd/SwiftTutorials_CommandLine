//: Playground - noun: a place where people can play

import UIKit

/****   if    *****
 *  Use if and switch to make conditionals, and use for-in, for, while, and repeat-while to make loops. Parentheses(圆括号) around the condition or loop variable are optional. Braces around the body are required.
 */

let individualScres = [75, 43, 103, 87]
var teamScore = 0

for score in individualScres {
    if score > 50 {
        teamScore += 3
    }else {
        teamScore += 1
    }
}
print(teamScore)
/****   optional    ****
 *  In an if statement, the conditional must be a Boolean expression—this means that code such as if score { ... } is an error, not an implicit comparison to zero.
 
    You can use if and let together to work with values that might be missing. These values are represented as optionals. An optional value either contains a value or contains nil to indicate that a value is missing. Write a question mark (?) after the type of a value to mark the value as optional.
 */
var optionString: String? = "hello"
print(optionString == nil)
// annotation (注释注解)
var optionName: String? = "John"
var greeting = "Hello"
if let name = optionName {
    greeting = "Hello, \(name)"
}else {
    greeting = "Hello, \(optionName!)"
}


/**
 *  If the optional value is nil, the conditional is false and the code in braces is skipped. Otherwise, the optional value is unwrapped and assigned to the constant after let, which makes the unwrapped value available inside the block of code.
 
 Another way to handle optional values is to provide a default value using the ?? operator. If the optional value is missing, the default value is used instead.
 */
let nickName: String? = nil
let fullName: String? = "John"
let informalGreeting = "Hi \( nickName ?? fullName!)"   // ?? 给默认值


/****   Switches    *****
 *  Switches support any kind of data and a wide variety of comparison operations—they aren’t limited to integers and tests for equality.
 
    After executing the code inside the switch case that matched, the program exits from the switch statement. Execution doesn’t continue to the next case, so there is no need to explicitly break out of the switch at the end of each case’s code.
 
    switch must exhaustive, consider adding a default clause(在不加default的时候会提示)
 
 Swift 中的switch不会从上一个 case 分支落入到下一个 case 分支中。相反，只要第一个匹配到的 case 分支完成了它需要执行的语句，整个switch代码块完成了它的执行。相比之下，C 语言要求你显式地插入break语句到每个 case 分支的末尾来阻止自动落入到下一个 case 分支中。Swift 的这种避免默认落入到下一个分支中的特性意味着它的switch 功能要比 C 语言的更加清晰和可预测，可以避免无意识地执行多个 case 分支从而引发的错误。
 
 如果你确实需要 C 风格的贯穿的特性，你可以在每个需要该特性的 case 分支中使用fallthrough关键字。下面的例子使用fallthrough来创建一个数字的描述语句。
 */

let vegetable = "red pepper"
switch vegetable {
case "celery":
    print("Add some raisins and make ants on a log.")
case "cucumber", "watercress":
    print("That would make a good tea sandwich.")
case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)?")                        // spicy(辛辣的)
    fallthrough                                         // 贯穿
default:
    print("Everything tastes good in soup.")
}


/**
 *  for...in....
 */
let interestingNumbers = [
    "Prime" : [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0

/**
 *  遍历字典方法1
 */
for dic in interestingNumbers {
    for a in dic.1 {
        if a > largest {
            largest = a
        }
    }
}

print("largest = \(largest)")
largest = 0
/**
 *  遍历字典方法2
 */
for (kind, numbers) in interestingNumbers {
    print(kind, numbers)
    for num in numbers {
        if num > largest {
            largest = num
        }
    }
}

print(largest)


/**
 ****  While  / repate...while  ****
 Use while to repeat a block of code until a condition changes. The condition of a loop can be at the end instead, ensuring that the loop is run at least once.
 */
var donutsLeft = 6
while (donutsLeft > 0) {
    print("You have \(donutsLeft) donuts left")
    donutsLeft -= 1;
    print("You eat one donut")
}
print("You are all out of donuts")

var m = 2
repeat {
    m = m * 2
} while m < 100
print(m)

var loop = 0
/**
 *  Use ..< to make a range that omits its upper value
 */
for i in 0..<4 {
    //    loop++    // deprecated 3.0
    loop += 1
}
print(loop)

loop = 0
/**
 *  use ... to make a range that includes both values
 */
for i in 0...4 {
    loop += 1
}
print(loop)

/**
 下划线符号_(替代循环中的变量)能够忽略具体的值，并且不提供循环遍历时对值的访问
 */
for _ in 0...4 {
    loop += 1
}
print(loop)


/** 普通可选
 *  Optionals: Optionals are variables that can either contain a value or contain nil.
    Write a question mark (?) after the type of a value to mark the value as optional.
 */
var optionalNumber : Int? = 5   // The ? is what declares the value as an optional.
optionalNumber = nil
if let number = optionalNumber {
    print("It is a number")
}else {
    print("It is not a number")
}
/**
 *   implicitly unwrapped optionals(隐式解析可选)
 一个隐式解析可选其实就是一个普通的可选，但是可以被当做非可选来使用，并不需要每次都使用解析来获取可选值
 
 如果一个变量之后可能变成nil的话请不要使用隐式解析可选。
 如果你需要在变量的生命周期中判断是否是nil的话，请使用普通可选类型
 */
 /// non-optional type string
var s = "haha"
print(s)

/// optional
var possibleString: String? = "An optional string"
/*
 var possibleString:String?  // Execution was interrupted,在没有初始化的普通可选时加!
 */
print(possibleString!)
// print(possibleString)  // error : ? must be follwed by a call,member lookup,or subscript
/**
 *   你可以把隐式解析可选当做一个可以自动解析的可选。
    你要做的只是声明的时候把感叹号放到类型的结尾，而不是每次取值时都要在待取值变量的结尾加感叹号
 */
print(possibleString!)
// OV(old version) print(possibleString)

/// implicitly unwrapped optional
var assumedString: String! = "An implicitly unwrapped optional string"
print(assumedString)
print(assumedString!)
        
