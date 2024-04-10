//
//  StatCalculator.swift
//  MassiveRPG-Prod
//
//  Created by Onur Var on 10.04.2024.
//

import Foundation

struct StatCalculator {
    let value: Int
    var calculatedValue: Int {
        let difference = value - 10
        if difference < 0 {
            return Int(ceil(Double(difference / 2)))
        } else {
            return Int(floor(Double(difference / 2)))
        }
    }
}
