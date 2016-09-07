//: Playground - noun: a place where people can play

import UIKit

/**
 *  Protocols and Extensions
 */

///Use protocol to declare a protocol.
protocol ExampleProtocol {
    var simpleDescription: String { get }   /// 只读
    mutating func adjust()
}
 /// Classes, enumerations, and structs can all adopt protocols.
class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class"
    var anotherProperty = 1024
    
    func adjust() {
        simpleDescription += " Now 100% adjusted."
    }
}
var a = SimpleClass()
a.simpleDescription
a.adjust()
a.simpleDescription

struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}

var b = SimpleStructure()
b.adjust()
b.simpleDescription
/**
 *  Notice the use of the mutating keyword in the declaration of SimpleStructure to mark a method that modifies the structure. The declaration of SimpleClass doesn’t need any of its methods marked as mutating because methods on a class can always modify the class.
 */


/** Extension ****** 扩展
 *  Use extension to add functionality to an existing type, such as new methods and computed properties. You can use an extension to add protocol conformance to a type that is declared elsewhere, or even to a type that you imported from a library or framework.
 */
// MARK: - Extensions may not contain stored properties
extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number is \(self)"
    }
    mutating func adjust() {
        self += 1
    }
}
999.simpleDescription
var i = 999
i.adjust()  // 不能使用999直接调用,因为999是常量

/**
 *  You can use a protocol name just like any other named type—for example, to create a collection of objects that have different types but that all conform to a single protocol. When you work with values whose type is a protocol type, methods outside the protocol definition are not available.
 */
let protocolVale: ExampleProtocol = a
protocolVale.simpleDescription
//protocolVale.anotherProperty    // value of type 'ExampleProtocol' has no menber 'anotherProperty'
/**
 Even though the variable protocolValue has a runtime type of SimpleClass, the compiler treats it as the given type of ExampleProtocol. This means that you can’t accidentally access methods or properties that the class implements in addition to its protocol conformance.
 */


/**
 *  当某个类含有父类的同时并实现了协议，应当把父类放在所有的协议之前，如下所示：
 class SomeClass: SomeSuperClass, FirstProtocol, AnotherProtocol {
 // 类的内容
 }
 
 属性要求
 协议能够要求其遵循者必须含有一些特定名称和类型的实例属性(instance property)或类属性 (type property)，也能够要求属性的(设置权限)settable 和(访问权限)gettable，但它不要求属性是存储型属性(stored property)还是计算型属性(calculate property)。
 
 通常前置var关键字将属性声明为变量。在属性声明后写上{ get set }表示属性为可读写的。{ get }用来表示属性为可读的。即使你为可读的属性实现了setter方法，它也不会出错。
 */

protocol FullyNamed {
    var fullName: String { get }
}

struct Person: FullyNamed {
    var fullName: String
}
let john = Person(fullName: "john Appleseed")

/**
 *  方法要求
 协议能够要求其遵循者必备某些特定的实例方法和类方法。协议方法的声明与普通方法声明相似，但它不需要方法内容。
 
 前置class关键字表示协议中的成员为类成员；当协议用于被枚举或结构体遵循时，则使用static关键字。如下所示：
 */

