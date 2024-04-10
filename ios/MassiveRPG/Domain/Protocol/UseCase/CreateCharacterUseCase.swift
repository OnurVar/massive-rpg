//
//  CreateCharacterUseCase.swift
//  MassiveRPG-Prod
//
//  Created by Onur Var on 10.04.2024.
//

protocol CreateCharacterUseCase {
    func execute(character: Character) async -> Result<Void, Error>
}
