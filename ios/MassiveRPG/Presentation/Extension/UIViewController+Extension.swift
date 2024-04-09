//
//  UIViewController+Extension.swift
//  MassiveRPG-Prod
//
//  Created by Onur Var on 9.04.2024.
//

import UIKit

extension UIViewController {
    static var topMostController: UIViewController? {
        if var topController = UIWindow.main?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            return topController
        }
        return nil
    }
}
