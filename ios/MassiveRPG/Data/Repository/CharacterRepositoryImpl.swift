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
            // Get character list
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
            // Get character
            let character = try await firebaseFirestoreDataSource.getCharacter(forId: id, forUserId: userId)
            return .success(character)
        } catch {
            return .failure(error)
        }
    }

    func create(form: CharacterForm) async -> Result<Void, Error> {
        guard let userId = userContextDataSource.user?.id else {
            return .failure(MassiveRPGAppError.CurrentUserNotFound)
        }

        do {
            // Create character
            let character = Character(
                id: nil,
                name: form.name,
                cRace: form.cRace,
                cClass: form.cClass,
                cStats: form.cStats,
                isDeleted: false,
                createdAt: nil,
                updatedAt: nil
            )

            // Save character
            try await firebaseFirestoreDataSource.createCharacter(character: character, forUserId: userId)
            return .success(())
        } catch {
            return .failure(error)
        }
    }

    func update(forId id: String, form: CharacterForm) async -> Result<Void, Error> {
        guard let userId = userContextDataSource.user?.id else {
            return .failure(MassiveRPGAppError.CurrentUserNotFound)
        }

        do {
            // Get character
            var character = try await firebaseFirestoreDataSource.getCharacter(forId: id, forUserId: userId)

            // Update character
            character.update(withForm: form)
            character.updatedAt = .init()

            // Save character
            try await firebaseFirestoreDataSource.updateCharacter(character: character, forId: id, forUserId: userId)
            return .success(())
        } catch {
            return .failure(error)
        }
    }

    func delete(forId id: String) async -> Result<Void, any Error> {
        guard let userId = userContextDataSource.user?.id else {
            return .failure(MassiveRPGAppError.CurrentUserNotFound)
        }

        do {
            // Get character
            var character = try await firebaseFirestoreDataSource.getCharacter(forId: id, forUserId: userId)

            // Delete character
            character.isDeleted = true
            character.updatedAt = .init()

            // Save character
            try await firebaseFirestoreDataSource.updateCharacter(character: character, forId: id, forUserId: userId)
            return .success(())
        } catch {
            return .failure(error)
        }
    }
}
