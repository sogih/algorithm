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

### Balance

### Revisiting insertion

### Revisiting remove