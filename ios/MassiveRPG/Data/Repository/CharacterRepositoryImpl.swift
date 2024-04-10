//
//  CharacterRepositoryImpl.swift
//  MassiveRPG-Prod
//
//  Created by Onur Var on 10.04.2024.
//

class CharacterRepositoryImpl: CharacterRepository {
    // MARK: Variables

    let firebaseFirestoreDataSource: FirebaseFirestoreDataSource
    let userContextDataSource: UserContextDataSource

    // MARK: Life Cycle

    init(firebaseFirestoreDataSource: FirebaseFirestoreDataSource, userContextDataSource: UserContextDataSource) {
        self.firebaseFirestoreDataSource = firebaseFirestoreDataSource
        self.userContextDataSource = userContextDataSource
    }

    // MARK: Methods

    func getList() async -> Result<[Character], Error> {
        guard let userId = userContextDataSource.user?.id else {
            return .failure(MassiveRPGAppError.CurrentUserNotFound)
        }

        do {
            let characters = try await firebaseFirestoreDataSource.getCharacterList(forUserId: userId)
            return .success(characters)
        } catch {
            return .failure(error)
        }
    }

    func get(forId id: String) async -> Result<Character, Error> {
        guard let userId = userContextDataSource.user?.id else {
            return .failure(MassiveRPGAppError.CurrentUserNotFound)
        }

        do {
            let character = try await firebaseFirestoreDataSource.getCharacter(forId: id, forUserId: userId)
            return .success(character)
        } catch {
            return .failure(error)
        }
    }

    func create(character: Character) async -> Result<Void, Error> {
        guard let userId = userContextDataSource.user?.id else {
            return .failure(MassiveRPGAppError.CurrentUserNotFound)
        }

        do {
            try await firebaseFirestoreDataSource.createCharacter(character: character, forUserId: userId)
            return .success(())
        } catch {
            return .failure(error)
        }
    }

    func update(character: Character, forId id: String) async -> Result<Void, Error> {
        guard let userId = userContextDataSource.user?.id else {
            return .failure(MassiveRPGAppError.CurrentUserNotFound)
        }

        do {
            try await firebaseFirestoreDataSource.updateCharacter(character: character, forId: id, forUserId: userId)
            return .success(())
        } catch {
            return .failure(error)
        }
    }

    func delete(forId id: String) async -> Result<Void, Error> {
        guard let userId = userContextDataSource.user?.id else {
            return .failure(MassiveRPGAppError.CurrentUserNotFound)
        }

        do {
            try await firebaseFirestoreDataSource.deleteCharacter(forId: id, forUserId: userId)
            return .success(())
        } catch {
            return .failure(error)
        }
    }
}
