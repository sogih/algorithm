//: [Previous](@previous)

import Foundation

// MARK:- 문제
//https://programmers.co.kr/learn/courses/30/lessons/12918

// MARK:- 나의 풀이

func solution(_ s:String) -> Bool {
    return (s.count == 4 || s.count == 6) && s.filter { $0.isLetter }.isEmpty// ? true : false
}

solution("a234")
solution("1234")
solution("12344")
solution("12d244")

//: [Next](@next)
