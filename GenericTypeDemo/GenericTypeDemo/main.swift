//
//  main.swift
//  GenericTypeDemo
//
//  Created by Kalangutkar Ankita Vinod on 4/10/19.
//  Copyright © 2019 Kalangutkar Ankita Vinod. All rights reserved.
//

import Foundation

// 1. generic method
func printValues<Element>(array: [Element]) {
    print(array)
}

printValues(array: [1,2,3])
printValues(array: ["a", "b", "c"])

// 2. Multiple generic values
func printMultipleValues<T, U>(first: T, second: U) {
    print("Values: \(first) \(second)")
}

func printMultipleValues<T>(first: T, second: T) {
    print("Values: \(first) \(second)")
}

printMultipleValues(first: 1, second: "test")
printMultipleValues(first: "one", second: 1)
printMultipleValues(first: "one", second: "two")

// 3. Custom generic type
struct Stack<Element> {
    var items = [Element]()
    
    mutating func push(item: Element) {
        items.append(item)
    }
    
    mutating func pop() {
        items.removeLast()
    }
}

var stackInt = Stack<Int>()
stackInt.push(item: 1)
stackInt.push(item: 2)
stackInt.push(item: 3)
stackInt.push(item: 4)
stackInt.pop()

// 4. extending generic type
extension Stack {
    func printStackValues() {
        print("Stack data: \(items)")
    }
}

stackInt.printStackValues()

// 5. Type constraint
func findValue<T: Equatable>(valueToFind: T, array: [T]) -> Optional<Int> {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}

let value = findValue(valueToFind: "a", array: ["a", "b", "c"])
print(value ?? -1)

// 6. Associated type for protocols
protocol Container {
    associatedtype T
    mutating func append(item: T)
}

struct StackWithContainer<T>: Container {
    var items = [T]()
    
    mutating func push(item: T) {
        items.append(item)
    }
    
    mutating func pop() {
        items.removeLast()
    }
    
//    protocol methods
    mutating func append(item: T) {
        push(item: item)
    }
}

class TypeModel {
    var name = ""
}

var stackIntValue = StackWithContainer<TypeModel>()
let testModel = TypeModel()
testModel.name = "test"
stackIntValue.append(item: testModel)

