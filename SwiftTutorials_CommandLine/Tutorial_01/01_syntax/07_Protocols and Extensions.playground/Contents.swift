//: Playground - noun: a place where people can play

import UIKit

/**
 *  Protocols and Extensions
 */

///Use protocol to declare a protocol.
protocol ExampleProtocol {
    var simpleDescription: String { get }   /// 只读， 实现者可以是只读 也可以是可读可写
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
b.simpleDescription
b.adjust()
b.simpleDescription
/**
 *  Notice the use of the mutating keyword in the declaration of SimpleStructure to mark a method that modifies the structure. The declaration of SimpleClass doesn’t need any of its methods marked as mutating because methods on a class can always modify the class.
 
 “Structures and enumerations are value types. By default, the properties of a value type cannot be modified from within its instance methods.
 结构体和枚举是值类型,一般情况下属性值不能通过方法来修改,除非该方法用mutating来修饰
 在值类型（即结构体和枚举）的实例方法中，将 mutating 关键字作为方法的前缀，写在 func 关键字之前，表示可以在该方法中修改它所属的实例以及实例的任意属性的值
 */


/** Extension ****** 扩展
 *  Use extension to add functionality to an existing type, such as new methods and computed properties. You can use an extension to add protocol conformance to a type that is declared elsewhere, or even to a type that you imported from a library or framework.
 */
// MARK: - Extensions may not contain stored properties,扩展只能扩展方法不能增加属性
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
i.adjust()  // 不能使用999直接调用,因为999是常量，不可变
i.simpleDescription
/**
 *  You can use a protocol name just like any other named type—for example, to create a collection of objects that have different types but that all conform to a single protocol. When you work with values whose type is a protocol type, methods outside the protocol definition are not available.
 */
let protocolVale: ExampleProtocol = a
protocolVale.simpleDescription
(protocolVale as? SimpleClass)?.anotherProperty
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
 
 在协议中定义 类型属性(静态变量) 时，总是使用static 关键字作为前缀。当类类型采纳协议时，除了 static 关键字，还可以使用 class 关键字来声明类型属性：
 */

protocol AnotherProtocol {
    static var someTypeProperty: Int { get set }
}
//
class TestP: AnotherProtocol {
    static var someTypeProperty: Int = 0
}

TestP.someTypeProperty

protocol FullyNamed {
    var fullName: String { get }
}

struct Person: FullyNamed {
    var fullName: String
}
var john = Person(fullName: "john Appleseed")
john.fullName = "john full name"
print(john.fullName)

// 其实协议中的“只读”属性修饰的是协议这种“类型“”的实例
var john2: FullyNamed = john
// john2.fullName = "john2 full name" // 报错


class Starship: FullyNamed {
    var prefix: String?
    var name: String
    
    init(name: String, prefix: String?) {
        self.name = name
        self.prefix = prefix
    }
    
    var fullName: String {
        return(prefix != nil ? prefix! + " " : "") + name
    }
}
var ncc1701 = Starship(name: "Enterprise", prefix: "USS")
ncc1701.fullName


/**
 *  方法要求
 协议可以要求采纳协议的类型实现某些指定的实例方法或类方法。这些方法作为协议的一部分，像普通方法一样放在协议的定义中，但是不需要大括号和方法体。可以在协议中定义具有可变参数的方法，和普通方法的定义方式相同。但是，不支持为协议中的方法的参数提供默认值。
 
 正如属性要求中所述，在协议中定义 类方法(静态方法) 的时候，总是使用 static 关键字作为前缀。当类类型采纳协议时，除了 static 关键字，还可以使用 class 关键字作为前缀：
 */

protocol SomeProtocol {
    static func someTypeMethod()
}

class Test: SomeProtocol {
    static func someTypeMethod() {
        print("haha")
    }
}

Test.someTypeMethod()
var tt = Test()


// 下面的例子定义了一个只含有一个实例方法的协议：
protocol RandomNumberGenerator {
    func random() -> Double
}
/**
 RandomNumberGenerator 协议要求采纳协议的类型必须拥有一个名为 random， 返回值类型为 Double 的实例方法。尽管这里并未指明，但是我们假设返回值在 [0.0,1.0) 区间内。
 RandomNumberGenerator 协议并不关心每一个随机数是怎样生成的，它只要求必须提供一个随机数生成器。
 如下所示，下边是一个采纳并符合 RandomNumberGenerator 协议的类。该类实现了一个叫做 线性同余生成器（linear congruential generator） 的伪随机数算法。
 */
class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        lastRandom = lastRandom * a + c
        lastRandom = Double(Int(lastRandom) % Int(m))
        return lastRandom / m
    }
}

/**
 Mutating 方法要求
 
 有时需要在方法中改变方法所属的实例。例如，在值类型（即结构体和枚举）的实例方法中，将 mutating 关键字作为方法的前缀，写在 func 关键字之前，表示可以在该方法中修改它所属的实例以及实例的任意属性的值。这一过程在在实例方法中修改值类型章节中有详细描述。
 如果你在协议中定义了一个实例方法，该方法会改变采纳该协议的类型的实例，那么在定义协议时需要在方法前加 mutating 关键字。这使得结构体和枚举能够采纳此协议并满足此方法要求。
 **/

protocol Togglable {
    mutating func toggle()
}

enum OnOffSwitch: Togglable {
    case Off, On
    mutating func toggle() {
        switch self {
        case .Off:
            self = .On
        case .On:
            self = .Off
        }
    }
}
var lightSwitch = OnOffSwitch.Off
lightSwitch.toggle()

/*
 注意
 实现协议中的 mutating 方法时，若是类类型，则不用写 mutating 关键字。而对于结构体和枚举，则必须写 mutating 关键字。
 */
class OnOffSwitchClass: Togglable {
    var open = false
    
    func toggle() {
        if self.open {
            self.open = false
        }else {
            self.open = true
        }
    }
}
var lightSwitch2 = OnOffSwitchClass()
lightSwitch2.toggle()

/**
 构造器要求
 协议可以要求采纳协议的类型实现指定的构造器。你可以像编写普通构造器那样，在协议的定义里写下构造器的声明，但不需要写花括号和构造器的实体：
 */
protocol SomeProtocol2 {
    init(someParameter: Int)
}
/**
 构造器要求在类中的实现
 
 你可以在采纳协议的类中实现构造器，无论是作为指定构造器，还是作为便利构造器。无论哪种情况，你都必须为构造器实现标上 required 修饰符：
 使用 required 修饰符可以确保所有子类也必须提供此构造器实现，从而也能符合协议。
 如果类已经被标记为 final，那么不需要在协议构造器的实现中使用 required 修饰符，因为 final 类不能有子类。
 */
class SomeClass: SomeProtocol2 {
    required init(someParameter: Int) {
        //  这里是构造器的实现部分
    }
}

class Dice {
    let sides: Int
    let generator: RandomNumberGenerator
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}

var d6 = Dice(sides: 6, generator: LinearCongruentialGenerator())
for _ in 1...5 {
    print("Random dice roll is \(d6.roll())")
}

/**
 委托（代理）模式
 委托是一种设计模式，它允许类或结构体将一些需要它们负责的功能委托给其他类型的实例。委托模式的实现很简单：定义协议来封装那些需要被委托的功能，这样就能确保采纳协议的类型能提供这些功能。委托模式可以用来响应特定的动作，或者接收外部数据源提供的数据，而无需关心外部数据源的类型。
 */
protocol DiceGame {
    var dice: Dice { get }
    func play()
}

protocol DiceGameDelegate {
    func gameDidStart(game: DiceGame);
    func game(game: DiceGame, didStartNewTurnWithDiceRoll diceRoll:Int)
    func gameDidEnd(game: DiceGame);
}
/**
 DiceGame 协议可以被任意涉及骰子的游戏采纳。DiceGameDelegate 协议可以被任意类型采纳，用来追踪 DiceGame 的游戏过程。
 
 如下所示，SnakesAndLadders 是 控制流 章节引入的蛇梯棋游戏的新版本。新版本使用 Dice 实例作为骰子，并且实现了 DiceGame 和 DiceGameDelegate 协议，后者用来记录游戏的过程：
 */
class SnakesAndLadders: DiceGame {
    let finalSquare = 25
    let dice = Dice(sides: 6, generator: LinearCongruentialGenerator())
    var square = 0
    var board: [Int]
    init() {
        board = [Int](repeating: 0, count: finalSquare + 1)
        board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
        board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
    }
    var delegate: DiceGameDelegate?
    
    func play() -> Void {
        square = 0
        delegate?.gameDidStart(game: self)
        gameLoop: while square != finalSquare {
            let diceRoll = dice.roll()
            delegate?.game(game: self, didStartNewTurnWithDiceRoll: diceRoll)
            switch square + diceRoll {
            case finalSquare:
                break gameLoop
            case let newSquare where newSquare > finalSquare:
                continue
            default:
                square += diceRoll
                square += board[square]
            }
        }
        delegate?.gameDidEnd(game: self)
    }
}
/**
 这个版本的游戏封装到了 SnakesAndLadders 类中，该类采纳了 DiceGame 协议，并且提供了相应的可读的 dice 属性和 play() 方法。（ dice 属性在构造之后就不再改变，且协议只要求 dice 为可读的，因此将 dice 声明为常量属性。）
 
 游戏使用 SnakesAndLadders 类的 init() 构造器来初始化游戏。所有的游戏逻辑被转移到了协议中的 play() 方法，play() 方法使用协议要求的 dice 属性提供骰子摇出的值。
 注意，delegate 并不是游戏的必备条件，因此 delegate 被定义为 DiceGameDelegate 类型的可选属性。因为 delegate 是可选值，因此会被自动赋予初始值 nil。随后，可以在游戏中为 delegate 设置适当的值。
 
 DicegameDelegate 协议提供了三个方法用来追踪游戏过程。这三个方法被放置于游戏的逻辑中，即 play() 方法内。分别在游戏开始时，新一轮开始时，以及游戏结束时被调用。
 
 因为 delegate 是一个 DiceGameDelegate 类型的可选属性，因此在 play() 方法中通过可选链式调用来调用它的方法。若 delegate 属性为 nil，则调用方法会优雅地失败，并不会产生错误。若 delegate 不为 nil，则方法能够被调用，并传递 SnakesAndLadders 实例作为参数。
 
 如下示例定义了 DiceGameTracker 类，它采纳了 DiceGameDelegate 协议：
 */
class DiceGameTracker: DiceGameDelegate {
    var numberOfTurns = 0
    func gameDidStart(game: DiceGame) {
        numberOfTurns = 0
        if game is SnakesAndLadders {
            print("Started a new game of Snakes and Ladders")
        }
        print("The game is using a \(game.dice.sides)-sided dice")
    }
    
    func game(game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int) {
        numberOfTurns += 1
        print("Rolled a \(diceRoll)")
    }
    func gameDidEnd(game: DiceGame) {
        print("The game lasted for \(numberOfTurns) turns")
    }
}
/**
 DiceGameTracker 实现了 DiceGameDelegate 协议要求的三个方法，用来记录游戏已经进行的轮数。当游戏开始时，numberOfTurns 属性被赋值为 0，然后在每新一轮中递增，游戏结束后，打印游戏的总轮数。
 
 gameDidStart(_:) 方法从 game 参数获取游戏信息并打印。game 参数是 DiceGame 类型而不是 SnakeAndLadders 类型，所以在方法中只能访问 DiceGame 协议中的内容。当然了，SnakeAndLadders 的方法也可以在类型转换之后调用。在上例代码中，通过 is 操作符检查 game 是否为 SnakesAndLadders 类型的实例，如果是，则打印出相应的消息。
 无论当前进行的是何种游戏，由于 game 符合 DiceGame 协议，可以确保 game 含有 dice 属性。因此在 gameDidStart(_:) 方法中可以通过传入的 game 参数来访问 dice 属性，进而打印出 dice 的 sides 属性的值。
*/

let tracker = DiceGameTracker()
let game = SnakesAndLadders()
game.delegate = tracker
game.play()

/**
 通过扩展添加协议一致性
 即便无法修改源代码，依然可以通过扩展令已有类型采纳并符合协议
 注意
 通过扩展令已有类型采纳并符合协议时，该类型的所有实例也会随之获得协议中定义的各项功能。
 例如下面这个 TextRepresentable 协议，任何想要通过文本表示一些内容的类型都可以实现该协议。这些想要表示的内容可以是实例本身的描述，也可以是实例当前状态的文本描述：
 */
protocol TextRepresentable {
    var textualDescription: String { get }
}
/// 可以通过扩展，令先前提到的 Dice 类采纳并符合 TextRepresentable 协议：
extension Dice: TextRepresentable {
    var textualDescription: String {
        return "A \(sides)-sided dice"
    }
}
let d12 = Dice(sides: 12, generator: LinearCongruentialGenerator())
d12.textualDescription

/**
 通过扩展采纳协议
 当一个类型已经符合了某个协议中的所有要求，却还没有声明采纳该协议时，可以通过空扩展体的扩展来采纳该协议：
 */
struct Hamster {
    var name: String
    var textualDescription: String {
        return "A hamster named \(name)"
    }
}
/**
 注意
 即使满足了协议的所有要求，类型也不会自动采纳协议，必须显式地采纳协议。
 */
extension Hamster: TextRepresentable { } /// 从现在起，Hamster 的实例可以作为 TextRepresentable 类型使用：

let simonTheHamster = Hamster(name: "Simon")
simonTheHamster.textualDescription

let somethingTextRepresentable: TextRepresentable = simonTheHamster
somethingTextRepresentable.textualDescription

/**
 协议的继承
 协议能够继承一个或多个其他协议，可以在继承的协议的基础上增加新的要求。协议的继承语法与类的继承相似，多个被继承的协议间用逗号分隔：
 */
protocol InheritingProtocol: SomeProtocol, AnotherProtocol {
    // 这里是协议的定义部分
}

/// 如下所示，PrettyTextRepresentable 协议继承了 TextRepresentable 协议：
protocol PrettyTextRepresentable: TextRepresentable {
    var prettyTextualDescription: String { get }
}

extension SnakesAndLadders: PrettyTextRepresentable {
    var textualDescription: String {
        return ""
    }

    var prettyTextualDescription: String {
        var output = textualDescription + ":\n"
        for index in 1...finalSquare {
            switch board[index] {
            case let ladder where ladder > 0:
                output += "▲ "
            case let snake where snake < 0:
                output += "▼ "
            default:
                output += "○ "
            }
        }
        return output
    }
}
print(game.prettyTextualDescription)

/**
 类类型专属协议
 你可以在协议的继承列表中，通过添加 class 关键字来限制协议只能被类类型采纳，而结构体或枚举不能采纳该协议。class 关键字必须第一个出现在协议的继承列表中，在其他继承的协议之前：
 */
protocol SomeClassOnlyProtocol: class, InheritingProtocol {
    // 这里是类类型专属协议的定义部分
}
/**
 在以上例子中，协议 SomeClassOnlyProtocol 只能被类类型采纳。如果尝试让结构体或枚举类型采纳该协议，则会导致编译错误。
 
 注意
 当协议定义的要求需要采纳协议的类型必须是引用语义而非值语义时，应该采用类类型专属协议。关于引用语义和值语义的更多内容，请查看结构体和枚举是值类型和类是引用类型。
 */

/**
 协议合成
 有时候需要同时采纳多个协议，你可以将多个协议采用 SomeProtocol & AnotherProtocol 这样的格式进行组合，称为 协议合成（protocol composition）。你可以罗列任意多个你想要采纳的协议，以与符号(&)分隔。
 
 下面的例子中，将 Named 和 Aged 两个协议按照上述语法组合成一个协议，作为函数参数的类型：
 */
protocol Named {
    var name: String { get }
}
protocol Aged {
    var age: Int { get }
}
struct Person2: Named, Aged {
    var name: String
    var age: Int
}
func wishHappyBirthday(to celebrator: Named & Aged) {
    print("Happy birthday, \(celebrator.name), you're \(celebrator.age)")
}
let birthdayPerson = Person2(name: "martin", age: 22)
wishHappyBirthday(to: birthdayPerson)

/**
 wishHappyBirthday(_:) 函数的参数 celebrator 的类型为 Named & Aged。这意味着它不关心参数的具体类型，只要参数符合这两个协议即可。
 注意
 协议合成并不会生成新的、永久的协议类型，而是将多个协议中的要求合成到一个只在局部作用域有效的临时协议中。
 */

/**
 检查协议一致性
 你可以使用类型转换中描述的 is 和 as 操作符来检查协议一致性，即是否符合某协议，并且可以转换到指定的协议类型。检查和转换到某个协议类型在语法上和类型的检查和转换完全相同：
 
 is 用来检查实例是否符合某个协议，若符合则返回 true，否则返回 false。
 as? 返回一个可选值，当实例符合某个协议时，返回类型为协议类型的可选值，否则返回 nil。
 as! 将实例强制向下转换到某个协议类型，如果强转失败，会引发运行时错误。
 下面的例子定义了一个 HasArea 协议，该协议定义了一个 Double 类型的可读属性 area：
 */
protocol HasArea {
    var area: Double { get }
}

/// 如下所示，Circle 类和 Country 类都采纳了 HasArea 协议：
class Circle: HasArea {
    let pi = 3.1415927
    var radius: Double
    var area: Double { return pi * radius * radius }
    init (radius: Double) {
        self.radius = radius
    }
}
class Country: HasArea {
    var area: Double
    init(area: Double) {
        self.area = area
    }
}
/**
 Circle 类把 area 属性实现为基于存储型属性 radius 的计算型属性。Country 类则把 area 属性实现为存储型属性。这两个类都正确地符合了 HasArea 协议。
 
 如下所示，Animal 是一个未采纳 HasArea 协议的类：
 */
class Animal {
    var legs: Int
    init(legs: Int) {
        self.legs = legs
    }
}
/**
 Circle，Country，Animal 并没有一个共同的基类，尽管如此，它们都是类，它们的实例都可以作为 AnyObject 类型的值，存储在同一个数组中：
 */
let objects: [AnyObject] = [
    Circle(radius: 2.0),
    Country(area: 243_610),
    Animal(legs: 4)
]
/**
 如下所示，objects 数组可以被迭代，并对迭代出的每一个元素进行检查，看它是否符合 HasArea 协议：
 */
for object in objects {
    if let objectWithArea = object as? HasArea {
        print("Area is \(objectWithArea.area)")
    }else {
        print("Something that doesn't have an area")
    }
    if object is HasArea {
        print(object)
    }else {
        // object as! HasArea  // Could not cast value of type 'Animal'to 'HasArea'.
    }
}

/**
 可选的协议要求
 协议可以定义可选要求，采纳协议的类型可以选择是否实现这些要求。在协议中使用 optional 关键字作为前缀来定义可选要求。使用可选要求时（例如，可选的方法或者属性），它们的类型会自动变成可选的。比如，一个类型为 (Int) -> String 的方法会变成 ((Int) -> String)?。需要注意的是整个函数类型是可选的，而不是函数的返回值。
 协议中的可选要求可通过可选链式调用来使用，因为采纳协议的类型可能没有实现这些可选要求。类似 someOptionalMethod?(someArgument) 这样，你可以在可选方法名称后加上 ? 来调用可选方法。
 
 注意
 可选的协议要求只能用在标记 @objc 特性的协议中。
 该特性表示协议将暴露给 Objective-C 代码，详情参见Using Swift with Cocoa and Objective-C(Swift 2.2)。即使你不打算和 Objective-C 有什么交互，如果你想要指定可选的协议要求，那么还是要为协议加上 @objc 特性。
 还需要注意的是，标记 @objc 特性的协议只能被继承自 Objective-C 类的类或者 @objc 类采纳，其他类以及结构体和枚举均不能采纳这种协议。

 下面的例子定义了一个名为 Counter 的用于整数计数的类，它使用外部的数据源来提供每次的增量。数据源由 CounterDataSource 协议定义，包含两个可选要求：
 */
@objc protocol CounterDataSource {
    @objc optional func incrementForCount(count: Int) -> Int
    @objc optional var fixedIncrement: Int { get }
}
/**
 CounterDataSource 协议定义了一个可选方法 incrementForCount(_:) 和一个可选属性 fiexdIncrement，它们使用了不同的方法来从数据源中获取适当的增量值。
 
 注意
 严格来讲，CounterDataSource 协议中的方法和属性都是可选的，因此采纳协议的类可以不实现这些要求，尽管技术上允许这样做，不过最好不要这样写。
 */
class Counter {
    var count = 0
    var dataSource: CounterDataSource?
    func increment() -> Void {
        if let amount = dataSource?.incrementForCount?(count: count) {
            count += amount
        }else if let amount = dataSource?.fixedIncrement {
            count += amount
        }
    }
}
/**
 Counter 类使用变量属性 count 来存储当前值。该类还定义了一个 increment() 方法，每次调用该方法的时候，将会增加 count 的值。
 increment() 方法首先试图使用 incrementForCount(_:) 方法来得到每次的增量。increment() 方法使用可选链式调用来尝试调用 incrementForCount(_:)，并将当前的 count 值作为参数传入。
 
 这里使用了两层可选链式调用。首先，由于 dataSource 可能为 nil，因此在 dataSource 后边加上了 ?，以此表明只在 dataSource 非空时才去调用 incrementForCount(_:) 方法。其次，即使 dataSource 存在，也无法保证其是否实现了 incrementForCount(_:) 方法，因为这个方法是可选的。因此，incrementForCount(_:) 方法同样使用可选链式调用进行调用，只有在该方法被实现的情况下才能调用它，所以在 incrementForCount(_:) 方法后边也加上了 ?。
 
调用 incrementForCount(_:) 方法在上述两种情形下都有可能失败，所以返回值为 Int? 类型。虽然在 CounterDataSource 协议中，incrementForCount(_:) 的返回值类型是非可选 Int。另外，即使这里使用了两层可选链式调用，最后的返回结果依旧是单层的可选类型，即 Int? 而不是 Int??。
 
 在调用 incrementForCount(_:) 方法后，Int? 型的返回值通过可选绑定解包并赋值给常量 amount。如果可选值确实包含一个数值，也就是说，数据源和方法都存在，数据源方法返回了一个有效值。之后便将解包后的 amount 加到 count 上，增量操作完成。
 
 如果没有从 incrementForCount(_:) 方法获取到值，可能由于 dataSource 为 nil，或者它并没有实现 incrementForCount(_:) 方法，那么 increment() 方法将试图从数据源的 fixedIncrement 属性中获取增量。fixedIncrement 是一个可选属性，因此属性值是一个 Int? 值，即使该属性在 CounterDataSource 协议中的类型是非可选的 Int。
 
 下面的例子展示了 CounterDataSource 的简单实现。ThreeSource 类采纳了 CounterDataSource 协议，它实现了可选属性 fixedIncrement，每次会返回 3：
 */
print("********可选协议*********")
class ThreeSource: NSObject, CounterDataSource {
    let fixedIncrement = 3
}
var counter = Counter()
//counter.count = 1
counter.dataSource = ThreeSource()
for _ in 1...4 {
    counter.increment()
    print(counter.count)
}

/**
 下面是一个更为复杂的数据源 TowardsZeroSource，它将使得最后的值变为 0：
 */
@objc class TowardZeroSource: NSObject, CounterDataSource {
    func incrementForCount(count: Int) -> Int {
        if count == 0 {
            return 0
        }else if count < 0 {
            return 1
        }else {
            return -1
        }
    }
}
print("hhhh")
counter.count = -4
counter.dataSource = TowardZeroSource()
for _ in 1...5 {
    counter.increment()
    print(counter.count)
}
print("hhhh")

/**
 协议扩展
 协议可以通过扩展来为采纳协议的类型提供属性、方法以及下标的实现。通过这种方式，你可以基于协议本身来实现这些功能，而无需在每个采纳协议的类型中都重复同样的实现，也无需使用全局函数。
 
 例如，可以扩展 RandomNumberGenerator 协议来提供 randomBool() 方法。该方法使用协议中定义的 random() 方法来返回一个随机的 Bool 值：
 */
extension RandomNumberGenerator {
    func randomBool() -> Bool {
        return random() > 0.5
    }
}
/// 通过协议扩展，所有采纳协议的类型，都能自动获得这个扩展所增加的方法实现，无需任何额外修改：
let gen = LinearCongruentialGenerator()
gen.random()
gen.randomBool()

/**
 提供默认实现
 可以通过协议扩展来为协议要求的属性、方法以及下标提供默认的实现。如果采纳协议的类型为这些要求提供了自己的实现，那么这些自定义实现将会替代扩展中的默认实现被使用。
 
 注意
 通过协议扩展为协议要求提供的默认实现和可选的协议要求不同。虽然在这两种情况下，采纳协议的类型都无需自己实现这些要求，但是通过扩展提供的默认实现可以直接调用，而无需使用可选链式调用。
 
 例如，PrettyTextRepresentable 协议继承自 TextRepresentable 协议，可以为其提供一个默认的 prettyTextualDescription 属性，只是简单地返回 textualDescription 属性的值：
 */
extension PrettyTextRepresentable {
    var prettyTextualDescription: String {
        return textualDescription
    }
}

/**
 为协议扩展添加限制条件
 
 在扩展协议的时候，可以指定一些限制条件，只有采纳协议的类型满足这些限制条件时，才能获得协议扩展提供的默认实现。这些限制条件写在协议名之后，使用 where 子句来描述，正如Where子句中所描述的。
 
 例如，你可以扩展 CollectionType 协议，但是只适用于集合中的元素采纳了 TextRepresentable 协议的情况：
 */
extension Collection where Iterator.Element: TextRepresentable {
    var textualDescription: String {
        let itemsAsText = self.map { $0.textualDescription }
        print("A hamster***")
        print(itemsAsText)
        print("A hamster***")
        return "[" + itemsAsText.joined(separator: " , ") + "]"
    }
}
/**
 textualDescription 属性返回整个集合的文本描述，它将集合中的每个元素的文本描述以逗号分隔的方式连接起来，包在一对方括号中。
 
 现在我们来看看先前的 Hamster 结构体，它符合 TextRepresentable 协议，同时这里还有个装有 Hamster 的实例的数组：
 */
let murrayTheHamster = Hamster(name: "Murray")
let morganTheHamster = Hamster(name: "Morgan")
let mauriceTheHamster = Hamster(name: "Maurice")
let hamsters = [murrayTheHamster, morganTheHamster, mauriceTheHamster]
hamsters.textualDescription
/**
 因为 Array 符合 CollectionType 协议，而数组中的元素又符合 TextRepresentable 协议，所以数组可以使用 textualDescription 属性得到数组内容的文本表示：
 打印 “[A hamster named Murray, A hamster named Morgan, A hamster named Maurice]”
 注意
 如果多个协议扩展都为同一个协议要求提供了默认实现，而采纳协议的类型又同时满足这些协议扩展的限制条件，那么将会使用限制条件最多的那个协议扩展提供的默认实现。
 */







