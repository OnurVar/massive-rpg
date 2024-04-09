//
//  AppModule.swift
//  MassiveRPG-Prod
//
//  Created by Onur Var on 8.04.2024.
//

import Factory

extension Container {
    // MARK: DataSource

    var userContextDataSource: Factory<UserContextDataSource> {
        Factory(self) { UserContextDataSourceImpl() }
    }

    var firebaseDataSource: Factory<FirebaseDataSource> {
        Factory(self) { FirebaseDataSourceImpl() }
    }

    // MARK: Repositories

    var authRepository: Factory<AuthRepository> {
        Factory(self) { AuthRepositoryImpl(firebaseDataSource: self.firebaseDataSource(), userContextDataSource: self.userContextDataSource()) }
    }

    // MARK: Use Cases

    var signInUseCase: Factory<SignInUseCase> {
        Factory(self) { SignInUseCaseImpl(authRepository: self.authRepository()) }
    }

    var signOutUseCase: Factory<SignOutUseCase> {
        Factory(self) { SignOutUseCaseImpl(authRepository: self.authRepository()) }
    }

    var registerSignedInUserPublisherUseCase: Factory<RegisterSignedInUserPublisherUseCase> {
        Factory(self) { RegisterSignedInUserPublisherUseCaseImpl(authRepository: self.authRepository()) }
    }
}
