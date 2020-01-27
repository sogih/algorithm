//: [Previous](@previous)

import Foundation

/*
 비밀지도
 https://programmers.co.kr/learn/courses/30/lessons/17681
 */

// MARK:- 나의 풀이

extension String {
    func stringByIndex(index: Int) -> String {
        return String(self[self.index(self.startIndex, offsetBy: index)])
    }
}

func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    
    //1. 2진법 문자열의 배열로 변환
    var arr1binary = arr1.map { String($0, radix: 2) }
    var arr2binary = arr2.map { String($0, radix: 2) }
    
    //2. 문자열의 길이가 n보다 작으면 앞에 0을 채워넣어서 길이를 맞춰줌
    for i in 0..<arr1binary.count {
        if arr1binary[i].count < n {
            arr1binary[i] = String(repeating: "0", count: n-arr1binary[i].count) + arr1binary[i]
        }
        if arr2binary[i].count < n {
            arr2binary[i] = String(repeating: "0", count: n-arr2binary[i].count) + arr2binary[i]
        }
    }
    
    //3. arr1binary와 arr2binary를 비교하여 1이 하나라도있으면 # 그렇지 않으면 공백인 문자열의 배열을 생성하여 리턴
    var result = Array(repeating: "", count: n)
    
    for i in 0..<n {
        
        for j in 0..<n {
            if arr1binary[i].stringByIndex(index: j) == "1" || arr2binary[i].stringByIndex(index: j) == "1" {
                result[i] += "#"
            } else {
                result[i] += " "
            }
        }
        
    }
    return result
}

solution( 5, [9,20,28,18,11], [30,1,21,17,28] ) //["#####","# # #", "### #", "# ##", "#####"]

//: [Next](@next)
