//: Playground - noun: a place where people can play

import UIKit

/**
*  Objects and Classes:
*   Use class followed by the class’s name to create a class. A property declaration in a class is written the same way as a constant or variable declaration, except that it is in the context of a class. Likewise, method and function declarations are written the same way.
*
*/
class Shape {
    var numberOfSides = 0
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides"
    }
}
/**
*  Create an instance of a class by putting parentheses after the class name. Use dot syntax to access the properties and methods of the instance.
*/
var shape = Shape()
shape.numberOfSides = 7

var shapeDescription = shape.simpleDescription()

/**
*  This version of the Shape class is missing something important: an initializer to set up the class when an instance is created. Use init to create one.
*/

class NameShape {
    var numberOfSides: Int = 0
    var name: String
    
    init(name: String) {
        self.name = name;
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}
/**
 Notice how self is used to distinguish the name property from the name argument to the initializer. The arguments to the initializer are passed like a function call when you create an instance of the class. 
 /// Every property needs a value assigned—either in its declaration (as with numberOfSides) or in the initializer (as with name).
 
 Use deinit to create a deinitializer if you need to perform some cleanup before the object is deallocated.
 
 Subclasses include their superclass name after their class name, separated by a colon(冒号). There is no requirement for classes to subclass any standard root class, so you can include or omit a superclass as needed.
 
 Methods on a subclass that override the superclass’s implementation are marked with override—overriding a method by accident, without override, is detected by the compiler as an error. The compiler also detects methods with override that don’t actually override any method in the superclass.
*/
class Square: NameShape {
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength;
        super.init(name: name)
        numberOfSides = 4;
    }
    
    func area() -> Double {
        return sideLength * sideLength;
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
}

let test = Square(sideLength: 5.2, name: "my test square")
test.area()
test.simpleDescription()

/**
*  In addition to simple properties that are stored, properties can have a getter and a setter.
*/

class EquilateralTriangle: NameShape {
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    /// 周长
    var perimeter: Double {
        get{
            return 3.0 * sideLength
        }
        
        set {
            sideLength = newValue / 3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
}

var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print(triangle.perimeter)
triangle.perimeter = 9.9
print(triangle.sideLength)

/**
 *** Notice that the initializer for the EquilateralTriangle class has three different steps:

    Setting the value of properties that the subclass declares.
    Calling the superclass’s initializer.
    Changing the value of properties defined by the superclass. Any additional setup work that uses methods, getters, or setters can also be done at this point.
*/
 
/**
If you don’t need to compute the property but still need to provide code that is run before and after setting a new value, use willSet and didSet. The code you provide is run any time the value changes outside of an initializer. 
/// For example, the class below ensures that the side length of its triangle is always the same as the side length of its square.
*/
class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    
    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}
/**
    Swift - 属性观察者（willSet与didSet）
*  属性观察者，类似于触发器。用来监视属性的除初始化之外的属性值变化，当属性值发生改变时可以对此作出响应。有如下特点：
1，不仅可以在属性值改变后触发didSet，也可以在属性值改变前触发willSet。
2，给属性添加观察者必须要声明清楚属性类型，否则编译器报错。
3，willSet可以带一个newName的参数，没有的话，该参数默认命名为newValue。
4，didSet可以带一个oldName的参数，表示旧的属性，不带的话默认命名为oldValue。
5，属性初始化时，willSet和didSet不会调用。只有在初始化上下文之外，当设置属性值时才会调用。
6，即使是设置的值和原来值相同，willSet和didSet也会被调用
*/

/**
*  When working with optional values, you can write ? before operations like methods, properties, and subscripting. If the value before the ? is nil, everything after the ? is ignored and the value of the whole expression is nil. Otherwise, the optional value is unwrapped, and everything after the ? acts on the unwrapped value. In both cases, the value of the whole expression is an optional value.
*/
let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
let sideLength = optionalSquare!.sideLength



