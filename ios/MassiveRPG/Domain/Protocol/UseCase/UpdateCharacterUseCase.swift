//
//  UpdateCharacterUseCase.swift
//  MassiveRPG-Prod
//
//  Created by Onur Var on 10.04.2024.
//

protocol UpdateCharacterUseCase {
    func execute(forId id: String, form: CharacterForm) async -> Result<Void, Error>
}
