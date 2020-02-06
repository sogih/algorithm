//: [Previous](@previous)

import Foundation

// MARK:- 문자열 압축 (2020 kakao)
//https://programmers.co.kr/learn/courses/30/lessons/60057

// MARK:- 나의 풀이
import Foundation

func solution(_ s:String) -> Int {
    
    var str = s
    var slice = Array(repeating: [String](), count: s.count)
    
    for i in 1...s.count {
        str = s
        for _ in 1...Int(s.count/i) {
            slice[i-1].append(String(str.prefix(i)))
            str.removeFirst(i)
            if i > str.count && str != "" {
                slice[i-1].append(String(str))
            }
        }
    }
    
    print(slice)
    
    return 0
}

solution("aabbaccc")

//: [Next](@next)
