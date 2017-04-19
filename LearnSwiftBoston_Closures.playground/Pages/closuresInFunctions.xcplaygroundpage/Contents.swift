//: [Previous](@previous)

import Foundation

// CLOSURES IN FUNCTIONS

// You will often see closures passed into functions as parameters.

// define operation closures with identical arguments and return types but different execution

// in this case, the closures are of type: (Int, Int) -> Int
// the return type Int can be inferred from context so we don't have to include it in our definition.

let add = { (a: Int, b: Int) in
    a + b
}

let subtract = { (a: Int, b: Int) in
    a - b
}

let multiply = { (a: Int, b: Int) in
    a * b
}

let divide = { (a: Int, b: Int) in
    a / b
}

let pythag = { (a: Int, b: Int) in
    Int(sqrt(Double(a * a + b * b)))
}

// define a function that takes in an argument

func operation(_ a: Int, _ b: Int, operation: (Int, Int) -> Int) -> Int {
    let result = operation(a,b)
    return result
}

//call function with previously declared closures
operation(4, 4, operation: add)
operation(4, 4, operation: subtract)
operation(4, 4, operation: multiply)
operation(4, 4, operation: divide)

operation(3, 4, operation: pythag)
operation(6, 8, operation: pythag)

//declare the closure as a parameter directly in the function call
operation(4, 4, operation: { (a: Int, b: Int) in
    a * b * b
})

//since we know the types of both a & b, we can abstract the closure even further.
operation(4, 4, operation: {
    $0 * $1 * $1
})

//Even further...
operation(6, 15, operation: + /* == $0 + $1 == 6 + 15 */)

//ONLY IF the closure is the final parameter of the function...
//This is called Trailing closure syntax
operation(3, 9) {
    $0 * $0 * $1
   //3 *  3 *  9 == 81
}

//here we add another closure to the end of our operation func.
// now the opTwo closure is the final parameter, so it will be elgible to have its behavior defined using trailing closure syntax. However, the operation closure is now "inelgible" and must have its behavior passed in as a parameter.

func operationTwo(_ a: Int, _ b: Int, operation: (Int, Int) -> Int, opTwo: (Int) -> Int) -> Int {
    let result = operation(a,b)
    let result2 = opTwo(result)
    return result
}

operationTwo(4, 4, operation: add) {
    $0 * 2
}
