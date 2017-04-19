//: [Previous](@previous)

//written by Bryan Ryczek for Learning Swift Boston April 2017

/*
                    //$$$$$ CEE-LO $$$$$
 
                        DOLLAR DOWN
 
 XXXXXXXXXXXXXXXXXXFEDERAL RESERVE NOTEXXXXXXXXXXXXXXXXXXX
 XXX  XX       THE UNITED STATES OF AMERICA        XXX  XX
 XXXX XX  -------       ------------               XXXX XX
 XXXX XX              /   jJ===-\    \      C7675  XXXX XX
 XXXXXX     OOO      /   jJ - -  L    \      ---    XXXXXX
 XXXXX     OOOOO     |   JJ  |   X    |       __     XXXXX
 XXX    3   OOO      |   JJ ---  X    |      OOOO    3 XXX
 XXX                 |   J|\    /|    |     OOOOOO     XXX
 XXX     867-5309E   |   /  |  |  \   |      OOOO      XXX
 XXX                 |  |          |  |       --       XXX
 XXX      -------    \ /            \ /                XXX
 X  XX                \ ____________ /               X  XX
 XX XXX 3_________        --------  ___   _______ 3 XXX XX
 XX XXX            ___   ONE DOLLAR  i              XXX XX
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 
 Basic rules of cee-lo
 
 1) Each player rolls three dice
 2) Rolls are scored (highest to lowest):
    - [4,5,6] is the highest roll and an auto win.
    - [6,6,6] -> [1,1,1] three of a kind are next highest.
    - [6,x,x] -> [1,x,x] a unique with a pair is a point of the unique value.
    - [1,2,3] is the lowest roll and an auto loss.
    - Any other roll is no score and the player rolls again.
 3) Highest roll wins.
 4) Tie results in re-roll.
 
 */
import Foundation

//MARK: Dice Struct

struct Dice {

    //declare # of sides (computed property)
    //declare lowValue (computed property)
}

//CLOSURE: Random Closure

// declare closure for random single die roll
// closure takes two ints (max: Int, min: Int)
// closure -> returns an Int between max and min

// arc4random with min / max     CEILING VAL     FLOOR VAL
//                                     |            |
//                                     V            V
// return Int(arc4random_uniform(UInt32(max)) + UInt32(min))

//CLOSURE: dice roll closure

//takes an array : [Dice] and -> returns an array of [Int]
// HINT: .map is a great way to convert objects of one type to objects of a different type

// MARK: CeeLoRoll enum
// list all the possible outcomes of a single ceelo roll

enum CeeLoRoll {
    case point(value: Int) // Stores the value of the odd die
    case trips(value: Int)
    case fourFiveSix
    case oneTwoThree
    case nothing
    case invalidRoll
}

//CLOSURE: ceeLoRoll closure

//takes an array named : [Int], returns -> CeeLoRoll

// guard against the CASE of a roll that does not have 3 Dice
// define an optional Int? variable named unique

// we need to establish the number of dice that match each other in order to determine what type of CeeLoRoll to return.
// HINT: .reduce is a great way to combine elements of an array to a single value (i.e. number of matching dice)

// let matchingDice =

//1st check: if first die matches current die, add 1 to match count
//2nd check: if second die matches third die, assign 2nd die as unique, return 2 as match count
//fall through: assign current die as unique, return currentValue as match count


// switch statement to determine the outcome of the roll

//switch matchingDice {
//case 3:
//    switch roll[0] {
//    case 1:
//        print("trip 1s!")
//    case 2:
//        print("trip 2s!")
//    case 3:
//        print("trip 3s!")
//    case 4:
//        print("trip 4s!")
//    case 5:
//        print("trip 5s!")
//    case 6:
//        print("trip 6!")
//    default:
//        print("stop cheating!")
//        return .invalidRoll
//    }
//    print("Player rolled Trip \(roll[0])s! ")
//    return .trips(value: roll[0])
//case 2:
//    switch unique! {
//    case 1:
//        print("Aced Out!")
//    case 2:
//        print("Deuce!")
//    case 3:
//        print("Tracy!")
//    case 4:
//        print("Four Building")
//    case 5:
//        print("Fever")
//    case 6:
//        print("Headcrack!")
//    default:
//        print("stop cheating!")
//        return .invalidRoll
//    }
//    print("Player pointed a \(unique!)")
//    return .point(value: unique!)
//case 1:
//    if /* .reduce roll to sum */ == 15 && roll.contains(4) {
//        print("Four, five, six! Dollar down!")
//        return .fourFiveSix }
//    else if /* .reduce roll to sum */ == 6 && roll.contains(3) {
//        print("One Two Three! Please keep playing!")
//        return .oneTwoThree }
//    else {
//        print("Cold roller! That's nothing.")
//        return .nothing }
//default:
//    print("stop trying to cheat!")
//    return .invalidRoll
//}

//MARK: Create array with three dice
let dice : [Dice] = [Dice(), Dice(), Dice()]

//MARK: Roll the Dice!

//NEXT STEPS: Player struct with logic to determine player's best roll, Game Struct w/ array of players and comparison mechanisms to determine winner.
