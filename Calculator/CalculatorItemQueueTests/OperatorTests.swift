//
//  OperatorTests.swift
//  CalculatorItemQueueTests
//
//  Created by 박우연 on 2021/11/15.
//

import XCTest
@testable import Calculator

class OperatorTests: XCTestCase {
    var sut: Operator!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Operator(rawValue: "+")
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func test_when_case_is_add() {
        sut = .add
        let result = sut.calculate(lhs: 10, rhs: 4)
        
        XCTAssertEqual(result, 14)
    }
    
    func test_when_case_is_subtract() {
        sut = .subtract
        let result = sut.calculate(lhs: 10, rhs: 4)
        
        XCTAssertEqual(result, 6)
    }
    
    func test_when_case_is_divide() {
        sut = .divide
        let result = sut.calculate(lhs: 10, rhs: 4)
        
        XCTAssertEqual(result, 2.5)
    }
    
    func test_when_case_is_multiply() {
        sut = .multiply
        let result = sut.calculate(lhs: 10, rhs: 4)
        
        XCTAssertEqual(result, 40)
    }

}
