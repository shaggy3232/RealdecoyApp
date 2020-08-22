import UIKit

var str = "Hello, playground"

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

duplicatecount(a: "Indivisibilities")



