//
//  CalculateItem.swift
//  Calculator
//
//  Created by 박우연 on 2021/11/12.
//

import Foundation

protocol CalculateItem {

}

extension Double: CalculateItem {
  
}

extension String {
    func split(with target: Character) -> [String] {
        self.split(separator: target).map { String($0) }
    }
}
