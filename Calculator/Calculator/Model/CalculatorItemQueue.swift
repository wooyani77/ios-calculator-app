//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 박우연 on 2021/11/09.
//

import Foundation

struct CalculatorItemQueue<Element: CalculateItem> {
    
    // MARK: - 기본값을 안주고 init에서 매개변수 기본값을 주면 생성할 때 원하는 값으로 시작해서 외부에서는 접근할 수 없게 할 수있음.
    private(set) var enQueueElements: [Element] = []
    private(set) var deQueueElements: [Element] = []
    
    var isEmpty: Bool {
        return enQueueElements.isEmpty && deQueueElements.isEmpty
    }
    
    mutating func enQueueElement(_ element: Element) {
        enQueueElements.append(element)
    }
    
    mutating func deQueueFirstElement() throws -> Element {
        if enQueueElements.isEmpty && deQueueElements.isEmpty {
            throw CalculatorError.emptyQueue
        }
        if deQueueElements.isEmpty {
            deQueueElements = enQueueElements.reversed()
            enQueueElements.removeAll()
        }
        return deQueueElements.removeLast()
    }
    
    init(_ enQueueElements: [Element] = []) {
        self.enQueueElements = enQueueElements
    }
}
