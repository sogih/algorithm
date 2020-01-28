//: [Previous](@previous)

import Foundation

/*
 
 https://programmers.co.kr/learn/courses/30/lessons/12901
 
 */

// MARK:- 나의 풀이
//
//func solution(_ a:Int, _ b:Int) -> String {
//
//    var day = b
//    var weekDay = ""
//
//    switch a {
//    case 1:
//        day += 0
//    case 2:
//        day += 0 + 31
//    case 3:
//        day += 0 + 31 + 29
//    case 4:
//        day += 0 + 31 + 29 + 31
//    case 5:
//        day += 0 + 31 + 29 + 31 + 30
//    case 6:
//        day += 0 + 31 + 29 + 31 + 30 + 31
//    case 7:
//        day += 0 + 31 + 29 + 31 + 30 + 31 + 30
//    case 8:
//        day += 0 + 31 + 29 + 31 + 30 + 31 + 30 + 31
//    case 9:
//        day += 0 + 31 + 29 + 31 + 30 + 31 + 30 + 31 + 31
//    case 10:
//        day += 0 + 31 + 29 + 31 + 30 + 31 + 30 + 31 + 31 + 30
//    case 11:
//        day += 0 + 31 + 29 + 31 + 30 + 31 + 30 + 31 + 31 + 30 + 31
//    case 12:
//        day += 0 + 31 + 29 + 31 + 30 + 31 + 30 + 31 + 31 + 30 + 31 + 30
//    default:
//        break
//    }
//
//    switch day%7 {
//    case 0:
//        weekDay = "THU"
//    case 1:
//        weekDay = "FRI"
//    case 2:
//        weekDay = "SAT"
//    case 3:
//        weekDay = "SUN"
//    case 4:
//        weekDay = "MON"
//    case 5:
//        weekDay = "TUE"
//    case 6:
//        weekDay = "WED"
//    default:
//        break
//    }
//
//    return weekDay
//}
//
//
//solution(5, 24)


// MARK:- refactoring
func solution(_ a:Int, _ b:Int) -> String {
    let dayOfMonth = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    return ["THU", "FRI", "SAT", "SUN", "MON", "TUE", "WED"][dayOfMonth[0..<a-1].reduce(b, +) % 7]
}

solution(1, 1)
solution(5, 24)

//: [Next](@next)
