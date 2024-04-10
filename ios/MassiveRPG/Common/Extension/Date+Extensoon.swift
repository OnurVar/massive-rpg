//
//  Date+Extensoon.swift
//  MassiveRPG-Prod
//
//  Created by Onur Var on 10.04.2024.
//

import Foundation

extension Date {
    func toString() -> String {
        let dateFormatter = ISO8601DateFormatter()
        return dateFormatter.string(from: self)
    }
}

extension String {
    static func toDate(_ dateString: String) -> Date? {
        let dateFormatter = ISO8601DateFormatter()
        return dateFormatter.date(from: dateString)
    }
}
