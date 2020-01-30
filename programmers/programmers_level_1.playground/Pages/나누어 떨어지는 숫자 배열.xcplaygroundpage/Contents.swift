//: [Previous](@previous)

import Foundation

/*
 
 https://programmers.co.kr/learn/courses/30/lessons/12910
 
 */

// MARK:- 나의 풀이
func solution(_ arr:[Int], _ divisor:Int) -> [Int] {
    return arr.filter { $0%divisor == 0 }.sorted().isEmpty ? [-1] : arr.filter { $0%divisor == 0 }.sorted()
}

solution([5,9,7,10], 5)
solution([2,36,1,3], 1)
solution([3,2,6], 10)

//: [Next](@next)
