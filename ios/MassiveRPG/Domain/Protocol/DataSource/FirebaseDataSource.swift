//
//  FirebaseDataSource.swift
//  MassiveRPG-Prod
//
//  Created by Onur Var on 8.04.2024.
//

import UIKit

protocol FirebaseDataSource {
    // Sign in with Google using GoogleSignIn
    func signIn(viewController: UIViewController) async throws -> User

    // Sign out
    func signOut() throws
}
