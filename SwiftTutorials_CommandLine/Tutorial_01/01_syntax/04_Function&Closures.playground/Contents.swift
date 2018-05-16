//: Playground - noun: a place where people can play

import UIKit

/**** function  ****
 Use func to declare a function. Call a function by following its name with a list of arguments in parentheses. Use -> to separate the parameter names and types from the function’s return type.
 */

func greet(name: String, day: String) -> String {
    return "Hello \(name), today is \(day)."
}
greet(name: "Bob", day: "Tuesday")

/**
 By default, functions use their parameter names as labels for their arguments.
 Write a custom argument label before the parameter name, or write _ to use no argument label.
 */
func greet(_ person: String, on day: String) -> String {
    return "Hello \(person), today is \(day)"
}
greet("John", on: "Wednesday")

/**
 func foo(x: Int)       foo(2)              Omit label
 func foo(#x: Int)      foo(x:2)            Use label
 func foo(_ x: Int)     foo(2) or foo(x:2)	Label optional
 func foo(bar x: Int)	foo(bar:2)          Use external label
 
 But then they decided that to make Swift play nice with Cocoa that labels would be required by default in classes, but not in standalone functions. As long as it wasn’t the first parameter in a member function, in which case the label was to be omitted. Unless it was an init in which case all labels were required. Oh, and if it had a default value, whether it is a standalone function or a member function the label was to be required.
 */

/**
 *   元组
 *   Use a tuple(元组) to make a compound value—for example, to return multiple values from a function.
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

let statistics = calculateStatistics(scores: [5, 3, 100, 4, 6])
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

func sumOf(numbers: [Int]) -> Int {
    var sum = 0
    for num in numbers {
        sum += num
    }
    
    return sum
}

sumOf()
sumOf(numbers: 22, 11, 33, 33)
sumOf(numbers: [1, 2, 3])

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

var fifteen = returnFifteen()

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

// e.g.
func testFunc() -> (() -> Int) {
    func add() -> Int {
        return 20
    }
    
    return add;
}

var testAdd = testFunc()
var testValue = testAdd()


/**
 A function can take another function as one of its arguments.
 - parameter list:      数组
 - parameter conditon: 方法
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
hasAnyMatches(list: nums, conditon: lessThanTen)


var luckyNumber = 7
func incrementor(variable: Int) -> Int {
    var variable = variable
    variable += 1
    return variable
}
let newNumber = incrementor(variable: luckyNumber)
/**
 默认认为是不可变的，也就是用 let 进行声明的。这样不仅可以确保安全，也能在编译器的性能优化上更有作为。在方法的参数上也是如此，我们不写修饰符的话，默认情况下所有参数都是 let 的
 等效为
 func incrementor(let variable: Int) -> Int {
 var variable = variable
 variable += 1
 return variable
 }
 */
print(luckyNumber)

/**
 *  正如上面的例子，我们将参数写作 var 后，通过调用返回的值是正确的，而 luckyNumber 还是保持了原来的值。这说明 var 只是在方法内部作用，而不直接影响输入的值。有些时候我们会希望在方法内部直接修改输入的值，这时候我们可以使用 inout 来对参数进行修饰：
 */
func incrementor(variable: inout Int) -> () {
    variable += 1
}// inout before a parameter name is not allowed, place it before the parameter type instead

///因为在函数内部就更改了值，所以也不需要返回了。调用也要改变为相应的形式，在前面加上 & 符号：
incrementor(variable: &luckyNumber)
print(luckyNumber)

func makeIncrementor(addNumber: Int) -> ((inout Int) -> ()) {
    func incrementor(variable: inout Int) -> () {
        variable += addNumber;
    }
    return incrementor;
}

var ic = makeIncrementor(addNumber: 1)
var ii = 3
ic(&ii)
print(ii)

/**
 *   Closures (闭包)
 Functions are actually a special case of closures: blocks of code that can be called later.
 The code in a closure has access to things like variables and functions that were available in the scope where the closure was created, even if the closure is in a different scope when it is executed—you saw an example of this already with nested functions.
 You can write a closure without a name by surrounding code with braces ({}).
 Use in to separate the arguments and return type from the body. (使用关键字in来把参数、返回值与body分开)
 */
// nums = [20, 19, 7, 11]
var r = nums.map({(num: Int) -> Int in
    let result = 3 * num
    return result
})
print(r)

var s = nums.map({(num: Int) -> Int in
    if num % 2 == 1 {
        return num + 1
    }else {
        return num
    }
})
print(s)

/**
 *  You have several options for writing closures more concisely. When a closure’s type is already known, such as the callback for a delegate, you can omit the type of its parameters, its return type, or both. Single statement closures implicitly return the value of their only statement.
 */
let mapNum = nums.map({
    num in 3 * num
})
print(mapNum)

/**
 *  You can refer to parameters by number instead of by name—this approach is especially useful in very short closures. A closure passed as the last argument to a function can appear immediately after the parentheses(圆括号). When a closure is the only argument to a function, you can omit the parentheses(圆括号) entirely.
 */
/// Swift 自动为内联函数提供了参数名称缩写功能，您可以直接通过$0,$1,$2来顺序调用闭包的参数。

let sortNumbers = nums.sorted{$0 > $1}
print(sortNumbers)

//
var numbers = [12, 25, 1, 35, 27]
let numbersSorted = numbers.sorted{(n1: Int, n2: Int) -> Bool in
    //进行从小到大的排序
    return n2 > n1
}

// 闭包可以不用指定参数类型，编译器会帮我们推断的
let numbersSorted2 = numbers.sorted{n1, n2 -> Bool in
    //进行从小到大的排序
    return n2 > n1
}

// 还可以省略参数名，直接根据数字来引用每个参数（$0，$1，$2......）
let numbersSorted3 = numbers.sorted{
    //进行从小到大的排序
    return $1 > $0
}

// 如果闭包只包含一行代码，可以省略return关键字
let numbersSorted4 = numbers.sorted{
    //进行从小到大的排序
    $1 > $0
}
print(numbersSorted4)

// 如果一个闭包是函数调用的最后一个参数，可以将它放在括号外面。提高可读性。
let numbersSorted5 = numbers.sorted(){
    //进行从小到大的排序
    $1 > $0
}

// 闭包也可以存储在变量中，像调用函数一样调用它们
let comparator = {(a: Int, b: Int) in a < b}
comparator(2, 5)







