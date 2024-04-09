//
//  SignInUseCaseImpl.swift
//  MassiveRPG-Prod
//
//  Created by Onur Var on 9.04.2024.
//

import UIKit

class SignInUseCaseImpl: SignInUseCase {
    // MARK: Variables

    let authRepository: AuthRepository

    // MARK: Life Cycle

    init(authRepository: AuthRepository) {
        self.authRepository = authRepository
    }

    // MARK: Methods

    func execute(viewController: UIViewController) async throws -> User {
        return try await authRepository.signIn(viewController: viewController)
    }
}
