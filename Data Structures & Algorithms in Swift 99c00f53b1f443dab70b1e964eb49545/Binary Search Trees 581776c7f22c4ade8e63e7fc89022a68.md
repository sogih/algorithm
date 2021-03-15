# Binary Search Trees

이진 트리 탐색은 검색, 추가, 제거 연산에서 빠른 성능을 가집니다.

![Binary%20Search%20Trees%20581776c7f22c4ade8e63e7fc89022a68/image.png](Binary%20Search%20Trees%20581776c7f22c4ade8e63e7fc89022a68/image.png)

이진 트리 구조를 사용하여 의사를 결정하는 과정

이진 트리 탐색에서는 다음과 같은 규칙이 있습니다.

- **left child**의 값은 **parent**보다 작아야합니다.
- **right child**의 값은 **parent**보다 크거나 같아야합니다.

Binary search trees는 이런 규칙을 이용해서 불필요한 계산을 하지 않으므로 성능을 개선하게 됩니다.

그 결과로 **lookup, insert and removal**을 수행할 때 보통 **O(logN)**의 시간복잡도를 가집니다.

따라서 선형 자료구조인 **Array** 또는 **Linked list** 보다 꽤 빠르게 동작합니다.

## Array vs. BST

동일한 데이터를 Array와 BST로 표현하여 각각의 operation 동작을 비교해 보겠습니다.

![Binary%20Search%20Trees%20581776c7f22c4ade8e63e7fc89022a68/image%201.png](Binary%20Search%20Trees%20581776c7f22c4ade8e63e7fc89022a68/image%201.png)

### Lookup

**Array — O(n)**

- 찾으려는 값이 나올때까지 모든 인덱스를 방문합니다

![Binary%20Search%20Trees%20581776c7f22c4ade8e63e7fc89022a68/image%202.png](Binary%20Search%20Trees%20581776c7f22c4ade8e63e7fc89022a68/image%202.png)

Searching for 105

**Binary Tree — O(logN)**

- 찾으려는 값이 현재 노드보다 작은 경우 left child로 이동합니다
- 찾으려는 값이 현재 노드보다 큰 경우 right child로 이동합니다

![Binary%20Search%20Trees%20581776c7f22c4ade8e63e7fc89022a68/image%203.png](Binary%20Search%20Trees%20581776c7f22c4ade8e63e7fc89022a68/image%203.png)

Searching for 105

### Insertion

**Array — O(n)**

![Binary%20Search%20Trees%20581776c7f22c4ade8e63e7fc89022a68/image%204.png](Binary%20Search%20Trees%20581776c7f22c4ade8e63e7fc89022a68/image%204.png)

**Binary Tree — O(log n)**

![Binary%20Search%20Trees%20581776c7f22c4ade8e63e7fc89022a68/image%205.png](Binary%20Search%20Trees%20581776c7f22c4ade8e63e7fc89022a68/image%205.png)

### Removal

**Array — O(n)**

![Binary%20Search%20Trees%20581776c7f22c4ade8e63e7fc89022a68/image%206.png](Binary%20Search%20Trees%20581776c7f22c4ade8e63e7fc89022a68/image%206.png)

Removing 25 from the array

**Binary Tree — O(log n)**

![Binary%20Search%20Trees%20581776c7f22c4ade8e63e7fc89022a68/image%207.png](Binary%20Search%20Trees%20581776c7f22c4ade8e63e7fc89022a68/image%207.png)

## Implementation

```swift
struct BinarySearchTree<Element: Comparable> {
  private(set) var root: BinaryNode<Element>?
  
  init() {}
}
```

### Inserting elements

```swift
extension BinarySearchTree {
  mutating func insert(_ value: Element) {
    root = insert(from: root, value: value)
  }
  
  private func insert(
    from node: BinaryNode<Element>?,
    value: Element
  ) -> BinaryNode<Element> {
    
    guard let node = node else {
      return BinaryNode(value: value)
    }
    
    if value < node.value {
      node.leftChild = insert(from: node.leftChild, value: value)
    } else {
      node.rightChild = insert(from: node.rightChild, value: value)
    }
    
    return node
  }
}
```