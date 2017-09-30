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
var languagesLearnedNum: Int? = Int(languagesLearned)
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
 *  Create arrays and dictionaries using brackets ([]), and access their elements by writing the index or key in brackets. A comma(逗号) is allowed after the last element.
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

for (_, obj) in dic {
    print(obj)
}

/// 初始化字典1
var dic2 = [String : Float]()
// var dic2 = [:]  // swift 2
dic["k1"] = "v1"

/// 初始化字典2
var dic3:[Int:Float] = [:]
dic3[1] = 1.0

/// 初始化字典3
var dic4 = Dictionary<String, Int>()
dic4["a"] = 1

var val = dic4.keys
print(val)

/// 清空字典
dic = [:]
dic.removeAll()


/**
 * 访问控制
 */

/**
 1，private
 private访问级别所修饰的属性或者方法只能在当前类里访问。
 
 2，fileprivate
 fileprivate访问级别所修饰的属性或者方法在当前的Swift源文件里可以访问。（比如上门样例把private改成fileprivate就不会报错了）
 
 3，internal（默认访问级别，internal修饰符可写可不写）
 internal访问级别所修饰的属性或方法在源代码所在的整个模块都可以访问。
 如果是框架或者库代码，则在整个框架内部都可以访问，框架由外部代码所引用时，则不可以访问。
 如果是App代码，也是在整个App代码，也是在整个App内部可以访问。
 
 4，public
 可以被任何人访问。但其他module中不可以被override和继承，而在module内可以被override和继承。
 
 5，open
 可以被任何人使用，包括override和继承。
 
 从高到低排序如下：
 open > public > interal > fileprivate > private
 
 */
/*
 在原有的swift中的 private其实并不是真正的私有，如果一个变量定义为private，在同一个文件中的其他类依然是可以访问到的。这个场景在使用extension的时候很明显。
 
 这样带来了两个问题：
 
 当我们标记为private时，意为真的私有还是文件内可共享呢？
 当我们如果意图为真正的私有时，必须保证这个类或者结构体在一个单独的文件里。否则可能同文件里其他的代码访问到。
 由此，在swift 3中，新增加了一个 fileprivate来显式的表明，这个元素的访问权限为文件内私有。过去的private对应现在的fileprivate。现在的private则是真正的私有，离开了这个类或者结构体的作用域外面就无法访问。
 */

class User {
    fileprivate var name = "private" // 如用private修饰则会报错
}

extension User{
    var accessPrivate: String {
        return name
    }
}








