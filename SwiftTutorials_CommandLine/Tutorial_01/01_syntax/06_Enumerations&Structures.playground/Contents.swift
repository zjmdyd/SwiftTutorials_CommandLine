//: Playground - noun: a place where people can play

import UIKit

/**
 *  Enumerations and Structures
 Use enum to create an enumeration. Like classes and all other named types, enumerations can have methods associated with them.
 
 case关键字表示成员值一条新的分支将被定义
 */
enum Rank: Int {
    case Ace = 1
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King
    
    func simpleDescription() -> String {
        switch self {
        case .Ace:
            return "ace"
        case .Jack:
            return "Jack"
        case .Queen:
            return "queen"
        case .King:
            return "king"
        default:
            return String(self.rawValue);
        }
    }
}

let ace = Rank.Ace
ace.simpleDescription()
ace.rawValue

var jack = Rank.Jack
jack.simpleDescription()
jack.rawValue   // 11
jack = .Two     // 用点(.)引用,因为变量jack类型已知
jack.rawValue   // 2

/**
 * 
 Inside the switch, the enumeration case is referred to by the abbreviated(简短的) form .Ace because the value of self is already known to be a suit. You can use the abbreviated(简短的) form anytime the value’s type is already known.
 */
/**
 *  In the example above, the raw-value type of the enumeration is Int, so you only have to specify the first raw value. The rest of the raw values are assigned in order. You can also use strings or floating-point numbers as the raw type of an enumeration. Use the rawValue property to access the raw value of an enumeration case.
 // Enum case must declare a raw value when the preceding raw value is not an integer (如果前面的枚举值不是整形数据那么必须为后面的每个枚举值赋初始值)
 
 Use the init?(rawValue:) initializer to make an instance of an enumeration from a raw value.
 */
var aa = Rank(rawValue: 11) // optional
aa?.simpleDescription()

if let convertedRank = Rank(rawValue: 4) {
    let threeDescroption = convertedRank.simpleDescription()
}

/** ** 注意 1 **
 (1). The case values of an enumeration are actual values, not just another way of writing their raw values.
 (2). In fact, in cases where there isn’t a meaningful raw value, you don’t have to provide one. (枚举成员在创建时不分配默认整数值)
 */
/**
 - Spades:   黑桃:S-Spade 橄榄叶(象形),代表和平.
 - Hearts:   红桃:H-Heart 桃心(象形),代表爱情.
 - Diamonds: 方块:D-Diamond 钻石(形同意合),代表财富.
 - Clubs:    梅花:C-Club 三叶草(象形),代表幸运.
 */
enum Suit {
//    case Spades = 0   // error --> Enum case cannot have a raw value if the enum does not have a raw type, 注意 1 (2)
    case Spades
    case Hearts, Diamonds, Clubs
    func simpleDescription() -> String {
        switch self {
        case .Spades:
            return "Spades"
        case .Hearts:
            return "hearts"
        case .Diamonds:
            return "diamonds"
        case .Clubs:
            return "clubs"
        }
    }
}

let hearts = Suit.Hearts
hearts.simpleDescription()

/**
 枚举定义了一个常用的具有相关性的一组数据，并在你的代码中以一个安全的方式使用它们。
 如果你熟悉C语言，你就会知道，C语言中的枚举指定相关名称为一组整数值。在Swift中枚举更为灵活，不必为枚举的每个成员提供一个值。如果一个值（被称为“原始”的值）被提供给每个枚举成员，则该值可以是一个字符串，一个字符，或者任何整数或浮点类型的值。
 另外，枚举成员可以指定任何类型，每个成员都可以存储的不同的相关值，就像其他语言中使用集合或变体。你还可以定义一组通用的相关成员为一个枚举，每一种都有不同的一组与它相关的适当类型的值的一部分。
 在Swift中枚举类型是最重要的类型。它采用了很多以前只有类才具有的特性，如计算性能，以提供有关枚举的当前值的更多信息，方法和实例方法提供的功能相关的枚举表示的值传统上支持的许多功能。枚举也可以定义初始化，以提供一个初始成员值;可以在原有基础上扩展扩大它们的功能;并使用协议来提供标准功能。
 每个枚举定义中定义了一个全新的类型。像其他Swift的类型，它们的名称（如CompassPoint和Planet）应为大写字母。给枚举类型单数而不是复数的名字，这样理解起来更加容易
 */

enum CompassPoint {
    case North
    case South
    case East
    case West
}
/**
 在枚举中定义的值（如North，South，East和West）是枚举的成员值（或成员）。这个例子里case关键字表示成员值一条新的分支将被定义。
 Note
 不像C和Objective-C，Swift枚举成员在创建时不分配默认整数值。在上面的例子CompassPoints中North，South，Eath，West不等于隐含0，1，2和3，而是一种与CompassPoint明确被定义的类型却各不相同的值。
 */

/**
 ********** 关联值 *********
 
 这可以被理解为：
 “定义一个名为条形码枚举类型，它可以是UPC-A的任一值类型的关联值（Int，Int，Int），或QRCode的一个类型为String的关联值。”
 
 这个定义不提供任何实际的Int或String值，它只是定义了条形码常量和变量当等于Barcode.UPCA或Barcode.QRCode关联值的类型的时候的存储形式。
 */
enum Barcode {
    case UPCA(Int, Int, Int)
    case QRCode(String)
}
/**
 *  不同的条码类型像以前一样可以使用一个switch语句来检查，但是这一次相关的值可以被提取作为switch语句的一部分。您提取每个相关值作为常数（let前缀）或变量（var前缀）不同的情况下，在switch语句的case代码内使用：
 */
var productBarcode = Barcode.UPCA(8, 85909_51226, 3)
switch productBarcode {
case .UPCA(let numberSystem, let identifier, let check):
    print("UPC-A with value of \(numberSystem), \(identifier), \(check).")
case .QRCode(let productCode):
    print("QR code with value of \(productCode).")
}
/**
 *  如果所有的枚举成员的关联值的提取为常数，或者当所有被提取为变量，为了简洁起见，可以放置一个var，或let标注在成员名称前：
 */
switch productBarcode {
case let .UPCA(numberSystem, identifier, check):
    print("UPC-A with value of \(numberSystem), \(identifier), \(check).")
case let .QRCode(productCode):
    print("QR code with value of \(productCode).")
}

/** 原始值
 *  在关联值的条形码的例子演示了一个枚举的成员如何能声明它们存储不同类型的关联值。作为替代关联值，枚举成员可以拿出预先填入缺省值（称为原始值），从而具有相同的类型。
 */
/**
 这里是一个存储原始的ASCII值命名枚举成员的一个例子：
 */
enum ASCIIControlCharacter: Character {
    case Tab = "\t"
    case LineFeed = "\n"
    case CarriageReturn = "\r"
}
var dd = ASCIIControlCharacter.Tab
dd.rawValue
/**
 *  注意，原始值是不相同关联值。原始值设置为预填充的值时，应先在你的代码中定义枚举，像上述三个ASCII码。对于一个特定的枚举成员的原始值始终是相同的。
    原始值可以是字符串，字符，或任何整数或浮点数类型。
    每个原始值必须在它的枚举中唯一声明。
    当整数被用于原始值，如果其他​​枚举成员没有值时，它们自动递增。
 */


/**
 *  An instance of an enumeration case can have values associated with the instance(关联值). Instances of the same enumeration case can have different values associated with them. You provide the associated values when you create the instance. Associated values and raw values are different: The raw value of an enumeration case is the same for all of its instances, and you provide the raw value when you define the enumeration.
 
 For example, consider the case of requesting the sunrise and sunset time from a server. The server either responds with the information or it responds with some error information.
 
 Swift的枚举类型可以由一些数据类型相关的组成，如果需要的话，这些数据类型可以是各不相同的。枚举的这种特性跟其它语言中的奇异集合，标签集合或者变体相似
 */
enum ServerResponse {
    case Result(String, String)
    case Error(String)
}

let success = ServerResponse.Result("6:00 am", "8:09 pm")
let failure = ServerResponse.Error("Out of chese.")

switch success {
case let .Result(sunrise, sunset):
    print("Sunrise is at \(sunrise) and sunset is at \(sunset).")
case let .Error(error):
    print("Failure... \(error)")
}
/**
 *  Notice how the sunrise and sunset times are extracted(取出) from the ServerResponse value as part of matching the value against the switch cases.
 */


/** Structures (结构体)
 *   Use struct to create a structure. Structures support many of the same behaviors as classes, including methods and initializers.
 /// One of the most important differences between structures and classes is that structures are always copied when they are passed around in your code, but classes are passed by reference.
 */
struct Card {
    var rank: Rank
    var suit: Suit
    
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}

let threeOfSpades = Card(rank: .Three, suit: .Spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()

