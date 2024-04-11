//
//  FirebaseAuthDataSource.swift
//  MassiveRPG-Prod
//
//  Created by Onur Var on 8.04.2024.
//

import UIKit

protocol FirebaseAuthDataSource {
    // Sign in with Google using GoogleSignIn to Firebase
    func signIn(viewController: UIViewController) async throws -> User

    // Sign out from Firebase
    func signOut() throws
}
