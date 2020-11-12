import Foundation
import UIKit


/// Базовый пример

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


// func findIndex(of str: String, in items: [String]) -> Int? {  }
// func findIndex(of int: Int, in items: [Int]) -> Int? {  }
// func findIndex(of float: Float, in items: [Float]) -> Int? {  }
// func findIndex(of double: Double, in items: [Double]) -> Int? {  }


func findIndex<T: Equatable>(of foundItem: T, in items: [T]) -> Int? {
    for (index, item) in items.enumerated() {
        if item == foundItem {
            return index
        }
    }
    return nil
}




let arr = ["John", "Doe"]

findIndex(of: "John", in: arr)






















/// Generic с associatedtype

protocol Multiplier {
    associatedtype Num: Numeric
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

    func multiply(a: Double, b: Double) -> Num {
        return a * b
    }
}

class FloatMultiplier: Multiplier {

    typealias Num = Float

    func multiply(a: Num, b: Num) -> Num {
        return a * b
    }
}

let second = DoubleMultiplier()
second.multiply(a: 5, b: 10)


struct UserDefaultsStorage {
    private let userDefaults = UserDefaults.standard



    func object<T: Codable>(type: T.Type, for key: String) -> T? {
        guard let data = userDefaults.data(forKey: key) else { return nil }
        let decoder = JSONDecoder()
        let decodedObject = try? decoder.decode(type, from: data)
        return decodedObject
    }

    func set<T: Codable>(_ newValue: T?, for key: String) {
        let encoder = JSONEncoder()
        do {
            let encodedObject = try encoder.encode(newValue)
            userDefaults.set(encodedObject, forKey: key)
        } catch let error {
            print(error)
        }
    }
}

struct Konf: Codable {
    let id: Int
    let name: String

    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}

let konf = Konf(id: 0, name: "Kolesa konf")

let storage = UserDefaultsStorage()
storage.set(konf, for: "konf")
print(storage.object(type: Konf.self, for: "konf")?.name)

class SomeView<T: UIView>: UIView {

    private var view: UIView? = T()


}

class View: UIView {

}


protocol IntegerConvertible {
    var int: Int { get }
}
extension IntegerConvertible {
    func add<T: IntegerConvertible>(_ number: T) -> CustomNumber {
        return CustomNumber(int: int + number.int)
    }
}
struct CustomNumber: IntegerConvertible {
    let int: Int
}

func +<A: IntegerConvertible, B: IntegerConvertible>(lhs: A, rhs: B) -> CustomNumber {
    return CustomNumber(int: lhs.int + rhs.int)
}

func measure(block: (@escaping () -> ()) -> ()) {

    let startTime = CFAbsoluteTimeGetCurrent()

    block {
        let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
        print("Build ime: \(timeElapsed)")
    }
}

measure() { finish in
    CustomNumber(int: 1) +
    CustomNumber(int: 2) +
    CustomNumber(int: 3) +
    CustomNumber(int: 4) +
    CustomNumber(int: 5) +
    CustomNumber(int: 6)
    finish()
}

measure() { finish in
    CustomNumber(int: 1)
        .add(CustomNumber(int: 2))
        .add(CustomNumber(int: 3))
        .add(CustomNumber(int: 4))
        .add(CustomNumber(int: 5))
        .add(CustomNumber(int: 6))
    finish()
}
