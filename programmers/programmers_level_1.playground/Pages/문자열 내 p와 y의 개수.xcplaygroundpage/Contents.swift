//: [Previous](@previous)

import Foundation

// MARK:- 문제
//https://programmers.co.kr/learn/courses/30/lessons/12916

// MARK:- 나의 풀이

//func solution(_ s:String) -> Bool {
//    var pcount = 0
//    var ycount = 0
//    s.forEach {
//        if $0 == "p" || $0 == "P" {
//            pcount += 1
//        } else if $0 == "y" || $0 == "Y" {
//            ycount += 1
//        }
//    }
//    return pcount == ycount
//}

func solution(_ s:String) -> Bool {
    return s.lowercased().filter { $0 == "p" }.count == s.lowercased().filter { $0 == "y" }.count
}

solution("pPoooyY")
solution("Pyy")

//: [Next](@next)
