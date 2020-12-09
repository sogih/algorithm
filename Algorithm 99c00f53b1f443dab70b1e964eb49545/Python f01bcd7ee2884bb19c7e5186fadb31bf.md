# Python

## Number

### int

```python
a = 1000
print(type(a)) # <class 'int'>
```

### float

```python
a = 157.92
print(type(a))  # <class 'float'>

a = 1e9 # <=> 10^9
print(a) # 1000000000.0
print(type(a)) # <class 'float'>
```

### round(number, ndigits)

```python
a = 48.4932 
print(round(a, 2)) # a를 소수 2+1번째 자리에서 반올림
```

### 수 자료형의 연산

```python
a = 7
b = 3

#  나누기
print (a / b) # 2.333333

# 나머지
print(a % b) # 1

# 몫
print(a // b) # 2

# 거듭제곱
print(a ** b) # 343 (7^3)
```

## List

### 리스트 만들기

```python
a = [1, 2, 3, 4, 5]
print(a) # [1, 2, 3, 4, 5]
print(type(a)) # <class 'list'>

# 특정 인덱스 접근
print(a[4]) # 5

# 빈 리스트 선언
a = list() 
print(a) # []
print(type(a)) # <class 'list'>

# 빈 리스트 선언 2)
a = []
print(a) # []
print(type(a)) # <class 'list'>

# 크기가 n이고, 모든 값이 0인 1차원 리스트 초기화
n = 10
a = [0] * n
print(a) # [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
print(type(a)) # <class 'list'>
```

### 리스트의 인덱싱과 슬라이싱

```python
a = [1, 2, 3, 4, 5]

# 뒤에서 첫 번째 원소 출력
prin리스트 컴t(a[-1]) # 5

# 네 번째 원소 값 변경
a[3] = 99
print(a) # [1, 2, 3, 99, 5]

# 두 번재 원소부터 네 번째 원소까지 슬라이싱
print(a[1 : 4]) # [2, 3, 99]
```

### 리스트 컴프리헨션

대괄호 안에 조건문과 반복문을 넣는 방식으로 리스트를 초기화하는 방법. 2차원 리스트를 초기화할 때는 반드시 리스트 컴프리헨션을 이용해야 한다.

```python
# 1 부터 9까지의 수의 제곱 값을 포함하는 리스트
array = [i * i for i in range(1, 10)]
print(array) # [1, 4, 9, 16, 25, 36, 49, 64, 81]

# N X M 크기의 2차원 리스트 초기화
n = 3
m = 4
array = [[0] * m for _ in range(n)]
print(array) # [[0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0]]
```

```python
# n * m 크기의 2차원 리스트 초기화(잘못된 방법)
n = 3
m = 4
array = [[0] * m] * n # 내부의 리스트가 동일한 객체에 대한 3개의 레퍼런스로 할당된다.
print(array) # [[0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0]]

array[1][1] = 5
print(array) # [[0, 5, 0, 0], [0, 5, 0, 0], [0, 5, 0, 0]]
```

[리스트 관련 기타 메서드](Python%20f01bcd7ee2884bb19c7e5186fadb31bf/%E1%84%85%E1%85%B5%E1%84%89%E1%85%B3%E1%84%90%E1%85%B3%20%E1%84%80%E1%85%AA%E1%86%AB%E1%84%85%E1%85%A7%E1%86%AB%20%E1%84%80%E1%85%B5%E1%84%90%E1%85%A1%20%E1%84%86%E1%85%A6%E1%84%89%E1%85%A5%E1%84%83%E1%85%B3%20c8eeaac3e35d4b0580a75b7cae69d94a.csv)

파이썬에서는 removeAll(value) 메서드가 제공되지 않으므로 다음과 같은 방법으로 **리스트에서** **특정한 값의 원소를 모두 제거**할 수 있다.

```python
a =  [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
remove_set = {1, 2, 3, 4, 5}
print(type(remove_set)) # <class 'set'>

# remove_set에 포함되지 않은 값만을 저장
result = [i for i in a if i not in remove_set] 
print(result) # [6, 7, 8, 9, 10]
```

## String

### 문자열 초기화

- 큰따옴표나 작은따옴표 사용 가능
- 문자열을 큰따옴표(작은따옴표)로 구성하는 경우 내부적으로 작은따옴표(큰따옴표)를 포함할 수 있다.
- 큰따옴표나 작은따옴표 앞에 백슬래시\를 포함하면 문자열 내부에 원하는 만큼 큰따옴표나 작은따옴표를 포함할 수 있다.

```python
data = 'Hello "W"orld'
print(data) # Hello World

data = "Don't you know \"Python\"?"
print(data) # Don't you know "Python"?
```

### 문자열 연산

문자열 변수에 덧셈(+)을 이용하면 문자열이 더해져서 연결된다.

```python
a = "Hello"
b = "World"
print(a + " " + b) # Hello World
```

문자열 변수를 양의 정수와 곱하는 경우, 문자열이 그 값만큼 여러 번 더해진다.

```python
a = "String"
print(a * 3) # StringStringString
```

문자열은 내부적으로 리스트와 같이 처리된다. 따라서 문자열 데이터에 대해서도 마찬가지로 **인덱싱**과 **슬라이싱**을 할 수 있다.

```python
a = "ABCDEF" 
print(a[2 : 4]) # CD
```

## Tuple

- 리스트와 달리 한 번 선언된 값을 변경할 수 없다.
- 리스트에 비해 상대적으로 공간 효율적이다.
- 일반적으로 각 원소의 성질이 서로 다를 때 주로 사용한다.

```python
a = (1, 2, 3, 4)
print(a) # (1, 2, 3, 4)
print(type(a)) # <class 'tuple'>

a[2] = 7 # TypeError: 'tuple' object does not support item assignment
```

## Dictionary

### dictionary

- key와 value의 쌍을 데이터로 가지는 자료형이다.
- 내부적으로 hash table을 이용하므로 데이터의 검색 및 수정에 O(1)의 시간효율성을 가진다.
- 키-값 쌍으로 구성된 데이터를 처리함에 있어서 리스트보다 빠르게 동작한다

```python
data = dict()
data["사과"] = "Apple"
data["바나나"] = "Banana"
data["코코넛"] = "Coconut"
print(data) # {'사과': 'Apple', '바나나': 'Banana', '코코넛': 'Coconut'}
```

특정한 원소가 있는지 검사할 때 'element in dictionary'의 형태를 사용할 수 있다.

```python
data = dict()
data["사과"] = "Apple"
data["바나나"] = "Banana"
data["코코넛"] = "Coconut"
if "사과" in data:
  print("'사과'를 키로 가지는 데이터가 존재합니다.") # '사과'를 키로 가지는 데이터가 존재합니다.
```

### methods

```python
data = dict()
data["사과"] = "Apple"
data["바나나"] = "Banana"
data["코코넛"] = "Coconut"

# 키 데이터만 담은 리스트
key_list = data.keys()
print(key_list)

# 값 데이터만 담은 리스트
value_list = data.values()
print(value_list)
```

## Set

### 집합 자료형

- 중복을 허용하지 않는다
- 순서가 없다
- 데이터 검색에 있어 O(1) 시간복잡도

```python
# 집합 자료형 초기화 방법 1
data = set([1, 1, 2, 3, 4, 4, 5])
print(data) # {1, 2, 3, 4, 5}

# 집합 자료형 초기화 방법 2
data = {1, 1, 2, 3, 4, 4, 5}
print(data) # {1, 2, 3, 4, 5}
```

### 집합 자료형 연산

```python
a = set([1, 2, 3, 4, 5])
b = set([3, 4, 5, 6, 7])

print(a | b) # 합집합 -> {1, 2, 3, 4, 5, 6, 7}
print(a & b) # 교집합 -> {3, 4, 5}
print(a - b) # 차집합 -> {1, 2}
```

### methods

```python
data = set([1, 2, 3])
print(data) # 

# 새로운 원소 추가
data.add(4)
print(data) # {1, 2, 3, 4}

# 새로운 원소 여러 개 추가
data.update([5, 6])
print(data) # {1, 2, 3, 4, 5, 6}

# 특정한 값을 갖는 원소 삭제
data.remove(3)
print(data) # {1, 2, 4, 5, 6}
```

## 조건문

```python
score = 85
if score >= 70:
  print('성적이 70점 이상입니다.')
  if score >= 90:
    print('우수한 성적입니다')
else:
  print('성적이 70점 미만입니다.')
  print('조금 더 분발하세요.')
print('프로그램을 종료합니다.')

#성적이 70점 이상입니다.
#프로그램을 종료합니다.

if score >= 80: result = "Success"
else: result = "Failure"
print(result) # Success

result = "true" if score >= 80 else "false"
print(result) # true
```

[비교 연산자](Python%20f01bcd7ee2884bb19c7e5186fadb31bf/%E1%84%87%E1%85%B5%E1%84%80%E1%85%AD%20%E1%84%8B%E1%85%A7%E1%86%AB%E1%84%89%E1%85%A1%E1%86%AB%E1%84%8C%E1%85%A1%2026a28fa4e3b84743b9080998c41afc90.csv)

[논리 연산자](Python%20f01bcd7ee2884bb19c7e5186fadb31bf/%E1%84%82%E1%85%A9%E1%86%AB%E1%84%85%E1%85%B5%20%E1%84%8B%E1%85%A7%E1%86%AB%E1%84%89%E1%85%A1%E1%86%AB%E1%84%8C%E1%85%A1%20dd4312d5318847f9b4a2e0cbfb0318c1.csv)

[파이썬 기타 연산자](Python%20f01bcd7ee2884bb19c7e5186fadb31bf/%E1%84%91%E1%85%A1%E1%84%8B%E1%85%B5%E1%84%8A%E1%85%A5%E1%86%AB%20%E1%84%80%E1%85%B5%E1%84%90%E1%85%A1%20%E1%84%8B%E1%85%A7%E1%86%AB%E1%84%89%E1%85%A1%E1%86%AB%E1%84%8C%E1%85%A1%2038a2d7e75cd34c5a850571aa844b6629.csv)

## 반복문

### while문

조건문이 참일 대에 한해서 반복적으로 코드가 수행된다.

```python
i = 1
result = 0

# i가 9보다 작거나 같을 때 아래 코드를 반복적으로 실행
while i <= 9:
  result += i
  i += 1

print(result) # 45 
```

### for문

```python
result = 0

# i는 1부터 9까지의 모든 값을 순회
for i in range(1, 10):
  result += i

print(result) # 45
```

## 함수

```python
def add(a, b):
  return a + b

print(add(3, 7)) # 10
```

void 리턴 함수의 경우

```python
def add(a, b):
  print('함수의 결과:', a + b)

add(4, 8) # 함수의 결과 : 12
```

함수를 호출할 때 파라미터의 변수를 직접 지정해서 값을 넣을 수 있다. 이때 파라미터 순서는 상관 없게된다.

```python
def add(a, b):
  print('함수의 결과:', a + b)

add(a = 4, b = 8) # 함수의 결과 : 12 
add(b = 4, a = 8) # 함수의 결과 : 12
```

함수 안에서 함수 밖의 변수 데이터를 변경해야 하는 경우 global 키워드를 사용한다.

```python
a = 0

def func():
  global a
  a += 1

for i in range(10):
  func()

print(a) # 10
```

파이썬에서는 람다 표현식을 사용할 수 있다.

```python
print((lambda a, b: a + b)(3, 7)) # 10
```

## 입출력

학생의 성적 데이터가 주어지고, 이를 내림차순으로 정렬한 결과를 출력하는 문제라고 가정하자.

**입력 예시 :** 

```python
5
65, 90, 75, 34, 99
```

출력 예시 :

```python
99 90 75 65 34
```

**input()** — 

파이썬에서 데이터를 입력받을 때 이용한다. 한 줄의 문자열을 입력 받는 함수. 

입력받은 문자열을 띄어쓰기로 구분하여 정수형 리스트로 변환하는 방법.

`list(map(int, input().splite()))` 

입력을 위한 전형적인 소스코드

```python
# 데이터의 개수 입력
n = int(input())

# 각 데이터를 공백으로 구분하여 입력
data = list(map(int, input().splite()))
```

공백을 기준으로 구분하여 적은 수의 데이터 입력

```python
# n, m, k를 공백으로 구분하여 입력
n, m, k = map(int, input().split())

print(n, m, k)
```

공백을 기준으로 구분하여 많은 수의 데이터 입력

```python
import sys

# 문자열 입력받기
data = sys.stdin.readline().rstrip()
print(data)
```

변수 출력 예시 -

```python
a = 1
b = 2
print(a, b)
```

출력 줄 바꿈 예시 — print()는 기본적으로 출력 이후에 줄 바꿈을 수행한다

```python
a = 1
b = 2

print(a)
print(b)
# 1
# 2
```

출력 시 오류가 발생하는 소스코드 예시 — 문자열과 숫자의 연산은 불가능하다

```python
answer = 7
print("정답은" + answer + "입니다.")
# TypeError: can only concatenate str (not "int") to str
```

변수를 문자열로 바꾸어 출력하는 소스코드 예시

```python
answer = 7
print("정답은 " + str(answer) + "입니다.") # 정답은 7입니다.
```

각 변수를 콤마로 구분하여 출력하는 소스코드 예시 — 이경우 변수값 사이에 의도치 않은 공백이 삽입될 수 있다.

```python
answer = 7
print("정답은", str(answer), "입니다.") # 정답은 7입니다.
```

f-string — 문자열 앞에 'f'를 붙여서 사용. {} 안에 변수를 넣어서 자료형 변환 없이 문자열과 정수를 함께 쓸 수 있다. (python 3.6이상)

```python
answer = 7
print(f"정답은 {answer}입니다.") # 정답은 7입니다.
```

## 주요 라이브러리의 문법과 유의점

### 내장 함수

언어 레벨에서 구현되어 있는 함수들이라 import 하지 않아도 된다. 

`input()` `print()` `sum()` `min()` `max()` `eval()` `sorted()` 

eval() 함수는 수학 수식이 문자열 형식으로 들어오면 해당 수식을 계산한 결과를 반환한다.

```python
result = eval("(3 + 5) * 7")
print(result) # 56
```

sorted() 함수는 iterable 객체가 들어왔을 때, 정렬된 결과를 반환한다.

```python
result = sorted([9, 1, 8, 5, 4]) # 오름차순 정렬
print(result) # [1, 4, 5, 8, 9]
result = sorted([9, 1, 8, 5, 4], reverse = True) # 내림차순 정렬
print(result) # [9, 8, 5, 4, 1]
```

리스트의 원소로 리스트나 튜플이 존재할 때 특정한 기준에 따라서 정렬을 수행할 수 있다. 정렬 기준은 key 속성을 이용해 명시할 수 있다. 다음은 원소를 튜플의 두 번째 원소(수)를 기준으로 내림차순으로 정렬하는 예시다.

```python
result = sorted([
  ("홍길동", 35), 
  ("이순신", 75), 
  ("아무개", 50)], 
  key = lambda x: x[1], 
  reverse = True)
print(result) # [('이순신', 75), ('아무개', 50), ('홍길동', 35)]
```

### itertools

반복되는 데이터를 처리하는 기능을 포함하는 라이브러리.

**permutations** — iterable 객체에서 r개의 데이터를 뽑아 일렬로 나열하는 모든 경우(순열) 계산

```python
from itertools import permutations

data = ["A", "B", "C"]
result = list(permutations(data, 3))
print(result)
# [('A', 'B', 'C'), ('A', 'C', 'B'), ('B', 'A', 'C'), ('B', 'C', 'A'), ('C', 'A', 'B'), ('C', 'B', 'A')]
```

**combinations** — iterable 객체에서 r개의 데이터를 뽑아 순서를 고려하지 않고 나열하는 모둔 경우(조합) 계산

```python
from itertools import combinations

data = ["A", "B", "C"]
result = list(combinations(data, 2))
print(result)
# [('A', 'B'), ('A', 'C'), ('B', 'C')]
```

**product** - iterable 객체에서 r개의 데이터를 뽑아 일렬로 나열하는 모든 경우(순열) 계산. 다만 원소를 중복하여 뽑는다(복원추출). 

```python
from itertools import product

data = ["A", "B", "C"]
result = list(product(data, repeat = 2)) # 2개를 뽑는 모든 순열 구하기(중복 혀용)
print(result) # [('A', 'A'), ('A', 'B'), ('A', 'C'), ('B', 'A'), ('B', 'B'), ('B', 'C'), ('C', 'A'), ('C', 'B'), ('C', 'C')]
```

combinations_with_replacement — iterable 객체에서 r개의 데이터를 뽑아 순서를 고려하지 안혹 나열하는 모든 경우(조합) 계산. 다만 원소를 중복하여 뽑는다(복원 추출)

```python
from itertools import combinations_with_replacement

data = ["A", "B", "C"]
result = list(combinations_with_replacement(data, 2)) # 2개를 뽑는 모든 조합 구하기(중복 혀용)
print(result) # [('A', 'A'), ('A', 'B'), ('A', 'C'), ('B', 'B'), ('B', 'C'), ('C', 'C')]
```

### heapq

파이썬의 힙은 최소힙으로 구성되어 있으므로 단순히 원소를 힙에 전부 넣었다가 빼는 것만으로도 시간 복잡도 O(NlogN)에 오름차순 정렬이 완료된다. 보통 최소 힙 자료구조의 최상단 원소는 항상 '가장 작은' 원소이기 때문이다. 

heapq.heappush() — 힙에 원소를 삽입

heapq.heappop() — 힙에서 원소를 꺼냄

```python
import heapq

def heapsort(iterable):
  h = []
  result = []
  # 모든 원소를 차례대로 힙에 삽입
  for value in iterable:
    heapq.heappush(h, value)
  # 힙에 삽입된 모드 ㄴ원소를 차례대로 꺼내어 담기
  for i in range(len(h)):
    result.append(heapq.heappop(h))
  return result

result = heapsort([1, 3, 5, 7, 9, 2, 4, 6, 8, 0])
print(result) # [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
```

또한 파이썬에서는 최대 힙을 제공하지 않는다. 따라서 heapq 라이브러리를 이용하여 최대 힙을 구현해야 할 때는 원소의 부호를 임시로 변경하는 방식을 사용한다. 힙에 원소를 삽입하기 전에 잠시 부호를 반대로 바꾸었다가, 힙에서 원소를 꺼낸 뒤에 다시 원소의 부호를 바꾸면 된다. 이러한 방식으로 최대 힙을 구현하여 내림차순 힙 정렬을 구현하는 예시는 다음과 같다.

```python
import heapq

def heapsort(iterable):
  h = []
  result = []
  # 모든 원소를 차례대로 힙에 삽입
  for value in iterable:
    heapq.heappush(h, -value)
  # 힙에 삽입된 모드 ㄴ원소를 차례대로 꺼내어 담기
  for i in range(len(h)):
    result.append(-heapq.heappop(h))
  return result

result = heapsort([1, 3, 5, 7, 9, 2, 4, 6, 8, 0])
print(result) # [9, 8, 7, 6, 5, 4, 3, 2, 1, 0]
```

### bisect

정렬된 배열에서 특정한 원소를 찾아야 할 때 매우 효과적이다.

`bisect_left(a, x)` — 정렬된 순서를 유지하면서 리스트 a에 데이터 x를 삽입할 가장 왼쪽 인덱스를 찾음

`bisect_right(a, x)` — 정렬된 순서를 유지하면서 리스트 a에 데이터 x를 삽입할 가장 오른쪽 인덱스를 찾음

```python
from bisect import bisect_left, bisect_right

a = [1, 2, 4, 4, 8]
x = 4

print(bisect_left(a, x)) # 2
print(bisect_right(a, x)) # 4
```

정렬된 리스트에서 값이 특정 범위에 속하는 원소의 개수를 구할 때 효과적이다. 원소의 값을 x라고 할 때,

left_value ≤ x < right_value 

인 원소의 개수를 O(logN)으로 계산할 수 있다.

```python
from bisect import bisect_left, bisect_right

# 값이 [left_value, right_vlaue]인 데이터의 개수를 반환하는 함수
def count_by_range(a, left_value, right_value):
  right_index = bisect_right(a, right_value)
  left_index = bisect_left(a, left_value)
  return right_index - left_index

# 리스트 선언
a = [1, 2, 3, 3, 3, 3, 4, 4, 8, 9] 

# 값이 4인 데이터 개수 출력
print(count_by_range(a, 4, 4)) # 2

# 값이 [-1, 3] 범위에 있는 데이터 개수 출력
print(count_by_range(a, -1, 3)) # 6
```

### collections

보통 파이썬에서는 deque를 사용해 큐를 구현한다.

가장 앞쪽에 원소 추가

가장 뒤쪽에 원소 추가

가장 앞쪽의 원소 제거

가장 뒤쪽의 원소 제거

**리스트**

O(N)

O(1)

O(N)

O(1)

**deque**

O(1)

O(1)

O(1)

O(1)

`popleft()` — 첫 번째 원소를 제거

`pop()` — 마지막 원소를 제거

`appendleft(x)` — 첫 번째 인덱스에 원소 x 삽입

`append(x)` — 마지막 인덱스에 원소 x 삽입

따라서 deque를 큐 자료구조로 이용할 때, 원소를 삽입할 때에는 append()를 사용하고 원소를 삭제할 때에는 popleft()를 사용한다. 그러면 먼저 들어온 원소가 항상 먼저 나가게 된다.

```python
from collections import deque

data = deque([2, 3, 4])
data.appendleft(1)
data.append(5)

print(data) # deque([1, 2, 3, 4, 5])
print(list(data)) # [1, 2, 3, 4, 5]
```

collections 라이브러리의 Counter는 등장 횟수를 세는 기능을 제공한다.

```python
from collections import Counter

counter = Counter(["red", "blue", "red", "green", "blue", "blue"])

print(counter["blue"]) # 3
print(counter["green"]) # 1
print(dict(counter)) # {'red': 2, 'blue': 3, 'green': 1}
```

### math

자주 사용되는 수학적인 기능을 포함하는 라이브러리.

`factorial(x)` — x팩토리얼

`sqrt(x)` — x의 제곱근

`gcd(a, b)` — a와 b의 최대 공약수

`pi` — 파이

`e` — 자연상수 e

```python
import math

print(math.factorial(5)) # 5 팩토리얼 = 120
print(math.sqrt(7)) # 2.6457513110645907
print(math.gcd(21, 14)) # 7
print(math.pi) # 3.141592653589793
print(math.e) # 2.718281828459045
```