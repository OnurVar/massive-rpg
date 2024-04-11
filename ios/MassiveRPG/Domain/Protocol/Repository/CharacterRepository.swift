//
//  CharacterRepository.swift
//  MassiveRPG-Prod
//
//  Created by Onur Var on 10.04.2024.
//

protocol CharacterRepository {
    // Get all characters
    func getList() async -> Result<[Character], Error>
    // Get character by id
    func get(forId id: String) async -> Result<Character, Error>
    // Create character with form
    func create(form: CharacterForm) async -> Result<Void, Error>
    // Update character with form
    func update(forId id: String, form: CharacterForm) async -> Result<Void, Error>
    // Delete character by id
    func delete(forId id: String) async -> Result<Void, Error>
}
