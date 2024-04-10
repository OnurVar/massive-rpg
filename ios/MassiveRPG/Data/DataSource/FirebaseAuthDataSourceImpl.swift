//
//  FirebaseDataSourceImpl.swift
//  MassiveRPG-Prod
//
//  Created by Onur Var on 8.04.2024.
//

import FirebaseAuth
import FirebaseCore
import GoogleSignIn

class FirebaseAuthDataSourceImpl: FirebaseAuthDataSource {
    @MainActor
    func signIn(viewController: UIViewController) async throws -> User {
        return try await withCheckedThrowingContinuation { continuation in
            GIDSignIn.sharedInstance.signIn(withPresenting: viewController) { signInResult, signInError in

                // Check if we received a result
                guard let signInResult = signInResult else {
                    // If not, check if we received an error
                    if let signInError = signInError {
                        continuation.resume(throwing: FirebaseAuthDataSourceError.GoogleSignInError(signInError))
                        return
                    }

                    // If we didn't receive a result or an error, we have an unknown error
                    continuation.resume(throwing: FirebaseAuthDataSourceError.Unknown)
                    return
                }

                let user = signInResult.user
                let accessToken = user.accessToken.tokenString

                // Get the ID token
                guard let idToken = user.idToken?.tokenString else {
                    continuation.resume(throwing: FirebaseAuthDataSourceError.IdTokenNotFound)
                    return
                }

                // Create a credential with the ID token and access token
                let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: accessToken)

                // Sign in with the credential
                Auth.auth().signIn(with: credential) { authResult, authError in
                    // Check if we received a result
                    guard let authResult else {
                        // If not, check if we received an error
                        if let authError {
                            continuation.resume(throwing: FirebaseAuthDataSourceError.FirebaseSignInError(authError))
                            return
                        }
                        // If we didn't receive a result or an error, we have an unknown error
                        continuation.resume(throwing: FirebaseAuthDataSourceError.Unknown)
                        return
                    }

                    let firebaseUser = authResult.user
                    let user = User(
                        id: firebaseUser.uid,
                        name: firebaseUser.displayName,
                        email: firebaseUser.email,
                        photoUrl: firebaseUser.photoURL?.absoluteString
                    )
                    // If we received a result, we sign in successfully
                    continuation.resume(returning: user)
                }
            }
        }
    }

    func signOut() throws {
        try Auth.auth().signOut()
    }
}

enum FirebaseAuthDataSourceError: Error {
    case GoogleSignInError(Error)
    case FirebaseSignInError(Error)
    case IdTokenNotFound
    case Unknown
}
