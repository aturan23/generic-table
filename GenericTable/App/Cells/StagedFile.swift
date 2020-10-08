//
//  StagedFile.swift
//  GenericTable
//
//  Created by Turan Assylkhan on 10/8/20.
//  Copyright © 2020 Turan Assylkhan. All rights reserved.
//

import Foundation

let intList: [Int] = [0, 1, 2, 3]
let doubleList: [Double] = [0.5, 1.5, 2.5, 3.5]
let strList: [String] = ["some", "long", "string", "list"]

func printIntList(list: [Int]) {
    for i in list {
        print(i)
    }
}
func printDoubleList(list: [Double]) {
    for i in list {
        print(i)
    }
}
func printStrList(list: [String]) {
    for i in list {
        print(i)
    }
}


printIntList(list: intList)
printDoubleList(list: doubleList)
printStrList(list: strList)












func printItemList<T>(list: [T]) {
    for i in list {
        print(i)
    }
}

printItemList(list: intList)
printItemList(list: doubleList)
printItemList(list: strList)















func findIndex(of str: String, in items: [String]) -> Int? {
    for (index, item) in items.enumerated() {
        if item == str {
            return index
        }
    }
    return nil
}

func findIndex(of str: String, in items: [String]) -> Int? {  }
func findIndex(of int: Int, in items: [Int]) -> Int? {  }
func findIndex(of float: Float, in items: [Float]) -> Int? {  }
func findIndex(of double: Double, in items: [Double]) -> Int? {  }
findIndex(of: "Michael", in: ["John", "Doe"])


















func findIndex<T: Equatable>(of foundItem: T, in items: [T]) -> Int? {
    for (index, item) in items.enumerated() {
        if item == foundItem {
            return index
        }
    }
    return nil
}





findIndex(of: "John", in: arr)






















/// Generic с associatedtype

protocol Multiplier {
    associatedtype Num
    func multiply(a: Num, b: Num) -> Num
}

class IntMultiplier: Multiplier {
    func multiply(a: Int, b: Int) -> Int {
        return a * b
    }
}

let first = IntMultiplier()
first.multiply(a: 5, b: 10)

class DoubleMultiplier: Multiplier {
    
    typealias Num = Double
    
    func multiply(a: Double, b: Double) -> Double {
        return a * b
    }
}

let second = DoubleMultiplier()
second.multiply(a: 5, b: 10)
