//
//  CreateCharacterUseCase.swift
//  MassiveRPG-Prod
//
//  Created by Onur Var on 10.04.2024.
//

protocol CreateCharacterUseCase {
    func execute(form: CharacterForm) async -> Result<Void, Error>
}
