//
//  Double+NoZeros.swift
//  BeerBar
//
//  Created by Роман Денисенко on 6.02.23.
//

import Foundation

extension Double {
    var withoutZeros: String {
        return truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}
