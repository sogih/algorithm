# Implementation

# Chapter 4. 구현

문제 해결 분야에서 구현 유형의 문제는 '풀이를 떠올리는 것은 쉽지만 소스코드로 옮기기 어려운 문제'를 의미한다. 구현 유형의 알고리즘은 다음과 같다.

**완전 탐색** — 모든 경우의 수를 주저 없이 다 계산하는 해결 방법

**시뮬레이션** — 문제에서 제시한 알고리즘을 한 단계씩 차례대로 직접 수행해야 하는 문제 유형

## 구현 시 고려해야 할 메모리 제약 사항

### 파이썬에서 리스트 크기

![Implementation%20edf879b079364ff3aaabf643f5b2d00d/Untitled_Diagram-2.svg](Implementation%20edf879b079364ff3aaabf643f5b2d00d/Untitled_Diagram-2.svg)

대체로 코딩 테스트에서는 128 ~ 512MB로 메모리를 제한한다. 다만 이를 메모리 크기를 고려해야할 정도로 데이터 처리량이 많은 경우는 그물다.

### 채점 환경

코딩 테스트에서 다음과 같은 시간 제한 및 메모리 제한 정보가 주어진다.

- 시간 제한 : 1초
- 메모리 제한 : 128MB

따라서 작성한 코드가 시간 제한에 걸리는지 대략적으로 계산할 수 있어야한다. 일반적으로 1초에 2,000만 번의 연산을 수행한다고 가정하면 된다. 그리고 데이터의 개수와 시간복잡도를 곱하여 제한 시간 내에 연산 가능한지 알 수 있다. 예를들어 N = 1,000,000일 때 NLog2N은 약 20,000,000이다. 그렇기 때문에 **시간 제한이 1초고 데이터의 개수가 100만 개면 시간 복잡도 O(NlogN) 이내의 알고리즘을 이용하여 문제를 풀어야 한다.**

## 구현 문제에 접근하는 방법

코딩 테스트에서 pypy3를 선택한다면 파이썬3와 동일한 코드를 제출해서 실행 시간을 줄일 수 있다. 따라서 Pypy3도 지원한다면 이를 이용하도록 하자.

## 예제 — 상화좌우

### 문제

공간의 크기 N을 입력 받고 N*N 공간위의 1, 1 좌표에서 시작해서 입력 받은 이동 경로에 따라 움직여서 도착 지점의 좌표를 출력하라. 단, 공간을 벗어나는 경우는 무시한다. 이동은 L, R, U D로 한다.

- L → 왼쪽으로 한 칸 이동
- R → 오른쪽으로 한 칸 이동
- U → 위로 한 칸 이동
- D → 아래로 한 칸 이동

![Implementation%20edf879b079364ff3aaabf643f5b2d00d/Untitled_Diagram-3.svg](Implementation%20edf879b079364ff3aaabf643f5b2d00d/Untitled_Diagram-3.svg)

**입력 조건**

- 첫째 줄 N → 1 ≤ N ≤ 100
- 둘째 줄 이동 계획서 → 1 ≤ 이동 횟수 ≤ 100

**출력 조건**

- 도착 지점의 좌표 X, Y를 공백으로 구분하여 출력한다

**입력 예시**

```python
5
R R R U D D
```

**출력 예시**

```python
4 3
```

### 해설

**내 답안**

```python
n = int(input())
data = list(map(str, input().split()))

position = [0, 0]

for d in data:
  if d == "L":
    position[0] = max(position[0] - 1, 0)
  elif d == "R":
    position[0] = min(position[0] + 1, n)
  elif d == "U":
    position[1] = max(position[1] - 1, 0)
  else:
    position[1] = min(position[1] + 1, n)

print(str(position[0]) + " " + str(position[1]))
```

연산 횟수는 이동 횟수에 비례하게 된다. 즉 이동 횟수가 N번인 경우 시간 복잡도는 O(N)이다. 이러한 문제는 일련의 명령에 따라서 개체를 차례대로 이동시킨다는 점에서 시뮬레이션 유형으로 분류되며 구현이 중요한 대표적인 문제 유형이다. 

```python
# n 입력 받기
n = int(input())
x, y = 1, 1 # x = 1, y = 1
plans = input().split() # type: list

# L R U D에 따른 이동 방향
dx = [-1, 1, 0, 0]
dy = [0, 0, -1, 1]
move_types = ["L", "R", "U", "D"]

# 이동 계획을 하나씩 확인
for plan in plans:
  # 이동 후 좌표 구하기
  for i in range(len(move_types)):
    if plan == move_types[i]:
      nx = x + dx[i]
      ny = y + dy[i]
  # 공간을 벗어나는 경우 무시
  if nx < 1 or ny < 1 or nx > n or ny > n:
    continue
  x, y = nx, ny

print(x, y)
```

## 예제 — 시각

### 문제

**입력 조건**

- 0 ≤ N ≤ 23

**출력 조건**

- 00시 00분 00초부터 N시 59분 59초까지의 모든 시각 중에서 3이 하나라도 포함되는 모든 경우의 수를 출력

**예시**

```python
# 입력 예시
5

# 출력 예시
11475
```

### 해설

**내 답안**

```python
n = int(input())

count = 0
contains = [3, 13, 23, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 43, 53]

for hour in range(0, n + 1):
  for min in range(0, 60):
    for sec in range(0, 60):
      if hour in contains:
        count += 1
      elif min in contains:
        count += 1
      elif sec in contains:
        count += 1
      else:
        pass

print(count)
```

3이 포함된 수를 int가 아닌 str 형태로 변경하여 검사 케이스를 줄일 수 있다.

**교재 답안**

```python
# H를 입력받기
h = int(input())

count = 0
for i in range(h + 1):
  for j in range(60):
    for k in range(60):
      # 매 시각 안에 '3'이 포함되어 있다면 카운트 증가
      if '3' in str(i) + str(j) + str(k):
        count += 1

print(count)
```

모든 시각의 경우를 하나씩 세서 풀 수 있는 문제다. 하루는 86,400초로 모든 경우의 수가 100,000회가 넘지 않기 때문이다. 이러한 유형은 **완전 탐색** 유형으로 분류되기도 한다. 일반적으로 완전 탐색의 경우 검사해야 하는 데이터 개수가 100만 개 이하일 때 완전 탐색을 사용하면 적절하다. 

## 예제 — 왕실의 나이트

### 문제

아래 그림과 같은 체스판이 있을 때 위치 값을 a1 형식으로 입력 받아서 나이트가 이동 가능한 위치의 경우의 수를 출력하세요.

![Implementation%20edf879b079364ff3aaabf643f5b2d00d/Untitled_Diagram-4.svg](Implementation%20edf879b079364ff3aaabf643f5b2d00d/Untitled_Diagram-4.svg)

**입력 조건**

- a1 처럼 열과 행의 문자열을 입력

**출력 조건**

- 나이트가 이동할 수 있는 경우의 수를 출력

**예시**

```python
#input
a1

#output 
2
```

### 해설

**내 답안**

```python
position = str(input())

rows = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h']
cols = ['1', '2', '3', '4', '5', '6', '7', '8']

row = rows.index(position[0])
col = cols.index(position[1])

move_paths = [
  [2, -1], 
  [2, 1], 
  [-2 ,-1], 
  [-2, 1],
  [1, 2],
  [-1, 2],
  [1, -2],
  [-1, 2]
]

count = 0

for path in move_paths:
  y = row
  x = col
  y += path[0]
  x += path[1]
  if 0 <= y < len(rows) and 0 <= x < len(cols):
    count += 1

print(count)
```

**교재 답안**

```python
# 현재 나이트의 위치 입력받기
input_data = input()
row = int(input_data[1])
column = int(ord(input_data[0])) - int(ord('a')) + 1

# 나이트가 이동할 수 있는 8가지 방향 정의
steps = [
  (-2, -1), 
  (-1, -2), 
  (1, -2), 
  (2, -1), 
  (2, 1), 
  (1, 2), 
  (-1, 2), 
  (-2, 1)
]

# 8가지 방향에 대하여 각 위치로 이동이 가능하지 확인
result = 0
for step in steps:
  # 이동하고자 하는 위치 확인
  next_row = row + step[0]
  next_column = column + step[1]
  # 해당 위치로 이동이 가능하다면 카운트 증가
  if next_row >= 1 and next_row <= 8 and next_column >= 1 and next_column <= 8:
    result += 1

print(result)
```

## 예제 — 게임 개발

### 문제

![Implementation%20edf879b079364ff3aaabf643f5b2d00d/Untitled_Diagram.svg](Implementation%20edf879b079364ff3aaabf643f5b2d00d/Untitled_Diagram.svg)

1. 맵의 크기 n과 m을 입력 받는다 .
2. 캐릭터의 초기 좌표(x, y)와 방향(k)을 입력 받는다. 
3. 맵의 정보 (육지, 바다)를 맵의 크기 만큼 입력 받는다.
4. 현재 위치에서 반시계 90도을 회전한다
5. 가보지 않은 칸이 존재하면 한 칸을 전진한다. 

    가보지 않은 칸이 없거나 또는 바다로 가로막혀 전진하지 못하면 다시 4단계로 돌아간다.

    현재 위치에서 이동하지 못하고 360도를 회전한 경우 현재 방향을 유지한 채로 한칸 뒤로간뒤 4단계로 돌아간다.

6. 캐릭터가 방문한 칸의 수를 출력한다.

**입력 조건**

- 3 ≤ N, M ≤ 50
- 처음 위치는 항상 육지

**출력 조건**

- 모든 이동을 마친 후 캐릭터가 방문한 칸의 수를 출력

**예시**

```python
# input
4 4 # 1. 맵의 크기 입력
1 1 0 # 2. 캐릭터 좌표, 방향 입력
1 1 1 1 # 3. 맵의 정보 입력
1 0 0 1
1 1 0 1
1 1 1 1

# output
# 3
```

### 해설

**내 답안**

```python
# failure
```

**교재 답안**

- 보통 방향을 설정해서 이동하는 문제는 dx, dy라는 별도의 리스트를 만들어 방향을 정하는 것이 효과적이다.
- 2차원 배열을 선언할 때는 컴프리헨션을 이용하는 것이 효율적
- 함수 바깥에서 선언된 전역변수를 함수내에서 변경할 때 global 키워드를 붙여준다

```python
# n, m을 공백으로 구분하여 입력받기
n, m = map(int, input().split())

# 방문한 위치를 저장하기 위한 맵을 생성하여 0으로 초기화
d = [[0] * m for _ in range(n)]

# 현재 캐릭터의 X좌표, Y 좌표, 방향을 입력받기
x, y, direction = map(int, input().split())

# 현재 좌표 방문 처리
d[x][y] = 1

# 전체 맵 정보 입력받기
array = []
for i in range(n):
  array.append(list(map(int, input().split())))

# 북, 동, 남, 서 방향 정의
dx = [-1, 0, 1, 0]
dy = [0, 1, 0, -1]

# 왼쪽으로 회전
def turn_left():
  global direction
  direction -= 1
  if direction == -1:
    direction = 3

# 시뮬레이션 시작
count = 1
turn_time = 0
while True:
  turn_left()
  nx = x + dx[direction]
  ny = y + dy[direction]
  
  # 회전 후 이동 가능한 경우
  if d[nx][ny] == 0 and array[nx][ny] == 0:
    d[nx][ny] = 1
    x = nx
    y = ny
    count += 1
    turn_time = 0
    continue

  # 회전 후 이동 불가능한 경우
  else:
    turn_time += 1

  # 네 방향 모두 갈 수 없는 경우
  if turn_time == 4:
    nx = x - dx[direction]
    ny = y - dy[direction]
    # 뒤로 갈 수 있으면 이동하기
    if array[nx][ny] == 0:
      x = nx
      y = ny
    # 뒤가 바다로 막혀있는 경우
    else:
      break
    turn_time = 0

print(count)

```