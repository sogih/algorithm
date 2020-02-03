//: [Previous](@previous)

import Foundation

// MARK:- 문제
// https://programmers.co.kr/learn/courses/30/lessons/12948

// MARK:- 나의 풀이

func solution(_ phone_number:String) -> String {
    return String(repeating: "*", count: phone_number.count-4)+String(phone_number.suffix(4))
}

solution("01033334444")
solution("027778888")
//: [Next](@next)
