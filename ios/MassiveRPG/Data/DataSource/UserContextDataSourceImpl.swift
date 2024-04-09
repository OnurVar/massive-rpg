//
//  UserContextDataSourceImpl.swift
//  MassiveRPG-Prod
//
//  Created by Onur Var on 9.04.2024.
//

import Combine
import FirebaseAuth

class UserContextDataSourceImpl: UserContextDataSource, ObservableObject {
    // MARK: Variables

    @Published var user: User?
    var userPublisher: AnyPublisher<User?, Never> { $user.eraseToAnyPublisher() }

    // MARK: Life Cycle

    init() {
        Auth.auth().addStateDidChangeListener { [weak self] _, user in
            guard let user else {
                self?.user = nil
                return
            }
            self?.user = User(
                id: user.uid,
                name: user.displayName,
                email: user.email,
                photoUrl: user.photoURL?.absoluteString
            )
        }

        guard let user = Auth.auth().currentUser else {
            self.user = nil
            return
        }
        self.user = User(
            id: user.uid,
            name: user.displayName,
            email: user.email,
            photoUrl: user.photoURL?.absoluteString
        )
    }
}
