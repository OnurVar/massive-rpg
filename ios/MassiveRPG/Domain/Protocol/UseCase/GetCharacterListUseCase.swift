//
//  GetCharacterListUseCase.swift
//  MassiveRPG-Prod
//
//  Created by Onur Var on 10.04.2024.
//

protocol GetCharacterListUseCase {
    func execute() async -> Result<[Character], Error>
}
