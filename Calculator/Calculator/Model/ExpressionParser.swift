//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 박우연 on 2021/11/12.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var operands = componentsByOperators(from: input).compactMap { Double($0) }
        var operators = input.compactMap { <#Character#> in
            <#code#>
        }
        
        return Formula(operands: CalculatorItemQueue(enQueueElements: operands), operators: CalculatorItemQueue(enQueueElements: operators))
    }
    
    static func componentsByOperators(from input: String) -> [String] {
        var a: [String] = []
        Operator.allCases.forEach { `operator` in
            for _ in input {
                a = input.split(with: `operator`.rawValue)
            }
        }
        return a
    }
    
}

