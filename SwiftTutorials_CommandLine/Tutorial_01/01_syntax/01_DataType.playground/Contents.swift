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
*   If the initial value doesn’t provide enough information (or if there is no initial value), specify the type by writing it after the variable, separated by a colon(冒号).
*/
var luckyNumber = 7 //
var PI = 3.14
let explicitDouble: Double = 70

/*  Comparison Operators ()
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


/**
 *  String Interpolation(插补) --> 字符串拼接
 *   There’s an even simpler way to include values in strings: Write the value in parentheses(圆括号), and write a backslash (\) before the parentheses
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
 *** 数组 **
 *  Create arrays and dictionaries using brackets ([]), and access their elements by writing the index or key in brackets. A comma is allowed after the last element.
 */
var shoppingList = ["aa", "nn", "mm"]
for a in shoppingList {
    print(a)
}

shoppingList[1] = "haha"
for a in shoppingList {
    print(a)
}

/// 初始化数组1
var emptyArray = [String]()
emptyArray.append("a")

/// 初始化数组2
var emptyAry: [String] = []
emptyAry.append("aa")

/// 清空数组
emptyAry = []
emptyAry.removeAll()
emptyAry.append("bb")

/**
 *** 字典 **
 */
var dic = [
    "key1" : "value1",
    "key2" : "value2"
]
dic["key3"] = "value3"
for d in dic {
    print("key = ", d.0, ", value = ", d.1)  // 0表示key, 1表示value
}

/// 初始化字典1
var dic2 = [String : Float]()
// var dic2 = [:]  // swift 2
dic["k1"] = "v1"

/// 初始化字典2
var dic3:[Int:Float] = [:]
dic3[1] = 1.0

/// 清空字典
dic = [:]
dic.removeAll()











