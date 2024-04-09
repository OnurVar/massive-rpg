//
//  UIWindow+Extension.swift
//  MassiveRPG-Prod
//
//  Created by Onur Var on 9.04.2024.
//

import UIKit

extension UIWindow {
    static let main = UIApplication.shared.connectedScenes.map { $0 as? UIWindowScene }.compactMap { $0 }.first?.windows.first
}
