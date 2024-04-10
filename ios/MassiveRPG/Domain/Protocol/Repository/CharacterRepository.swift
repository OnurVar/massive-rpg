//
//  CharacterRepository.swift
//  MassiveRPG-Prod
//
//  Created by Onur Var on 10.04.2024.
//

protocol CharacterRepository {
    func getList() async -> Result<[Character], Error>
    func get(forId id: String) async -> Result<Character, Error>
    func create(character: Character) async -> Result<Void, Error>
    func update(character: Character, forId id: String) async -> Result<Void, Error>
    func delete(forId id: String) async -> Result<Void, Error>
}
