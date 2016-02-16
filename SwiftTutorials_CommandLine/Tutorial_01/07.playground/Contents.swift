//: Playground - noun: a place where people can play

import UIKit

/**
*  Protocols and Extensions
*/

protocol ExampleProtocol {
    var simpleDescription: String { get }   /// 只读
    mutating func adjust()
}

/// Classes, enumerations, and structs can all adopt protocols.
/**
 *  类
 */
class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class"
    var anotherProperty: Int = 69105
    
    func adjust() {
        simpleDescription += "  Now 100% adjusted."
    }
}

var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription

/**
 *  结构体
 */
struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A very simple structure"
    mutating func adjust() {
        simpleDescription += " (adjust)"
    }
}

var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription

/**
*  Notice the use of the mutating keyword in the declaration of SimpleStructure to mark a method that modifies the structure. The declaration of SimpleClass doesn’t need any of its methods marked as mutating because methods on a class can always modify the class.
*/

/**
*  Use extension to add functionality to an existing type, such as new methods and computed properties. You can use an extension to add protocol conformance to a type that is declared elsewhere, or even to a type that you imported from a library or framework.
*/
extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    
    mutating func adjust() {
        self += 42
    }
}

var i = 7
print(7.simpleDescription)
i.adjust()
print(i.simpleDescription)

/**
*  You can use a protocol name just like any other named type—for example, to create a collection of objects that have different types but that all conform to a single protocol. When you work with values whose type is a protocol type, methods outside the protocol definition are not available.
*/
let protocalValue: ExampleProtocol = a
print(protocalValue.simpleDescription)
//print(protocolValue.anotherProperty)  // Uncomment to see the error
/**
*   Even though the variable protocolValue has a runtime type of SimpleClass, the compiler treats it as the given type of ExampleProtocol.
/// This means that you can’t accidentally access methods or properties that the class implements in addition to its protocol conformance.
*/











