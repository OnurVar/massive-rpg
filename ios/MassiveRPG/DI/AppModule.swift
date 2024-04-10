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

    var firebaseAuthDataSource: Factory<FirebaseAuthDataSource> {
        Factory(self) { FirebaseAuthDataSourceImpl() }
    }

    var firebaseFirestoreDataSource: Factory<FirebaseFirestoreDataSource> {
        Factory(self) { FirebaseFirestoreDataSourceImpl() }
    }

    // MARK: Repositories

    var authRepository: Factory<AuthRepository> {
        Factory(self) { AuthRepositoryImpl(firebaseAuthDataSource: self.firebaseAuthDataSource(), userContextDataSource: self.userContextDataSource()) }
    }

    var characterRepository: Factory<CharacterRepository> {
        Factory(self) { CharacterRepositoryImpl(firebaseFirestoreDataSource: self.firebaseFirestoreDataSource(), userContextDataSource: self.userContextDataSource()) }
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

    var createCharacterUseCase: Factory<CreateCharacterUseCase> {
        Factory(self) { CreateCharacterUseCaseImpl(characterRepository: self.characterRepository()) }
    }

    var getCharacterUseCase: Factory<GetCharacterUseCase> {
        Factory(self) { GetCharacterUseCaseImpl(characterRepository: self.characterRepository()) }
    }

    var getCharacterListUseCase: Factory<GetCharacterListUseCase> {
        Factory(self) { GetCharacterListUseCaseImpl(characterRepository: self.characterRepository()) }
    }

    var deleteCharacterUseCase: Factory<DeleteCharacterUseCase> {
        Factory(self) { DeleteCharacterUseCaseImpl(characterRepository: self.characterRepository()) }
    }

    var updateCharacterUseCase: Factory<UpdateCharacterUseCase> {
        Factory(self) { UpdateCharacterUseCaseImpl(characterRepository: self.characterRepository()) }
    }
}
