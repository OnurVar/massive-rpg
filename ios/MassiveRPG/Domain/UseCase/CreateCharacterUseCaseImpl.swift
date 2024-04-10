//
//  CreateCharacterUseCase.swift
//  MassiveRPG-Prod
//
//  Created by Onur Var on 10.04.2024.
//

class CreateCharacterUseCaseImpl: CreateCharacterUseCase {
    // MARK: Variables

    let characterRepository: CharacterRepository

    // MARK: Life Cycle

    init(characterRepository: CharacterRepository) {
        self.characterRepository = characterRepository
    }

    // MARK: Methods

    func execute(character: Character) async -> Result<Void, Error> {
        return await characterRepository.create(character: character)
    }
}
