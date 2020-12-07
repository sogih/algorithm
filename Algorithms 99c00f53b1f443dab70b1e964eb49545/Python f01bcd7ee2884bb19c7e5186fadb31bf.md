# Python

# 자료형

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

## 리스트 자료형

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
print(a[-1]) # 5

# 네 번째 원소 값 변경
a[3] = 99
print(a) # [1, 2, 3, 99, 5]

# 두 번재 원소부터 네 번째 원소까지 슬라이싱
print(a[1 : 4]) # [2, 3, 99]
```