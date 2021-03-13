# Binary Trees

Binary Tree(이진 트리)는 각 노드에 최대 두 개의 하위 노드가 있는 트리입니다.

## Implementation

```swift
class BinaryNode<Element> {
  var value: Element
  var leftChild: BinaryNode?
  var rightChild: BinaryNode?
  
  init(value: Element) {
    self.value = value
  }
}
```

## Traversal algorithms — 순회 알고리즘

아래의 이진 트리 순회 알고리즘은 모두 시간 복잡도와 공간 복잡도가 O(n)입니다.

### In-order traversal — 중위 순회

왼쪽 하위 트리부터 방문하는 순회

```swift
extension BinaryNode {
  func traverseInOrder(visit: (Element) -> Void) {
    leftChild?.traverseInOrder(visit: visit)
    visit(value)
    rightChild?.traverseInOrder(visit: visit)
  }
}
```

### Pre-order traversal — 전위 순회

뿌리 부터 방문하는 순회

```swift
extension BinaryNode {
  func traversePreOrder(visit: (Element) -> Void) {
    visit(value)
    leftChild?.traversePreOrder(visit: visit)
    rightChild?.traversePreOrder(visit: visit)
  }
}
```

### Post-order traversal — 후위 순회

하위 트리를 모두 방문 후 뿌리를 방문하는 순회

```swift
extension BinaryNode {
  func traversePostOrder(visit: (Element) -> Void) {
    leftChild?.traversePostOrder(visit: visit)
    rightChild?.traversePostOrder(visit: visit)
    visit(value)
  }
}
```