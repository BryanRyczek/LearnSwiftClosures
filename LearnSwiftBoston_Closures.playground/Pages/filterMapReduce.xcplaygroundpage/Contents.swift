//: [Previous](@previous)

import Foundation

/* .filter, .map and .reduce are commonly used in Swift. They are really handy so you'll probably want to master their use.
 
    .filter, .map and .reduce:
 
    1) operate on collection types like Arrays and Dictionaries (sets too!)
 
    2) are a substitute of "for loops"
 
    3) are part of the Swift Standard Library
 */

let array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

// Challenge: take an array of [Int] and return array of even numbers

var filteredArray : [Int] = []

// FOR LOOP technique 

for number in array {
    if number % 2 == 0 { // if (number / 2) has a remainder of zero,
        filteredArray.append(number) // append the number to filteredArray
    }
}

print("---for loop--- \(filteredArray)")

// FILTER: .filter

// .filter signature

//func filter(_ isIncluded: (Element) throws -> Bool) rethrows -> [Element]

//things to note:

// .filter always returns an array!

// The isIncluded (Element) and [Element] are always of the same type, Swift is a strongly typed language!
// throws / rethrows: If you don't know error handling, you might be thrown off by seeing throws/rethrows. Don't worry, this shouldn't stop you from using .filter or any other closure that has throws/rethrows. All this does is equip the function to handle Errors, on an optional basis. If you are not handling errors in the closure, this notation is of no tangible concern.
// In a nutshell, what .filter does is iterate over a group of elements, and test that element against logic provided by you, the developer. A true result will include the Element in the returned [Element]; a false result will exclude it.


//filteredArray.filter(<#T##isIncluded: (Int) throws -> Bool##(Int) throws -> Bool#>)

//filteredArray.filter { (<#Int#>) -> Bool in
//    <#code#>
//}

// classic .filter simple example

filteredArray = array.filter {
    return $0 % 2 == 0
}

print("---filter--- \(filteredArray)")

/* MAP: .map loops/iterates over a collection and applies the same operation to each element in the collection.
 
 .map always returns an array! */

// Challenge: take dictionary of [String: Int] and return even numbers

let dictionary : [String : Int] = ["a":1, "b":2, "c":3, "d":4, "e":5, "f":6, "g":7, "h":8, "i":9, "j":10]

// old school for-loop approach to squaring the .values of the dictionary

var mappedDict : [Int] = []

for (_,value) in dictionary {
    mappedDict.append(value * value)
}

print("--- looped dict --- \(mappedDict)")

//.map signature

// func map<T>(_ transform: (Key, Value) throws -> T) rethrows -> [T]

//things to note:

// .map does not have to return the same type as its input(s). It can return any type (inside an array of course!)


//Check out the difference in signature depending on if you are filtering a dictionary vs. an array!

//dictionary.map(<#T##transform: ((key: String, value: Int)) throws -> T##((key: String, value: Int)) throws -> T#>)

//array.map(<#T##transform: (Int) throws -> T##(Int) throws -> T#>)

//dictionary.map { (<#(key: String, value: Int)#>) -> T in
//    <#code#>
//}

//array.map { (<#Int#>) -> τ_0_0 in
//    <#code#>
//}

enum Round {
    case up
    case down
}

var roundedDict : [Round]

roundedDict = dictionary.map { (string, integer) -> Round in
    return (integer * integer) >= 50 ? .up : .down
}

print("--- rounded dict named params --- \(roundedDict)")

roundedDict = dictionary.map {
    return ($1 * $1) >= 50 ? .up : .down
}

print("--- rounded dict dot syntax --- \(roundedDict)")

// REDUCE:

// .reduce takes a group of elements and combines them into one Result

// to use .reduce, first start by deciding what type of result you desire. Then define an initial result of an identical type.

// .reduce signature

// func reduce<Result>(_ initialResult: Result, _ nextPartialResult: (Result, Element) throws -> Result) rethrows -> Result

//array.reduce(<#T##initialResult: τ_0_0##τ_0_0#>, <#T##nextPartialResult: (τ_0_0, Int) throws -> τ_0_0##(τ_0_0, Int) throws -> τ_0_0#>)

//traditional .reduce example

let currency = [20, 20, 1, 1, 1, 1, 5, 10, 50, 10, 5, 1, 1, 5, 1, 20, 20]

currency.reduce(0) {
    $0 + $1
}

// as you may have noticed, nextPartialResult is a closure.

//1) The nextPartialResult closure is called with each iteration, each time with the unfinished result (running count) and the current Element from the sequence, returning the sum of the two.

// this is a tuple i've created to pass in as the initial value to the .reduce call
let resultType : (String, Int) = ("twenty", 20)

// the result must be identical in type to the initial value
let result : (String, Int) = dictionary.reduce(resultType) {
    
    //if you were to enumerate this .reduce, 
//    when
    //    n = 0 -> $0.1 = initialResult(String, Int).1, $1.1 = nextPartialResult.Element(String, Int).1
    //    n = 1 -> $0.1 = nextPartialResult.Result, $1.1 = nextPartialResult.Element
    //    n = 2 -> $0.1 = nextPartialResult.Result, $1.1 = nextPartialResult.Element
    //    n = 3 -> $0.1 = "", $1.1 = ""
    //    n = 4 -> $0.1 = "", $1.1 = ""
    // ETC...
    
    let oldString : String = $0.0
    let oldSum : Int = $0.1
    
    let addString : String = $1.0
    let addInt : Int = $1.1
    
    print(oldString + " plus \(addInt)" + " is \(oldSum + addInt)")
    return(oldString + " plus \(addInt)" , oldSum + addInt)
}

print(result)

