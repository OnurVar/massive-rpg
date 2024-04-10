//
//  UpdateCharacterUseCaseImpl.swift
//  MassiveRPG-Prod
//
//  Created by Onur Var on 10.04.2024.
//

class UpdateCharacterUseCaseImpl: UpdateCharacterUseCase {
    // MARK: Variables

    let characterRepository: CharacterRepository

    // MARK: Life Cycle

    init(characterRepository: CharacterRepository) {
        self.characterRepository = characterRepository
    }

    // MARK: Methods

    func execute(character: Character, forId id: String) async -> Result<Void, Error> {
        return await characterRepository.update(character: character, forId: id)
    }
}
