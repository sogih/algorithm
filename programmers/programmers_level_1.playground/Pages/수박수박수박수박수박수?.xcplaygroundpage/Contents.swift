//: [Previous](@previous)

import Foundation

// MARK:- 문제
// https://programmers.co.kr/learn/courses/30/lessons/12922

// MARK:- 나의 풀이
func solution(_ n:Int) -> String {
    return n%2==0 ? String(repeating: "수박", count: Int(n/2)) : String(repeating: "수박", count:Int(n/2))+"수"
}

solution(3)
solution(4)

//: [Next](@next)
