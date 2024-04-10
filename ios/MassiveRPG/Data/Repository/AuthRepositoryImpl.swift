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

    let firebaseAuthDataSource: FirebaseAuthDataSource
    let userContextDataSource: UserContextDataSource

    // MARK: Life Cycle

    init(firebaseAuthDataSource: FirebaseAuthDataSource, userContextDataSource: UserContextDataSource) {
        self.firebaseAuthDataSource = firebaseAuthDataSource
        self.userContextDataSource = userContextDataSource
    }

    // MARK: Methods

    func registerSignedInUserPublisher() -> AnyPublisher<User?, Never> {
        return userContextDataSource.userPublisher
    }

    func signIn(viewController: UIViewController) async -> Result<User, Error> {
        do {
            let user = try await firebaseAuthDataSource.signIn(viewController: viewController)
            return .success(user)
        } catch {
            return .failure(error)
        }
    }

    func signOut() -> Result<Void, Error> {
        do {
            try firebaseAuthDataSource.signOut()
            return .success(())
        } catch {
            return .failure(error)
        }
    }
}
