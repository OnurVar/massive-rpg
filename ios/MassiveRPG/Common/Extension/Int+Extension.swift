//
//  Int+Extension.swift
//  MassiveRPG-Prod
//
//  Created by Onur Var on 10.04.2024.
//

import Foundation

extension Int {
    var calculatedStat: Int {
        let difference = self - 10
        if difference < 0 {
            return Int(ceil(Double(difference / 2)))
        } else {
            return Int(floor(Double(difference / 2)))
        }
    }

    var formattedString: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.positivePrefix = "+"

        return numberFormatter.string(from: .init(value: self)) ?? ""
    }
}
