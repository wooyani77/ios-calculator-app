//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 박우연 on 2021/11/12.
//

import Foundation

enum ExpressionParser {
    func parse(from input: String) -> Formula {
        let operands = input.components(separatedBy: "+")
        let operators = input.components(separatedBy: " ")
    }
    
    func componentsByOperators(from input: String) -> [String] {
        
    }
}
