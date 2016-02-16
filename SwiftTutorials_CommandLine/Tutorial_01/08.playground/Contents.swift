//: Playground - noun: a place where people can play

import UIKit

/**
 *  Protocols and Extensions
 */

protocol ExampleProtocol {
    var simpleDescription: String { get }   /// 只读
    mutating func adjust()
}

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




