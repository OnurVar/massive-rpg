//
//  UpdateCharacterUseCase.swift
//  MassiveRPG-Prod
//
//  Created by Onur Var on 10.04.2024.
//

protocol UpdateCharacterUseCase {
    func execute(character: Character, forId id: String) async -> Result<Void, Error>
}
