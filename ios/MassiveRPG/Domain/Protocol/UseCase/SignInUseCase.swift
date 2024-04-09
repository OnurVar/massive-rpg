//
//  SignInUseCase.swift
//  MassiveRPG-Prod
//
//  Created by Onur Var on 9.04.2024.
//

import UIKit

protocol SignInUseCase {
    func execute(viewController: UIViewController) async throws -> User
}
