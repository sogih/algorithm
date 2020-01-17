//: [Previous](@previous)

import Foundation

/*
 행렬의 덧셈은 행과 열의 크기가 같은 두 행렬의 같은 행, 같은 열의 값을 서로 더한 결과가 됩니다.
 2개의 행렬 arr1과 arr2를 입력받아, 행렬 덧셈의 결과를 반환하는 함수, solution을 완성해주세요.

 제한 조건
 행렬 arr1, arr2의 행과 열의 길이는 500을 넘지 않습니다.
 
 입출력 예
 arr1           arr2             return
 [[1,2],[2,3]]  [[3,4],[5,6]]    [[4,6],[7,9]]
 [[1],[2]]      [[3],[4]]        [[4],[6]]
*/

// MARK:- 나의 풀이
func solution(_ arr:[[Int]], _ arr2: [[Int]]) -> [[Int]] {
    
    var result = arr
    var index = 0

    for i in arr {
        for j in 0..<i.count {
            result[index][j] = arr[index][j] + arr2[index][j]
        }
        index += 1
    }

    return result
}





// MARK:- 모든 풀이
func solution2(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    
    var arr3:[[Int]] = Array(repeating:Array(repeating:0, count:arr1[0].count), count:arr1.count)
    // Array(repeating: "Z", count: 5) -> "Z"를 5번 append한 arry를 리턴
    // arr3 -> '0을 arr1[0].count번 반복한 배열'을 arr1.count만큼 반복하여 그 arry를 리턴
    
    for i in 0..<arr1.count {
        for j in 0..<arr1[i].count {
            arr3[i][j] = arr1[i][j] + arr2[i][j]
        }
    }
    return arr3
}

func solution3(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    return zip(arr1, arr2).map{zip($0,$1).map{$0+$1}}
}

solution3([[1,2],[2,3]], [[3,4],[5,6]])

//: [Next](@next)
