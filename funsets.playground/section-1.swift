// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

typealias Set = (Int -> Bool)

func singletonSet(element: Int) -> Set {
  return { $0 == element }
}

//Everything in Set 1 or Set 2
func union(s1: Set, s2: Set) -> Set {
  return { s1($0) || s2($0) }
}

//Everything in Set 1 and Set 2
func intersection(s1: Set, s2: Set) -> Set {
  return { s1($0) && s2($0) }
}

//Everything in Set 1 not in Set 2
func difference(s1: Set, s2: Set) -> Set {
  return { s1($0) && !s2($0) }
}

let one = singletonSet(1)
let two = singletonSet(2)
let three = singletonSet(3)
let oneAndTwo = union(one,two)
let twoAndThree = union(two,three)
let oneAndTwoAndThree = union(oneAndTwo,three)

one(1)
one(2)
two(1)
two(2)

oneAndTwo(1)
oneAndTwo(2)
oneAndTwo(3)

intersection(oneAndTwo, twoAndThree)(1)
intersection(oneAndTwo, twoAndThree)(2)
intersection(oneAndTwo, twoAndThree)(3)

difference(oneAndTwo, twoAndThree)(1)
difference(oneAndTwo, twoAndThree)(2)
difference(oneAndTwo, twoAndThree)(3)