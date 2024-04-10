//
//  FirebaseFirestoreDataSourceImpl.swift
//  MassiveRPG-Prod
//
//  Created by Onur Var on 10.04.2024.
//

import FirebaseFirestore

class FirebaseFirestoreDataSourceImpl: FirebaseFirestoreDataSource {
    func getCharacterList(forUserId userId: String) async throws -> [Character] {
        let db = Firestore.firestore()
        let querySnapshot = try await db.collection(FirestoreCollectionType.Users.rawValue).document(userId).collection(FirestoreCollectionType.Characters.rawValue).getDocuments()
        var characters: [Character] = []
        for document in querySnapshot.documents {
            guard let character = try? document.data(as: Character.self) else {
                throw FirebaseFirestoreDataSourceError.CharacterParseError
            }
            characters.append(character)
        }
        return characters
    }

    func getCharacter(forId id: String, forUserId userId: String) async throws -> Character {
        let db = Firestore.firestore()
        let documentSnapshot = try await db.collection(FirestoreCollectionType.Users.rawValue).document(userId).collection(FirestoreCollectionType.Characters.rawValue).document(id).getDocument()

        guard let character = try? documentSnapshot.data(as: Character.self) else {
            throw FirebaseFirestoreDataSourceError.CharacterParseError
        }
        return character
    }

    func createCharacter(character: Character, forUserId userId: String) async throws {
        let db = Firestore.firestore()
        let documentReference = db.collection(FirestoreCollectionType.Users.rawValue).document(userId).collection(FirestoreCollectionType.Characters.rawValue).document()
        var characterWithTimestamp = character
        characterWithTimestamp.createdAt = Date().toString()
        try documentReference.setData(from: characterWithTimestamp)
    }

    func updateCharacter(character: Character, forId id: String, forUserId userId: String) async throws {
        let db = Firestore.firestore()
        let documentReference = db.collection(FirestoreCollectionType.Users.rawValue).document(userId).collection(FirestoreCollectionType.Characters.rawValue).document(id)
        var characterWithTimestamp = character
        characterWithTimestamp.updatedAt = Date().toString()
        try documentReference.setData(from: characterWithTimestamp, merge: true)
    }

    func deleteCharacter(forId id: String, forUserId userId: String) async throws {
        let character = try await getCharacter(forId: id, forUserId: userId)

        let db = Firestore.firestore()
        let documentReference = db.collection(FirestoreCollectionType.Users.rawValue).document(userId).collection(FirestoreCollectionType.Characters.rawValue).document(id)
        var characterWithTimestamp = character
        characterWithTimestamp.createdAt = Date().toString()
        try documentReference.setData(from: characterWithTimestamp)
    }
}

enum FirebaseFirestoreDataSourceError: Error {
    case CharacterParseError
}
