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

//Question 3

func splitCode(a: String) -> (String, String){

    let stringArray = a.components(separatedBy: CharacterSet.decimalDigits.inverted)
    let stringLetter = a.components(separatedBy: CharacterSet.letters.inverted)
    return("(stringLetter.first!)", stringArray.last!)
}

// Question 4

func duplicatecount(a: String) -> Int {
  
    var count = 0
    var dict : [Character : Int] = [:]
    
    for char in a {
        if let oldcount = dict[char]  {
            dict[char] = oldcount + 1
        } else {
            dict[char] = 1
        }
        
    }
       
    for (char,charcount) in dict{
        if charcount > 1 {
            count += 1
        }
    }
return count
}

//Question 5


func josephus(n: Int, i: Int){
    var sum = 0
    for c in 1..<n
          {
              sum = (sum + i) % c;
          }
    
          print(sum+1+i)
}
