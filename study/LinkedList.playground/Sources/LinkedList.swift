import Foundation

public struct LinkedList<Value> {
    public var head: Node<Value>?
    public var tail: Node<Value>?
    public init() { }
    public var isEmpty: Bool {
        head == nil
    }
}

extension LinkedList: CustomStringConvertible {
    public var description: String {
        guard let head = head else {
            return "Empty list"
        }
        return String(describing: head)
    }
    public mutating func push(_ value: Value) {
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }
    public mutating func append(_ value: Value) {
        //1. 리스트가 비어있으면 head에 insertion후 함수 종료
        guard !isEmpty else {
            push(value) //if isempty == true
            return
        }
        
        //2. 리스트가 비어있지 않으면 tail 의 next에 노드생성
        tail!.next = Node(value: value)
        
        //3. 새로운 tail은 현재 tail의 next
        tail = tail!.next
    }
    public func node(at index: Int) -> Node<Value>? {
        //1
        var currentNode = head
        var currentIndex = 0
        
        //2
        while currentNode != nil && currentIndex < index {
            currentNode = currentNode!.next
            currentIndex += 1
        }
        return currentNode
    }
    @discardableResult
    public mutating func insert(_ value: Value, after node: Node<Value>) -> Node<Value> {
        //insert 위치가 마지막이면 append value하고 함수 종료
        guard tail !== node else {
            append(value)
            return tail!
        }
        //insert 위치가 마지막 아니면 node.next에 새로운 node 지정
        node.next = Node(value: value, next: node.next)
        return node.next!
    }
}
