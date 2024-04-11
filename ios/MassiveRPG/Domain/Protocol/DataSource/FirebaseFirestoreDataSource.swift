//
//  FirebaseFirestoreDataSource.swift
//  MassiveRPG-Prod
//
//  Created by Onur Var on 10.04.2024.
//

protocol FirebaseFirestoreDataSource {
    func getCharacterList(forUserId userId: String) async throws -> [Character]
    func getCharacter(forId id: String, forUserId userId: String) async throws -> Character
    func createCharacter(character: Character, forUserId userId: String) async throws
    func updateCharacter(character: Character, forId id: String, forUserId userId: String) async throws
}
