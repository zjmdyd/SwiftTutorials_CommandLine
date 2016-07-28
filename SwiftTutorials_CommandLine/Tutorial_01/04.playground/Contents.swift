//: Playground - noun: a place where people can play

import Foundation

/**
    *** 数组 **
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
/// 清空字典
dic = [:]
dic.removeAll()

/**
*   if
*   In an if statement, the conditional must be a Boolean expression
*   括号可加可不加
*/
var i = 80
if i > 60 {
    print("合格")
}

/// Another way to handle optional values is to provide a default value using the ?? operator. If the optional value is missing, the default value is used instead.
let nickName: String? = nil
let fullName: String = "John"
let informalGreeting = "Hi \(nickName ?? fullName)"

/**
*   switch...case...
*   Switches support any kind of data and a wide variety of comparison operations—they aren’t limited to 
*   integers and tests for equality.
*/
let vegetable = "red pepper"

switch vegetable {
case "celery":
    print("Add some raisins and make ants on a log.")
case "cucumber", "watercress":
    print("That would make a good tea sandwitch")
case let x where x.hasSuffix("pepper"):     // let where
    print("Is it a spicy \(x)?")
default:
    print("Everything tastes good in soup.")
}

var c:NSComparisonResult? = vegetable.compare("red")
if (c == NSComparisonResult.OrderedAscending) {
    print("OrderedAscending")
}else {
    print("OrderedDescending")
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

print(largest)

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

var loop = 0

///deprecated
/*
for var i = 0; i < 4; i++ {
    loop++
}
*/

loop = 0
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
//    loop++    // deprecated 3.0
    loop += 1
}
print(loop)

/**
 下划线符号_(替代循环中的变量)能够忽略具体的值，并且不提供循环遍历时对值的访问
 */
for _ in 0...4 {
//    loop++    // deprecated 3.0
    loop += 1
}
print(loop)
 
/**
*   元组
*   Use a tuple to make a compound value—for example, to return multiple values from a function.
*   The elements of a tuple can be referred to either by name or by number
*/

func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores {
        if score > max {
            max = score
        }else if score < min {
            min = score
        }
        
        sum += score
    }
    
    return(min, max, sum)
}

let statistics = calculateStatistics([5, 3, 100, 4, 6])
print(statistics.sum)
print(statistics.2)

/**
 Functions can also take a variable number of arguments, collecting them into an array.
 */
func sumOf(numbers: Int...) -> Int {
    var sum = 0
    for num in numbers {
        sum += num
    }
    
    return sum
}

sumOf()
sumOf(22, 11, 33)
//sumOf([11, 22])   error

/** 函数的嵌套
*   Functions can be nested.
    Nested functions have access to variables that were declared in the outer function.
    You can use nested functions to organize the code in a function that is long or complex.
*/

func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}

returnFifteen()

/**
*  Functions are a first-class type. This means that a function can return another function as its value.
*/

func makeIncrementer () -> ((Int) -> Int) {
    func addone(num: Int) -> Int {
        return num + 1;
    }
    
    return addone
}

var increment = makeIncrementer()
increment(7)

/**
 A function can take another function as one of its arguments.
 - parameter list:      数组
 - parameter conditon: 方法名
 */
func hasAnyMatches(list: [Int], conditon: (Int) -> Bool) -> Bool {
    for item in list {
        if conditon(item) {
            return true
        }
    }
    
    return false
}

func lessThanTen(num: Int) -> Bool {
    return num < 10
}

var nums = [20, 19, 7, 11]
hasAnyMatches(nums, conditon: lessThanTen)

var luckyNumber = 7

/* deprecated
func incrementor(var variable: Int) -> Int {
    return ++variable
}
 let newNumber = incrementor(luckyNumber)
 // newNumber = 8
 */

/**
func incrementor(variable: Int) -> Int {
    return ++variable
}
默认认为是不可变的，也就是用 let 进行声明的。这样不仅可以确保安全，也能在编译器的性能优化上更有作为。在方法的参数上也是如此，我们不写修饰符的话，默认情况下所有参数都是 let 的
等效为
func incrementor(let variable: Int) -> Int {
    return ++variable
}
*/

print(luckyNumber)
// luckyNumber 还是 7
/**
*  正如上面的例子，我们将参数写作 var 后，通过调用返回的值是正确的，而 luckyNumber 还是保持了原来的值。这说明 var 只是在方法内部作用，而不直接影响输入的值。有些时候我们会希望在方法内部直接修改输入的值，这时候我们可以使用 inout 来对参数进行修饰：
*/
func incrementor(inout variable: Int) {
    variable += 1
}
///因为在函数内部就更改了值，所以也不需要返回了。调用也要改变为相应的形式，在前面加上 & 符号：

var luckyNumber2 = 7
incrementor(&luckyNumber)

print(luckyNumber)
// luckyNumber = 8

func makeIncrementor(addNumber: Int) -> ((inout Int) -> ()) {
    func incrementor(inout variable: Int) -> () {
        variable += addNumber;
    }
    return incrementor;
}

var ic = makeIncrementor(1)
var ii = 3
ic(&ii)
print(ii)

/**
*   Closures
    Functions are actually a special case of closures: blocks of code that can be called later. The code in a closure has access to things like variables and functions that were available in the scope where the closure was created, even if the closure is in a different scope when it is executed—you saw an example of this already with nested functions. You can write a closure without a name by surrounding code with braces ({}).
/// Use in to separate the arguments and return type from the body. 使用关键字in来把参数、返回值与body分开
*/
var r = nums.map({
    (num: Int) -> Int in
    let result = 3 * num
    return result
})
print(r)

var s = nums.map({
    (num: Int) -> Int in
    if num % 2 == 1 {
        return num+1
    }else {
        return num
    }
})
print(s)

/**
*  You have several options for writing closures more concisely. When a closure’s type is already known, such as the callback for a delegate, you can omit the type of its parameters, its return type, or both. Single statement closures implicitly return the value of their only statement.
*/
let mapNum = nums.map({num in 3 * num})
print(mapNum)

/// Swift 自动为内联函数提供了参数名称缩写功能，您可以直接通过$0,$1,$2来顺序调用闭包的参数。
let sortNumbers = nums.sort{$0 > $1}
print(sortNumbers)








