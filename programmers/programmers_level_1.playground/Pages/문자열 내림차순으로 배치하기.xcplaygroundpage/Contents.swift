//: [Previous](@previous)

import Foundation

// MARK:- 문제
// https://programmers.co.kr/learn/courses/30/lessons/12917

// MARK:- 나의 풀이
func solution(_ s:String) -> String {
    return String(s.sorted { $0>$1 })
}

solution("Zbcdefg")

//: [Next](@next)
