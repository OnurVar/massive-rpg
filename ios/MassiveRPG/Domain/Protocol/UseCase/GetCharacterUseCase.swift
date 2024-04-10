//
//  GetCharacterUseCase.swift
//  MassiveRPG-Prod
//
//  Created by Onur Var on 10.04.2024.
//

protocol GetCharacterUseCase {
    func execute(forId id: String) async -> Result<Character, Error>
}
