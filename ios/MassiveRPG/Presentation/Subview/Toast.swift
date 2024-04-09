//
//  Toast.swift
//  MassiveRPG-Prod
//
//  Created by Onur Var on 10.04.2024.
//

import Toast
import UIKit

class MassiveToast {
    static func makeToast(message: String) {
        DispatchQueue.main.async {
            guard let viewController = UIViewController.topMostController else { return }
            viewController.view.makeToast(message)
        }
    }
}
