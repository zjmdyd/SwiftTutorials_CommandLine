//: Playground - noun: a place where people can play

import UIKit

/**
*  Enumerations and Structures
    Use enum to create an enumeration. Like classes and all other named types, enumerations can have methods associated with them.
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
jack = .Two

/**
*  Note
    不像C和Objective-C，Swift枚举成员在创建时不分配默认整数值。在上面的例子CompassPoints中North，South，Eath，West不等于隐含0，1，2和3，而是一种与CompassPoint明确被定义的类型却各不相同的值。
*/

/**
*  In the example above, the raw-value type of the enumeration is Int, so you only have to specify the first raw value. The rest of the raw values are assigned in order. You can also use strings or floating-point numbers as the raw type of an enumeration. Use the rawValue property to access the raw value of an enumeration case.

    Use the init?(rawValue:) initializer to make an instance of an enumeration from a raw value.
*/

if let convertedRank = Rank(rawValue: 3) {
    let threeDescroption = convertedRank.simpleDescription()
}
/**
 - Spades:   黑桃:S-Spade 橄榄叶(象形),代表和平.
 - Hearts:   红桃:H-Heart 桃心(象形),代表爱情.
 - Diamonds: 方块:D-Diamond 钻石(形同意合),代表财富.
 - Clubs:    梅花:C-Club 三叶草(象形),代表幸运.
 */
enum Suit {
    case Spades, Hearts, Diamonds, Clubs
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
let heartsDescription = hearts.simpleDescription()

/** Structures
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

/**
*  An instance of an enumeration case can have values associated with the instance. Instances of the same enumeration case can have different values associated with them. You provide the associated values when you create the instance. Associated values and raw values are different: The raw value of an enumeration case is the same for all of its instances, and you provide the raw value when you define the enumeration.

    For example, consider the case of requesting the sunrise and sunset time from a server. The server either responds with the information or it responds with some error information.
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
*  Notice how the sunrise and sunset times are extracted from the ServerResponse value as part of matching the value against the switch cases.
*/






