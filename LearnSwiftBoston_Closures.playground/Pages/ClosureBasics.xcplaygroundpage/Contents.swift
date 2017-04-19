//: [Previous](@previous)

import Foundation
import UIKit

//playground located @: https://github.com/BryanRyczek/learnSwiftBos

/*
                     What is a Closure?
 
 Closures are self-contained blocks of functionality that can be passed around and used in your code.
 
 Credit: Apple Documentation
 */

// I prefer to think of closures as nameless functions that are clean and easy to work with.

//here is an image of a closure.
// Things to notice:
// 1) the entire closure is "enclosed" in curly braces.
// 2) the closure's type annotation consists of parameters and a return type
// 3) the in keyword separates the type annotation from 
let closure = UIImage(named:"closures.png")

// Closures, like functions, are first-class objects in Swift. This means:

//  1) Closures can be stored in memory (assigned to a let / var).

var theAbsoluteMostBasicClosure : () -> ()

// Here I am assigning a closure to a var. The closure takes nothing, and returns nothing. Notice I have only provided the type annotation (parameters and return type), not the behavior (statements).

// Since theAbsoluteMostBasicClosure takes in nothing and returns nothing, it essentially leaves the developer with an area for code execution when behavior is defined.

// Here I define the behavior of theAbsoluteMostBasicClosure.

theAbsoluteMostBasicClosure = { () -> () in
    //do stuff
    print("hello, closure world!")
}

//Now, there is nothing left to do but execute the closure.

print("--- Basic execution of a closure---")
theAbsoluteMostBasicClosure()

//    2) Closures can be passed as arguments to functions.

// This is a function called basicPassIn, that takes in a parameter called function, which is a closure taking in nothing and returning nothing (hmm that sounds familiar!).

func basicPassIn(function: () -> ()) {
    function()
}

print("--- Basic pass in ---")
basicPassIn(function: theAbsoluteMostBasicClosure)

basicPassIn {
    print("--- Basic pass in with trailing closure syntax ---")
    theAbsoluteMostBasicClosure()
}

//    3) Closures can return other functions (or closures) .

// here is a closure that takes in nothing and returns a closure that takes in nothing and returns nothing...

var bigNothing : () -> (() -> ())

bigNothing = {
    print("---return other functions---")
    return theAbsoluteMostBasicClosure
}

let nothing = bigNothing() // == theAbsoluteMostBasicClosure
nothing() // == theAbsoluteMostBasicClosure()

//4 /* Closures can capture and store references to any constants and variables from the context in which they are defined. This is known as closing over those constants and variables.  */

let className: String = "Learn Swift Boston"
