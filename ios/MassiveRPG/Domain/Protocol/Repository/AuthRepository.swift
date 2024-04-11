//
//  AuthRepository.swift
//  MassiveRPG-Prod
//
//  Created by Onur Var on 8.04.2024.
//

import Combine
import UIKit

protocol AuthRepository {
    // Publisher for signed in user
    func registerSignedInUserPublisher() -> AnyPublisher<User?, Never>

    // Sign in with Google using GoogleSignIn to Firebase
    func signIn(viewController: UIViewController) async -> Result<User, Error>

    // Sign out from Firebase
    func signOut() -> Result<Void, Error>
}
