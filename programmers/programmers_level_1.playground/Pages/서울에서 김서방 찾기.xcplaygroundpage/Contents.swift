//: [Previous](@previous)

import Foundation

// MARK:- 문제
// https://programmers.co.kr/learn/courses/30/lessons/12919

// MAKR:- 나의 풀이
func solution(_ seoul:[String]) -> String {
    
    let kim = "Kim"
    let enumerated = seoul.enumerated()
    
    for (index, string) in enumerated {
        if string == kim {
            return "김서방은 \(index)에 있다"
        }
    }
    return "김서방은 없다"
}

solution(["Jane", "Kim"])

//: [Next](@next)
