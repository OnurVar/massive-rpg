//
//  DeleteCharacterUseCase.swift
//  MassiveRPG-Prod
//
//  Created by Onur Var on 10.04.2024.
//

protocol DeleteCharacterUseCase {
    func execute(forId id: String) async -> Result<Void, Error>
}
