import Foundation

public struct Stack<Element> {
    
    private var storage: [Element] = []
    
    public init() { }
    
}

extension Stack: CustomStringConvertible { //해당 객체의 인스턴스를 프린트했을 때 description이 출력됨 {
    
    public var description: String {
        """
        ----top----
        \(
            storage //storage에 있는 것들을
            .map { "\($0)" } //문자열의 배열로 바꿔서
            .reversed() //뒤집어서
            .joined(separator: "\n") //하나의 스트링으로 합친다 사이사이 줄바꿈을 포함해서
        )
        -----------
        """
    }
    
    public mutating func push(_ element: Element) {
        storage.append(element) // storage arr에 element 추가 O(1)
    }
    
    @discardableResult
    public mutating func pop() -> Element? {
        storage.popLast() // storage arr의 마지막 element 제거 O(1)
    }
    public func peek() -> Element? {
        storage.last
    }
    public var isEmpty: Bool {
        peek() == nil
    }
    
    public init(_ elements: [Element]) {
        storage = elements
    }
    
}

extension Stack: ExpressibleByArrayLiteral { //ExpressibleByArrayLiteral프로토콜을 준수하면 배열 리터럴로 자신의 인스턴스를 초기화할 수 있다
    public init(arrayLiteral elements: Element...) {
        storage = elements
    }
}
