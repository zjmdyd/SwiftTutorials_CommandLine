//: Playground - noun: a place where people can play

import UIKit

/// 位运算符
var kk = 1^1
var jj = 0^1
 
var a = 1
var b = 2
var c = 1.0
var d = 1.0
//c % d
Int(c) % Int(d) // swift中的取余运算只能适用于整数

a = a ^ b
b = a ^ b
a = a ^ b


/**
 *  下划线的妙用:
 */
 /// 1.格式化数字字面量
let paddedDouble = 123.000_001
let oneMillion = 1_000_000

/**
 *  2.忽略元组的元素值
    当我们使用元组时，如果有的元素不需要使用，这时可以使用下划线将相应的元素进行忽略，例如：
 */
let http404Error = (404, "Not Found")
let (_, errorMessage) = http404Error

/**
 *  3.忽略区间值
 */
let base = 3
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
}

/**
 *  4.忽略外部参数名
 */
var count: Int = 0
func incrementBy(amount: Int, numberOfTimes: Int) {
    count += amount * numberOfTimes
}
//incrementBy(1, 3)   // Missing argument label 'numberOfTimes:' in call

incrementBy(amount: 1, numberOfTimes: 3)

///重载
func incrementBy(amount: Int, _ numberOfTimes: Int) {
    count += amount * numberOfTimes
}
incrementBy(amount: 1, 3)

