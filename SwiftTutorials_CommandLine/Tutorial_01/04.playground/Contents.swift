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

for var i = 0; i < 4; i++ {
    loop++
}

loop = 0
/**
*  Use ..< to make a range that omits its upper value
*/
for i in 0..<4 {
    loop++
}
print(loop)

loop = 0
/**
*  use ... to make a range that includes both values
*/
for i in 0...4 {
    loop++
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

/**
*   Closures
    Functions are actually a special case of closures: blocks of code that can be called later. The code in a closure has access to things like variables and functions that were available in the scope where the closure was created, even if the closure is in a different scope when it is executed—you saw an example of this already with nested functions. You can write a closure without a name by surrounding code with braces ({}). Use in to separate the arguments and return type from the body.
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

let sortNumbers = nums.sortInPlace()







