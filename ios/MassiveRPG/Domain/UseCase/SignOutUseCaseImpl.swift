//
//  SignOutUseCaseImpl.swift
//  MassiveRPG-Prod
//
//  Created by Onur Var on 9.04.2024.
//

class SignOutUseCaseImpl: SignOutUseCase {
    // MARK: Variables

    let authRepository: AuthRepository

    // MARK: Life Cycle

    init(authRepository: AuthRepository) {
        self.authRepository = authRepository
    }

    // MARK: Methods

    func execute() throws {
        try authRepository.signOut()
    }
}
