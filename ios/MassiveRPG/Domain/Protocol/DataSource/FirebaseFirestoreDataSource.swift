//
//  FirebaseFirestoreDataSource.swift
//  MassiveRPG-Prod
//
//  Created by Onur Var on 10.04.2024.
//

protocol FirebaseFirestoreDataSource {
    func getCharacterList(forUserId userId: String) async throws -> [Character]
}
