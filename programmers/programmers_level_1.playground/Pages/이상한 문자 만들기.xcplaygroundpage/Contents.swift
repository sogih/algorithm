//: [Previous](@previous)

import Foundation

// MARK:- 문제
//https://programmers.co.kr/learn/courses/30/lessons/12930

// MARK:- 나의풀이 .. 왜안되지 ..
func solution(_ s:String) -> String {
    let subStr = s.split(separator: " ")
    var result = ""
    subStr.forEach {
        for (index, char) in $0.enumerated() {
            if index%2 == 0 {
                result.append(char.uppercased())
            } else {
                result.append(char.lowercased())
            }
        }
        result.append(" ")
    }
    result.removeLast(1)
    return result
}

//: [Next](@next)
