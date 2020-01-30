//: [Previous](@previous)

import Foundation

// https://programmers.co.kr/learn/courses/30/lessons/12912

// MARK:- 나의 풀이
func solution(_ a:Int, _ b:Int) -> Int64 {
    return a < b ? Int64(Array(a...b).reduce(0) { $0 + $1 }) : Int64(Array(b...a).reduce(0) { $0 + $1 })
}

solution(3, 5)
solution(3, 3)
solution(5, 3)

//: [Next](@next)
