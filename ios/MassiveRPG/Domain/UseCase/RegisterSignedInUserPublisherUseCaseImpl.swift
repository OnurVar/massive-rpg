//
//  RegisterLoggedInUserPublisherUseCaseImpl.swift
//  MassiveRPG-Prod
//
//  Created by Onur Var on 9.04.2024.
//

import Combine

class RegisterSignedInUserPublisherUseCaseImpl: RegisterSignedInUserPublisherUseCase {
    // MARK: Variables

    let authRepository: AuthRepository

    // MARK: Life Cycle

    init(authRepository: AuthRepository) {
        self.authRepository = authRepository
    }

    // MARK: Life Cycle

    func execute() -> AnyPublisher<User?, Never> {
        return authRepository.registerSignedInUserPublisher()
    }
}
