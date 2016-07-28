//: Playground - noun: a place where people can play

import UIKit

/**
*  Generics(泛型):
    Write a name inside angle brackets to make a generic function or type.
    泛型是 Swift 强大特征中的其中一个，许多 Swift 标准库是通过泛型代码构建出来的。事实上，泛型的使用贯穿了整本语言手册，只是你没有发现而已。例如，Swift 的数组和字典类型都是泛型集。你可以创建一个Int数组，也可创建一个String数组，或者甚至于可以是任何其他 Swift 的类型数据数组。同样的，你也可以创建存储任何指定类型的字典（dictionary），而且这些类型可以是没有限制的。
*/
 
/**
 非泛型函数swapTwoInts,用来交换两个Int值
*/
func swapTowInts(inout a: Int, inout b: Int) {
    let temp = a
    a = b
    b = temp
}

var i = 3
var j = 10
swapTowInts(&i, b: &j)
print("i = \(i), j = \(j)")

/**
*  泛型函数可以工作于任何类型，这里是一个上面swapTwoInts函数的泛型版本，用于交换两个值：
*/

func swapTwoValues<T>(inout a: T, inout b: T) {
    let temp = a
    a = b
    b = temp
}

swapTwoValues(&i, b: &j)
print("i = \(i), j = \(j)")
/**
*  泛型类型
    通常在泛型函数中，Swift 允许你定义你自己的泛型类型。这些自定义类、结构体和枚举作用于任何类型，
    如同Array和Dictionary的用法。
    这里展示了如何写一个非泛型版本的栈，Int值型的栈：
*/
struct IntStack {
    var items: [Int]
    
    mutating func push(item: Int) {
        items.append(item)
    }
    
    mutating func pop() -> Int {
        return items.removeLast()
    }
    
    init(items: [Int]) {
        self.items = items
    }
}

/// 结构体也同一般类一样, 也可以有init方法
var s: IntStack = IntStack(items: [1, 2])
s.push(1)
print(s.items)


/**
*  这里是一个相同代码的泛型版本：
*/
struct Stack<T> {
    var items = [T]()
    
    mutating func push(item: T) {
        items.append(item)
    }
    mutating func pop() -> T {
        return items.removeLast()
    }
}

func repeatItem<Item>(item:Item, numberOfTimes: Int) -> [Item] {
    var result = [Item]()
    
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    
    return result
}
var a = repeatItem("knock", numberOfTimes: 4)

for i in 0..<a.count {
    print(a[i])
}

enum OptionalValue<Wrapped> {
    case None
    case Some(Wrapped)
}

/// You can make generic forms of functions and methods, as well as classes, enumerations, and structures.
// Reimplement the Swift standard library's optional type

var possibleInteger: OptionalValue<Int> = .None
possibleInteger = .Some(100)

/**
*  Use where after the type name to specify a list of requirements—for example, to require the type to implement a protocol, to require two types to be the same, or to require a class to have a particular superclass.
*/

func anyCommontElements <T: SequenceType, U: SequenceType where T.Generator.Element: Equatable, T.Generator.Element == U.Generator.Element>(lhs: T, _ rhs: U) -> Bool{
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }
    
    return false
}

/**
*  在 Swift 中，有一个非常有用的操作符，可以用来快速地对 nil 进行条件判断，那就是 ??。这个操作符可以判断输入并在当左侧的值是非 nil 的 Optional 值时返回其 value，当左侧是 nil 时返回右侧的值，
*/
var level: Int?
var startlevel = 1
var currentLevel = level ?? startlevel

func ??<T>(optional: T?, @autoclosure defaultValue: () -> T) -> T {
    switch optional {
    case .Some(let value):
        return value
    case .None:
        return defaultValue()
    }
}





