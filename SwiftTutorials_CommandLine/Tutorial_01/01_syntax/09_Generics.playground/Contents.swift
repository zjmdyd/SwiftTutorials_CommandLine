//: Playground - noun: a place where people can play

import UIKit

/** Generics (泛型)
 *
 *  Write a name inside angle brackets to make a generic function or type.
 *  泛型是 Swift 强大特征中的其中一个，许多 Swift 标准库是通过泛型代码构建出来的。事实上，泛型的使用贯穿了整本语言手册，只是你没有发现而已。例如，Swift 的数组和字典类型都是泛型集。你可以创建一个Int数组，也可创建一个String数组，或者甚至于可以是任何其他 Swift 的类型数据数组。同样的，你也可以创建存储任何指定类型的字典（dictionary），而且这些类型可以是没有限制的。
 */

func makeArray<Item>(item: Item, numberOfTimes: Int) -> [Item] {
    var result = [Item]()
    
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    
    return result;
}

makeArray(item: 1, numberOfTimes: 4)
makeArray(item: "knock", numberOfTimes: 4)

/**
 *  You can make generic forms of functions and methods, as well as classes, enumerations, and structures.
 */
enum OptionalValue<Wrapped> {
    case none
    case some(Wrapped)
}

var possibleInteger: OptionalValue<Int> = .none 
possibleInteger = .some(100)


/** 类型约束 和 泛型语法类似
 *  Use where after the type name to specify a list of requirements—for example, to require the type to implement a protocol, to require two types to be the same, or to require a class to have a particular superclass.     public static func ==(lhs: Self, rhs: Self) -> Bool

 */

func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool
    where T.Iterator.Element: Equatable, T.Iterator.Element == U.Iterator.Element {
        for lhsItem in lhs {
            for rhsItem in rhs {
                if lhsItem == rhsItem {
                    return true
                }
            }
        }
    return false
}
//func anyCommonElements <T: SequenceType, U: SequenceType where T.Generator.Element: Equatable, T.Generator.Element == U.Generator.Element>(lhs: T, _ rhs: U) -> Bool {
//    for lhsItem in lhs {
//        for rhsItem in rhs {
//            if lhsItem == rhsItem {
//                return true
//            }
//        }
//    }
//    
//    return false
//}
/**
 函数的类型参数列紧随在两个类型参数需求的后面：
 T必须遵循SequenceType协议 (写作 T: SequenceType)。
 U必须遵循SequenceType协议 (写作 U: SequenceType)。
 U的Element必须遵循Equatable协议 (写作 T.Generator.Element: Equatable)。
 T的Element等于U的Element
 第三个和第四个要求被定义为一个where语句的一部分，写在关键字where后面，作为函数类型参数链的一部分。
 */
anyCommonElements([1, 2, 3], [3])


/**
 非泛型函数swapTwoInts,用来交换两个Int值
 */
func swapTowInts(a: inout Int, b: inout Int) {
    let temp = a
    a = b
    b = temp
}

var i = 3
var j = 10
swapTowInts(a: &i, b: &j)
print("i = \(i), j = \(j)")

/**
 *  泛型函数可以工作于任何类型，这里是一个上面swapTwoInts函数的泛型版本，用于交换两个值：
 */

func swapTwoValues<T>(a: inout T, b: inout T) {
    let temp = a
    a = b
    b = temp
}

swapTwoValues(a: &i, b: &j)
print("i = \(i), j = \(j)")

var str1 = "aa"
var str2 = "bb"
swapTwoValues(a: &str1, b: &str2)
print("str1 = \(str1), str2 = \(str2)")

/**
 *
 通常在泛型函数中，Swift 允许你定义你自己的泛型类型。这些自定义类、结构体和枚举作用于任何类型，
 如同Array和Dictionary的用法。
 这里展示了如何写一个非泛型版本的栈，Int值型的栈(先进后出)：
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
s.push(item: 3)
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
var s2 = Stack<Int>(items: [1, 2])
print(s2.items)
s2.pop()
print(s2.items)

/**
 扩展一个泛型类型
 当你扩展一个泛型类型的时候，你并不需要在扩展的定义中提供类型参数列表。原始类型定义中声明的类型参数列表在扩展中可以直接使用，并且这些来自原始类型中的参数名称会被用作原始定义中类型参数的引用。
 
 下面的例子扩展了泛型类型 Stack，为其添加了一个名为 topItem 的只读计算型属性，它将会返回当前栈顶端的元素而不会将其从栈中移除：
 */
extension Stack {
    var topItem: T? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
}

/**
 *  在 Swift 中，有一个非常有用的操作符，可以用来快速地对 nil 进行条件判断，那就是 ??。这个操作符可以判断输入并在当左侧的值是非 nil 的 Optional 值时返回其 value，当左侧是 nil 时返回右侧的值，
 */
var level: Int? = 2
var startlevel = 1
var currentLevel = level ?? startlevel

func ??<T>(optional: T?, defaultValue: @autoclosure () -> T) -> T {
    switch optional {
    case .some(let value):
        return value
    case .none:
        return defaultValue()
    }
}

/*
func allItemsMatch<
    C1: Container, C2: Container
    where C1.ItemType == C2.ItemType, C1.ItemType: Equatable>
    (someContainer: C1, anotherContainer: C2) -> Bool {
    
    // check that both containers contain the same number of items
    if someContainer.count != anotherContainer.count {
        return false
    }
    
    // check each pair of items to see if they are equivalent
    for i in 0..someContainer.count {
        if someContainer[i] != anotherContainer[i] {
            return false
        }
    }
    
    // all items match, so return true
    return true
}

var stackOfStrings = Stack<String>()
stackOfStrings.push("uno")
stackOfStrings.push("dos")
stackOfStrings.push("tres")

var arrayOfStrings = ["uno", "dos", "tres"]

if allItemsMatch(stackOfStrings, arrayOfStrings) {
    println("All items match.")
} else {
    println("Not all items match.")
}
// 输出 "All items match."
上面的例子创建一个Stack单例来存储String，然后压了三个字符串进栈。这个例子也创建了一个Array单例，并初始化包含三个同栈里一样的原始字符串。即便栈和数组否是不同的类型，但它们都遵循Container协议，而且它们都包含同样的类型值。你因此可以调用allItemsMatch函数，用这两个容器作为它的参数。在上面的例子中，allItemsMatch函数正确的显示了所有的这两个容器的items匹配。
*/
