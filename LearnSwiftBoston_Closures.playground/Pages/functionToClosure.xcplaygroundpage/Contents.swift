//: Playground - noun: a place where people can play

import UIKit

import Foundation

// Function to closure!

//MAIN DIFFERENCES
// Functions:
//      - Functions are named, also contain func keyword
//      - Functions do not have "in" keyword

// Closures:
//      - Closures contain no name or func keyword
//      - Closures contain an "in" keyword.
// Closures are completely wrapped, so the in keyword is essentially a marker for the compiler to separate type annotation and functionality.

//Here's a function
func addNumbers(_ numberOne: Int, to numberTwo: Int) -> Int {
    return numberOne + numberTwo
}

////STEP 1: remove header (func functionName)
//(_ numberOne: Int, to numberTwo: Int) -> Int {
//    return numberOne + numberTwo
//}
//
//// STEP 2: remove any argument labels
//(numberOne: Int, numberTwo: Int) -> Int {
//    return numberOne + numberTwo
//}
//
//
//// STEP 3: move leading curly brace to be first character
//    { (_ numberOne: Int, to numberTwo: Int) -> Int
//        return numberOne + numberTwo
//    }

//// STEP 4: place "in" where leading curly brace was
//    { (numberOne: Int, numberTwo: Int) -> Int in
//        return numberOne + numberTwo
//    }

var closure = { (numberOne: Int, numberTwo: Int) -> Int in
    return numberOne + numberTwo
}

closure(1,2)
addNumbers(1, to: 2)
