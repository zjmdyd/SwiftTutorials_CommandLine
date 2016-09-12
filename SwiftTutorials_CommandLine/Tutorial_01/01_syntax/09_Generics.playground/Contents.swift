//: Playground - noun: a place where people can play

import UIKit

/** Generics (泛型)
 *
 *  Write a name inside angle brackets to make a generic function or type.
 */

func repeatItem<Item>(item: Item, numberOfTimes: Int) -> [Item] {
    var result = [Item]()
    
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    
    return result;
}

repeatItem(1, numberOfTimes: 4)
repeatItem("knock", numberOfTimes: 4)
