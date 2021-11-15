//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 박우연 on 2021/11/12.
//

import Foundation

enum ExpressionParser {
    // "1+2+3"
    static func parse(from input: String) -> Formula {
        let operands = componentsByOperators(from: input).compactMap { Double($0) } // [1.0, 2.0, 3.0]
        let operators = input.compactMap { Operator(rawValue: $0) } // ["+", "+"]
        return Formula(operands: CalculatorItemQueue(operands), operators: CalculatorItemQueue(operators))
    }
    
    static func componentsByOperators(from input: String) -> [String] {
        var result: [String] = [input]
        Operator.allCases.forEach { `operator` in
            var splitedString: [String] = []
            for input in result {
                splitedString += input.split(with: `operator`.rawValue)
                result = splitedString
            }
        }
        return result
    }
}
