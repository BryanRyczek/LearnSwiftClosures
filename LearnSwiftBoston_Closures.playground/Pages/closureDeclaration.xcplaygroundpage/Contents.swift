//: [Previous](@previous)

import Foundation

//How to declare a closure in longhand, shorthand & trailing closure syntax.

//STEP 1: Declare the closure's type annotation (parameters and return type). This is optional but is useful for beginners to compartmentalize closures.

var concatenateString : (String, String) -> String

//STEP 2: declare closure behavior, assign to already declared closure
concatenateString = { (firstString: String, secondString: String) -> String in
        return firstString + " " + secondString
}

//notice that even though we have named parameters in STEP 2, we do not use them when calling the closure.

concatenateString("I like to", "code in Swift!")

//STEP 2A: redefine concatenateString
// Swift knows that (a,b) is of type (String, String) via the context of the code here because you told it to expect (String, String) in STEP 1.

concatenateString = { (a, b) in // (a,b) == (firstString: String, secondString: String)
    return a + " " + b + " " + "And I will forever!"
}

concatenateString("I like to", "code in Swift!")
concatenateString("I like to", "eat strawberries!")


//STEP 2B: redefine behavior of concatenateString and use trailing closure syntax

concatenateString = {
    print($0 + " " + $1)
    return $0 + " " + $1
}

for _ in 0...2 {
    concatenateString("I like to", "move it, move it!")
}

//This is syntactic sugar. Swift allows us to refer to each parameter by "$(parameter index)".
// In our case:
// $0 = first parameter (firstString)
// $1 = second paramter (secondString)
// Again, this is possible because Swift can reference the information of our initial declaration.
// More Syntactic Sugar: If you are only defining the return parameter, you may omit the "return" keyword.

concatenateString = {
    $0 + " " + $1
}

concatenateString("hi", "mom!")
