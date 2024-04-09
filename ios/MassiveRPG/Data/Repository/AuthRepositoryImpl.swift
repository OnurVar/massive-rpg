//
//  AuthRepositoryImpl.swift
//  MassiveRPG-Prod
//
//  Created by Onur Var on 8.04.2024.
//

import Combine
import UIKit

class AuthRepositoryImpl: AuthRepository {
    // MARK: Variables

    let firebaseDataSource: FirebaseDataSource
    let userContextDataSource: UserContextDataSource

    // MARK: Life Cycle

    init(firebaseDataSource: FirebaseDataSource, userContextDataSource: UserContextDataSource) {
        self.firebaseDataSource = firebaseDataSource
        self.userContextDataSource = userContextDataSource
    }

    // MARK: Methods

    func registerSignedInUserPublisher() -> AnyPublisher<User?, Never> {
        return userContextDataSource.userPublisher
    }

    func signIn(viewController: UIViewController) async throws -> User {
        return try await firebaseDataSource.signIn(viewController: viewController)
    }

    func signOut() throws {
        try firebaseDataSource.signOut()
    }
}
