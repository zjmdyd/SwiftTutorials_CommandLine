//: Playground - noun: a place where people can play

import UIKit

/**
*   变量
*   variables
*/
var str:String = "Look what I can do"
var age:Int = 18
var cost:Double = 1.25
var hungry:Bool = true
var name:String = "Martin"
name = "Kobe"

/*
Here is a list of some of the basic data types that Swift has to offer:
Int – whole numbers, or integers
Double – decimal numbers
Bool – a value that can be true, or false
String – a “string” of letters or words
*/
/**
*   常量
*   constants
*/
let life:Int = 500
let pi:Double = 3.14
let captain:String = "BeiJing"
let favoriteNumber:Int = 24

/**
*   类型推断
*/
var luckyNumber = 7 //
var PI = 3.14

/*  Comparison Operators
Just like Playground can do simple math operations as explained earlier, it can compare numbers and values. Some of these operators include:
> Greater Than
< Less Than
== Equal To
>= Greater Than or Equal To
&& AND
|| OR
*/
let batmanCoolness = 10
var supermanCoolness = 9
var aquamanCoolness = 1

batmanCoolness < aquamanCoolness
supermanCoolness >= 8
batmanCoolness == (supermanCoolness + aquamanCoolness)
batmanCoolness > aquamanCoolness && supermanCoolness > aquamanCoolness
batmanCoolness < supermanCoolness || aquamanCoolness < supermanCoolness
batmanCoolness | supermanCoolness   // 按位或
if batmanCoolness > supermanCoolness {
    print("batmanCoolness > supermanCoolness")
}else {
    print("batmanCoolness < supermanCoolness")
}
print("hello world")
print(batmanCoolness)

/**
*  String Interpolation
*/
var apples = 5
print("Shally has \(apples)aplles")
print("Shally has \(apples - 5)aplles")

/**
*  eg
*/
var John = 95
var Sam = 85
if(John > Sam) {
    print("John grade \(John) grater than Sam grade \(Sam)")
}else if(John < Sam) {
    print("John grade \(John) less than Sam grade \(Sam)")
}else {
    print("John grade \(John) equal to Sam grade \(Sam)")
}

/**
*  While
*/
var donutsLeft = 6
while (donutsLeft > 0) {
    print("You have \(donutsLeft) donuts left")
    donutsLeft--;
    print("You eat one donut")
}
print("You are all out of donuts")

/**
*  Optionals: Optionals are variables that can either contain a value or contain nil.
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
var s = "haha"
print(s)
///optional
var possibleString: String? = "An optional string"
/*
var possibleString:String?  // Execution was interrupted,在没有初始化的普通可选时加!
*/
print(possibleString)
/**
*   你可以把隐式解析可选当做一个可以自动解析的可选。
你要做的只是声明的时候把感叹号放到类型的结尾，而不是每次取值的可选名字的结尾
*/
print(possibleString!)

var assumedString:String! = "An implicitly unwrapped optional string"
print(assumedString)

/**
*  Conversion Between Data Types(类型转换)
*/
var languagesLearned =  "3"
var languagesLearnedNum : Int? = Int(languagesLearned)
if let num = languagesLearnedNum {
    print("It is a number")
}else {
    print("It is not a number")
}

let label = "The width is "
let width = 98
let widthLabel = label + String(width)











