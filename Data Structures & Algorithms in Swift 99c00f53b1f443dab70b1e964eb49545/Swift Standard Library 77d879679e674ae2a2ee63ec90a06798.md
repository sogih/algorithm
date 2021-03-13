# Swift Standard Library

## Array

> ordered collection of elements

```swift
let people = ["Brain", "Stanley", "Ringo"]
```

### Traits

- 배열의 element는 순서를 가지기 때문에 index를 이용하여 접근할 수 있어요
- 배열에서 element에 접근하는 동작은 O(1)의 시간복잡도를 가져요
- 

### Performance

배열에서 요소를 추가할때 시간복잡도는 추가되는 **Location**에 따라 달라지게 됩니다.

- **append**

    배열의 마지막에 element를 추가하는 것은 **O(1)**의 시간복잡도를 가집니다.

- **insert**

    배열의 마지막이 아닌곳에 element를 추가하는 것은 **O(n)**의 시간복잡도를 가집니다.

    추가되는 인덱스 이후의 모든 element의 위치를 모두 조정해야 하기 때문입니다.

배열에서 요소를 추가할때 시간복잡도는 배열의 **Capacity**에 의해서 달라지기도 합니다.

배열이 생성되면 element type에 따라 미리 메모리 공간을 확보합니다.

그리고 element가 추가되면서 메모리 공간이 추가로 필요하게 되는 경우가 발생할 수 있습니다.

그렇게 되면 기존의 저장 공간의 두배에 해당하는 공간을 새로 확보한 뒤에,

**기존의 element를 모두 방문하여** 값을 복사하게됩니다.

따라서 기존 capacity를 초과하여 element 추가하는 경우에는 시간복잡도가 **O(n)**이 됩니다.

## Dictionary

> Generic collection that holds key-value pairs

```swift
var scores: [String: Int] = ["Eric": 9, "Mark": 12, "Wayne": 1] // 생성
scores["Andrew"] = 0 // 추가
```

### Traits

- 딕셔너리는 순서를 보장하지 않아요
- Key는 `Hashable`이어야 해요
- `Collection` 프로토콜을 채택하고 있으므로 순회할 수 있어요
- insert 동작의 시간복잡도가 항상 **O(1)**
- lookup 작업의 시간복잡도가 항상 **O(1)**

## Set

> Container that holds unique values

```swift
var bag: Set<String> = ["Candy", "Juice", "Gummy"]
bag.insert("Candy")
print(bag) // prints ["Candy", "Juice", "Gummy"]
```

### Traits

- 중복값을 허용하지 않아요
- 순서가 없어요