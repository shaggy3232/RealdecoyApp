//
//  Problemsolvingquestions.swift
//  ExpandMyVocab
//
//  Created by Shaggy Bremnath on 2020-08-20.
//  Copyright © 2020 Shaggy Bremnath. All rights reserved.
//

import Foundation
//Question 1
func replaceVowels(a: String, b: String) {
var result = String()

for char in a {
    if char == "a" {
        result.append(b)
    }
    else if char == "e" {
            result.append(b)
        }
    else if char == "i" {
            result.append(b)
        }
    else if char == "o" {
            result.append(b)
        }
    else if char == "u" {
            result.append(b)
        }
    else {
        result.append(char)
    }
}

print(result)

}

//Question 2

func removeSmallest(numbers: [Int]) -> [Int] {
    var a: [Int] = numbers
    a.remove(at: a.firstIndex(of: a.min()!)!)
    return(a)
}
