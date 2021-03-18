# AVL Trees

앞 장에서 이진 트리 검색의 O(log n) 성능 특성에 대해 배웠습니다.

그러나 불균형(Unbalanced) 트리는 O(n)까지 성능이 저하될 수 있다는 사실도 배웠습니다.

1962년 Georgy Adelson-Velsky와 Evgenii Landis는 

트리가 스스로 밸런싱을 하는 이진 검색 트리인 AVL Tree를 고안했습니다.

이 장에서는 이진 검색 트리의 균형(balance)이 성능에 어떤 영향을 미치는지 알아보고,

AVL 트리를 직접 구현해 보겠습니다.

## Understanding balance

균형 트리(Balanced tree)는 이진 검색 트리의 성능을 최적화할 열쇠입니다.

세가지 주요 균형 상태에 대해 알아보겠습니다.

### Perfect balance — 완전 균형

이진 탐색 트리의 이상적인 형태는 완벽하게 균형인(perfectly balanced) 상태로,

위에서 아래까지의 트리의 모든 단계(level)가 노드로 채워져 있습니다.

![AVL%20Trees%208c51b0012ed448a8b2cc12d915cfe1cc/image.png](AVL%20Trees%208c51b0012ed448a8b2cc12d915cfe1cc/image.png)

트리는 완벽하게 **좌우 대칭**을 이룰뿐만 아니라 **가장 아래 단계(level)에서 노드가 전부 채워져 있습니다**.

이러한 조건들을 만족하는 트리를 **완전 균형 트리**라고 합니다.

### "Good-enough" balance

완전 균형 트리가 가장 이상적인 형태지만 항상 완전 균형 상태로 만들어 줄 수는 없습니다.

완전 균형 트리는 트리의 모든 단계(level)가 노드로 채워져 있어야 하기 때문에, 

완전 균형 트리 상태를 만들기 위해서는 필요한 노드의 수가 정해져 있습니다.

예를 들면 노드의 수가 5개라면 절대로 완전 균형 트리가 될 수 없습니다.

![AVL%20Trees%208c51b0012ed448a8b2cc12d915cfe1cc/image%201.png](AVL%20Trees%208c51b0012ed448a8b2cc12d915cfe1cc/image%201.png)

하지만 완전 균형 트리가 아니라고 해서 불균형 트리인 것은 아닙니다.

완전 균형 트리는 아니지만 충분히 훌륭한 성능을 가지는 트리라고 하여 균형 트리라는 것이 있습니다.

균형 트리(balanced tree) 상태가 되기 위해서는, 

트리의 가장 하위 단계를 제외한 모든 단계(level)가 노드로 채워져야 합니다.

### Unbalanced

마지막으로, **불균형 상태**가 있습니다.

이 상태의 이진 탐색 트리는 불균형 정도에 따라 다양한 수준의 성능 손실을 겪습니다.

![AVL%20Trees%208c51b0012ed448a8b2cc12d915cfe1cc/image%202.png](AVL%20Trees%208c51b0012ed448a8b2cc12d915cfe1cc/image%202.png)

트리의 균형을 유지하면 검색, 삽입 그리고 제거 연산에 있어 O(log n)시간복잡도를 가집니다.

AVL Tree는 트리가 불균형 상태가 되면 트리 구조를 조정하여 균형을 유지합니다.

## Implementation

이진 탐색 트리와 AVL 트리는 거의 동일하게 구현합니다.

이진 탐색 트리에 밸런싱에 관련된 요소만 추가해주면 AVL 트리를 정의할 수 있습니다.

### Measuring balance

이진 트리의 균형을 유지하려면 트리의 균형을 측정하는 방법이 필요합니다.

AVL 트리는 각 노드의 `height` 프로퍼티를 사용하여 균형을 축정합니다.

```swift
public class AVLNode<Element> {
  //...
  public var height = 0
  //...
}
```

`height` 프로퍼티는 현재 노드와 연결된 leaf 노드중에서 가장 긴 거리를 나타냅니다.

![AVL%20Trees%208c51b0012ed448a8b2cc12d915cfe1cc/image%203.png](AVL%20Trees%208c51b0012ed448a8b2cc12d915cfe1cc/image%203.png)

하위 노드의 height를 비교하여 특정 노드가 균형을 이루는지 여부를 결정합니다.

균형을 측정할 노드의 왼쪽과 오른쪽 노드의 `height`가 최대 1만큼 차이가 나야 합니다.

왼쪽과 오른쪽 노드의 `height` 차이를 **균형 계수(Balance factor)**라고 합니다.

`balanceFactor`는 왼쪽과 오른쪽 노드의 `height` 차이를 계산하여 리턴합니다.

```swift
public class AVLNode<Element> {
  //...
  public var balanceFactor: Int {
    leftHeight - rightHeight
  }
  
  public var leftHeight: Int {
    leftChild?.height ?? -1
  }
  
  public var rightHeight: Int {
    rightChild?.height ?? -1
  }
  //...
}
```

child 노드가 nil이면 `height`는 -1로 간주합니다.

![AVL%20Trees%208c51b0012ed448a8b2cc12d915cfe1cc/image%204.png](AVL%20Trees%208c51b0012ed448a8b2cc12d915cfe1cc/image%204.png)

위의 그림은 균형 트리를 나타냅니다. 

트리의 가장 아래 단계(level)를 제외한 모든 단계(level)가 채워져있으며,

모든 균형 계수가 0, -1 또는 1이기 때문입니다.

다음으로 40을 insert한 트리 구조를 보겠습니다.

![AVL%20Trees%208c51b0012ed448a8b2cc12d915cfe1cc/image%205.png](AVL%20Trees%208c51b0012ed448a8b2cc12d915cfe1cc/image%205.png)

불균형 트리가 되었습니다. 균형 계수가 -1보다 작거나 1보다 큰것이 존재하기 때문입니다.

그렇다면 insert나 delete 동작을 할 때마다 균형 계수를 체크하여 불균형일 때 트리를 조정한다면

항상 균형 상태를 유지할 수 있을것입니다.

### Rotations

이진 탐색 트리의 밸런싱을 위해 사용되는 방법을 rotation이라고 합니다.

**Left rotation**

오른쪽으로 치우쳐진 불균형 트리의 경우에 left rotation을하면 해결할 수 있습니다.

![AVL%20Trees%208c51b0012ed448a8b2cc12d915cfe1cc/image%206.png](AVL%20Trees%208c51b0012ed448a8b2cc12d915cfe1cc/image%206.png)

X 노드에서 left rotation을 적용한 모습입니다. 위의 그림으로 부터 두가지 사실을 알 수 있습니다.

- 트리의 중위 순회(In-order traversal)는 동일하게 유지됩니다.
- 회전 후 트리의 뎁스가 한 단계 감소한다.

```swift
extension AVLTree {

  private func leftRotate(_ node: AVLNode<Element>) -> AVLNode<Element> {    
    // 1
    let pivot = node.rightChild!
    // 2
    node.rightChild = pivot.leftChild
    // 3
    pivot.leftChild = node
    // 4
    node.height = max(node.leftHeight, node.rightHeight) + 1
    pivot.height = max(pivot.leftHeight, pivot.rightHeight) + 1
    // 5
    return pivot
  }
}
```

![AVL%20Trees%208c51b0012ed448a8b2cc12d915cfe1cc/__img-17.jpg](AVL%20Trees%208c51b0012ed448a8b2cc12d915cfe1cc/__img-17.jpg)

**Right rotation**

right rotation은 left rotation의 대칭을 이룹니다.

트리가 왼쪽으로 치우쳐진 형태의 불균형 상태일 때 right rotation으로 조정할 수 있습니다.

![AVL%20Trees%208c51b0012ed448a8b2cc12d915cfe1cc/image%207.png](AVL%20Trees%208c51b0012ed448a8b2cc12d915cfe1cc/image%207.png)

```swift
extension AVLTree {

  private func rightRotate(_ node: AVLNode<Element>) -> AVLNode<Element> {
    //1
    let pivot = node.leftChild!
    //2
    node.leftChild = pivot.rightChild
    //3
    pivot.rightChild = node
    //4
    node.height = max(node.leftHeight, node.rightHeight) + 1
    pivot.height = max(pivot.leftHeight, pivot.rightHeight) + 1
    return pivot
  }
}
```

![AVL%20Trees%208c51b0012ed448a8b2cc12d915cfe1cc/right_rotate-18.jpg](AVL%20Trees%208c51b0012ed448a8b2cc12d915cfe1cc/right_rotate-18.jpg)

**Right-left rotation**

아래의 불균형 트리는 어떻게 조정할 수 있을까요?

![AVL%20Trees%208c51b0012ed448a8b2cc12d915cfe1cc/image%208.png](AVL%20Trees%208c51b0012ed448a8b2cc12d915cfe1cc/image%208.png)

이 경우에는 left rotation이나 right rotation을 하더라도 균형 트리를 만들 수 없습니다.

이런 경우를 처리하는 방법은 right rotation을 먼저 하고나서 left rotation을 하는것 입니다.

![AVL%20Trees%208c51b0012ed448a8b2cc12d915cfe1cc/image%209.png](AVL%20Trees%208c51b0012ed448a8b2cc12d915cfe1cc/image%209.png)

```swift
extension AVLTree {
  private func rightLeftRotate(_ node: AVNode<Element>) -> AVNode<Element> {
    guard let rightChild = node.rightChild else {
      return node
    }
    //1.
    node.rightChild = rightRotate(rightChild)
    //2.
    return leftRotate(node)
  }
}
```

![AVL%20Trees%208c51b0012ed448a8b2cc12d915cfe1cc/__-19.jpg](AVL%20Trees%208c51b0012ed448a8b2cc12d915cfe1cc/__-19.jpg)

**Left-right rotation**

![AVL%20Trees%208c51b0012ed448a8b2cc12d915cfe1cc/image%2010.png](AVL%20Trees%208c51b0012ed448a8b2cc12d915cfe1cc/image%2010.png)

```swift
extension AVLTree {
  private func leftRightRotate(_ node: AVLNode<Element>) -> AVLNode<Element> {
    guard let leftChild = node.leftChild else { return node }
    //1.
    node.leftChild = leftRotate(leftChild)
    //2.
    return rightRotate(node)
  }
}
```

![AVL%20Trees%208c51b0012ed448a8b2cc12d915cfe1cc/__-20.jpg](AVL%20Trees%208c51b0012ed448a8b2cc12d915cfe1cc/__-20.jpg)

### Balance

이제 `balanceFactor`를 사용하여 노드의 밸런싱이 필요한지 여부를 결정하는 메서드를 작성해보겠습니다.

```swift
extension AVLTree {
  private func balanced(_ node: AVLNode<Element>) -> AVLNode<Element> {
    switch node.balanceFactor {
    case 2: //...
    case -2: //...
    default: return node
    }
  }
}
```

switch 문을 사용하여 `balanceFactor`를 세가지 케이스로 분기하였습니다.

1. `balanceFactor`가 **2**일 때 트리가 왼쪽으로 치우쳐져 있습니다.
그렇기 때문에 **right 또는 left-right rotation**을 통해서 균형에 도달할 수 있습니다.
2. `balanceFactor`가 **-2**일 때 트리가 오른쪽으로 치우쳐져 있습니다.
그렇기 때문에 **left 또는 right-left rotation**을 통해서 균형에 도달할 수 있습니다.
3. 그 외의 경우에는 특정 노드가 균형 상태임을 나타냅니다.
따라서 아무런 동작을 지정해주지 않아도 됩니다.

child 노드의 `balanceFactor` **부호**를 통해 **단일 회전**이 필요한지 **다중 회전**이 필요한지 결정할 수 있습니다.

![AVL%20Trees%208c51b0012ed448a8b2cc12d915cfe1cc/image%2011.png](AVL%20Trees%208c51b0012ed448a8b2cc12d915cfe1cc/image%2011.png)

계속해서`balanced`함수를 작성해보겠습니다.

```swift
extension AVLTree {
  private func balanced(_ node: AVLNode<Element>) -> AVLNode<Element> {
    switch node.balanceFactor {
    case 2:
      if let leftChild = node.leftChild,
             leftChild.balanceFactor == -1 {
        return leftRightRotate(node)
      } else {
        return rightRotate(node)
      }
    case -2:
      if let rightChild = node.rightChild,
             rightChild.balanceFactor == 1 {
        return rightLeftRotate(node)
      } else {
        return leftRotate(node)
      }
    default: 
      return node
    }
  }
}
```

`balanced` 메서드에서 균형으로 조정해주는 동작을 작성했습니다.

이제 적절한 시점에서 해당 메서드를 호출해주기만 하면됩니다.

### Revisiting insertion

`insert` 메서드에 밸런싱 동작을 추가합니다.

```swift
extension AVLTree {
  private func insert(
    from node: AVLNode<Element>?, 
    value: Element
  ) -> AVLNode<Element> {
		
    guard let node = node else { return AVLNode(value: value) }
		
    if value < node.value {
      node.leftChild = insert(from: node.leftChild, value: value)
    } else {
      node.rightChild = insert(from: node.rightChild, value: value)
    }

    let balancedNode = balanced(node)
    balancedNode.height = max(balancedNode.leftHeight, balancedNode.rightHeight) + 1
    return balancedNode
  }
}
```

이렇게하면 콜스택의 모든 노드가 균형임이 보장됩니다.

또한 노드의 `height`도 업데이트합니다.

### Revisiting remove

`Remove` 메서드에 밸런싱 동작을 추가합니다.

```swift
extension AVLTree {
  private func remove(
    node: AVLNode<Element>?, 
    value: Element
  ) -> AVLNode<Element>? {
		
    guard let node = node else { return nil }

    if value == node.value {
      if node.leftChild == nil && node.rightChild == nil {
        return nil
      }
      if node.leftChild == nil {
        return node.rightChild
      }
      if node.rightChild == nil {
        return node.leftChild
      }
      node.value = node.rightChild!.min.value
      node.rightChild = remove(node: node.rightChild, value: node.value)
    } else if value < node.value {
      node.leftChild = remove(node: node.leftChild, value: value)
    } else {
      node.rightChild = remove(node: node.rightChild, value: value)
    }
		
    let balancedNode = balanced(node)
    balancedNode.height = max(balancedNode.leftHeight balancedNode.rightHeight) + 1
    return balancedNode
  }
}
```

AVL에 대한 내용이 모두 끝났습니다. AVL 트리는 이진 탐색 트리의 끝판왕입니다.

self-balancing 시스템은 insert와 remove 연산이 O(log n) 시간 복잡도를 가지도록 보장하기 때문입니다.

## 전체 소스 코드

```swift
public class AVLNode<Element> {
  
  public var value: Element
  public var leftChild: AVLNode?
  public var rightChild: AVLNode?
  public var height = 0
  
  public var balanceFactor: Int {
    leftHeight - rightHeight
  }
  
  public var leftHeight: Int {
    leftChild?.height ?? -1
  }
  
  public var rightHeight: Int {
    rightChild?.height ?? -1
  }
  
  public init(value: Element) {
    self.value = value
  }
}

extension AVLNode: CustomStringConvertible {
  
  public var description: String {
    diagram(for: self)
  }
  
  private func diagram(for node: AVLNode?,
                       _ top: String = "",
                       _ root: String = "",
                       _ bottom: String = "") -> String {
    guard let node = node else {
      return root + "nil\n"
    }
    if node.leftChild == nil && node.rightChild == nil {
      return root + "\(node.value)\n"
    }
    return diagram(for: node.rightChild, top + " ", top + "┌──", top + "│ ")
      + root + "\(node.value)\n"
      + diagram(for: node.leftChild, bottom + "│ ", bottom + "└──", bottom + " ")
  }
}

extension AVLNode {
  
  public func traverseInOrder(visit: (Element) -> Void) {
    leftChild?.traverseInOrder(visit: visit)
    visit(value)
    rightChild?.traverseInOrder(visit: visit)
  }
  
  public func traversePreOrder(visit: (Element) -> Void) {
    visit(value)
    leftChild?.traversePreOrder(visit: visit)
    rightChild?.traversePreOrder(visit: visit)
  }
  
  public func traversePostOrder(visit: (Element) -> Void) {
    leftChild?.traversePostOrder(visit: visit)
    rightChild?.traversePostOrder(visit: visit)
    visit(value)
  }
}
```

```swift
public struct AVLTree<Element: Comparable> {
  
  public private(set) var root: AVLNode<Element>?
  
  public init() {}
}

extension AVLTree: CustomStringConvertible {
  
  public var description: String {
    guard let root = root else { return "empty tree" }
    return String(describing: root)
  }
}

extension AVLTree {
  
  public mutating func insert(_ value: Element) {
    root = insert(from: root, value: value)
  }
  
  private func insert(from node: AVLNode<Element>?, value: Element) -> AVLNode<Element> {
    guard let node = node else {
      return AVLNode(value: value)
    }
    if value < node.value {
      node.leftChild = insert(from: node.leftChild, value: value)
    } else {
      node.rightChild = insert(from: node.rightChild, value: value)
    }
    let balancedNode = balanced(node)
    balancedNode.height = max(balancedNode.leftHeight, balancedNode.rightHeight) + 1
    return balancedNode
  }
  
  private func leftRotate(_ node: AVLNode<Element>) -> AVLNode<Element> {
    let pivot = node.rightChild!
    node.rightChild = pivot.leftChild
    pivot.leftChild = node
    node.height = max(node.leftHeight, node.rightHeight) + 1
    pivot.height = max(pivot.leftHeight, pivot.rightHeight) + 1
    return pivot
  }
  
  private func rightRotate(_ node: AVLNode<Element>) -> AVLNode<Element> {
    let pivot = node.leftChild!
    node.leftChild = pivot.rightChild
    pivot.rightChild = node
    node.height = max(node.leftHeight, node.rightHeight) + 1
    pivot.height = max(pivot.leftHeight, pivot.rightHeight) + 1
    return pivot
  }
  
  private func rightLeftRotate(_ node: AVLNode<Element>) -> AVLNode<Element> {
    guard let rightChild = node.rightChild else {
      return node
    }
    node.rightChild = rightRotate(rightChild)
    return leftRotate(node)
  }
  
  private func leftRightRotate(_ node: AVLNode<Element>) -> AVLNode<Element> {
    guard let leftChild = node.leftChild else {
      return node
    }
    node.leftChild = leftRotate(leftChild)
    return rightRotate(node)
  }
  
  private func balanced(_ node: AVLNode<Element>) -> AVLNode<Element> {
    switch node.balanceFactor {
    case 2:
      if let leftChild = node.leftChild, leftChild.balanceFactor == -1 {
        return leftRightRotate(node)
      } else {
        return rightRotate(node)
      }
    case -2:
      if let rightChild = node.rightChild, rightChild.balanceFactor == 1 {
        return rightLeftRotate(node)
      } else {
        return leftRotate(node)
      }
    default:
      return node
    }
  }
}

extension AVLTree {
  
  public func contains(_ value: Element) -> Bool {
    var current = root
    while let node = current {
      if node.value == value {
        return true
      }
      if value < node.value {
        current = node.leftChild
      } else {
        current = node.rightChild
      }
    }
    return false
  }
}

private extension AVLNode {
  
  var min: AVLNode {
    leftChild?.min ?? self
  }
}

extension AVLTree {
  
  public mutating func remove(_ value: Element) {
    root = remove(node: root, value: value)
  }
  
  private func remove(node: AVLNode<Element>?, value: Element) -> AVLNode<Element>? {
    guard let node = node else {
      return nil
    }
    if value == node.value {
      if node.leftChild == nil && node.rightChild == nil {
        return nil
      }
      if node.leftChild == nil {
        return node.rightChild
      }
      if node.rightChild == nil {
        return node.leftChild
      }
      node.value = node.rightChild!.min.value
      node.rightChild = remove(node: node.rightChild, value: node.value)
    } else if value < node.value {
      node.leftChild = remove(node: node.leftChild, value: value)
    } else {
      node.rightChild = remove(node: node.rightChild, value: value)
    }
    let balancedNode = balanced(node)
    balancedNode.height = max(balancedNode.leftHeight, balancedNode.rightHeight) + 1
    return balancedNode
  }
}
```