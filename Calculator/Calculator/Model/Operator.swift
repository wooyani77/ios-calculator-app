//
//  Operator.swift
//  Calculator
//
//  Created by 박우연 on 2021/11/12.
//

import Foundation

enum Operator: Character, CaseIterable {
    case add = "+"
    case subtract = "-"
    case divide = "/"
    case multiply = "*"
    
    func calculate(lhs: Double, rhs: Double) -> Double {
        switch self {
        case .add:
            return add(lhs: lhs, rhs: rhs)
        case .subtract:
            return subtract(lhs: lhs, rhs: rhs)
        case .divide:
            var result: Double = 0
            do {
                result = try divide(lhs: lhs, rhs: rhs)
            } catch CalculatorError.divideByZero {
                print(CalculatorError.divideByZero.description)
            } catch {
                print(error)
            }
            return result
        case .multiply:
            return multiply(lhs: lhs, rhs: rhs)
        }
    }
    
    func add(lhs: Double, rhs: Double) -> Double {
        lhs + rhs
    }
    
    func subtract(lhs: Double, rhs: Double) -> Double {
        lhs - rhs
    }
    
    func divide(lhs: Double, rhs: Double) throws -> Double {
        if rhs == 0 {
            throw CalculatorError.divideByZero
        }
        return lhs / rhs
    }
    
    func multiply(lhs: Double, rhs: Double) -> Double {
        lhs * rhs
    }
}
