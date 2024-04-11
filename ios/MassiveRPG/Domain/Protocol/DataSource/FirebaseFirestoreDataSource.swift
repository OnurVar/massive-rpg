//
//  FirebaseFirestoreDataSource.swift
//  MassiveRPG-Prod
//
//  Created by Onur Var on 10.04.2024.
//

protocol FirebaseFirestoreDataSource {
    // Get character list
    func getCharacterList(forUserId userId: String) async throws -> [Character]

    // Get character
    func getCharacter(forId id: String, forUserId userId: String) async throws -> Character

    // Create character
    func createCharacter(character: Character, forUserId userId: String) async throws

    // Update character
    func updateCharacter(character: Character, forId id: String, forUserId userId: String) async throws
}
