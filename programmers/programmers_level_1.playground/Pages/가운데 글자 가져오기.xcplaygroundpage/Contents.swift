//: [Previous](@previous)

import Foundation

/*
 
 가운데 글자 가져오기
 https://programmers.co.kr/learn/courses/30/lessons/12903
 
 */

// MARK:- 나의 풀이
func solution(_ s:String) -> String {
    
    if s.count%2 == 0 {
        return String(s[s.index(s.startIndex, offsetBy: Int(s.count/2)-1)])+String(s[s.index(s.startIndex, offsetBy: Int(s.count/2))])
    } else {
        return String(s[s.index(s.startIndex, offsetBy: Int(s.count/2))])
    }

}

//: [Next](@next)



solution("abcde")
solution("qwer")
