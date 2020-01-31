//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

// MARK:- 문제
// https://programmers.co.kr/learn/courses/30/lessons/12915

// MARK:- 풀이
func solution(_ strings:[String], _ n:Int) -> [String] {
    return strings.sorted().sorted { $0[$0.index($0.startIndex, offsetBy: n)] < $1[$1.index($1.startIndex, offsetBy: n)] }
}

solution(["sun", "bed", "car"], 1)
solution(["abce", "abcd", "cdx"], 2)

//: [Next](@next)"
