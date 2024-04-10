//
//  GetCharacterUseCase.swift
//  MassiveRPG-Prod
//
//  Created by Onur Var on 10.04.2024.
//

class GetCharacterUseCaseImpl: GetCharacterUseCase {
    // MARK: Variables

    let characterRepository: CharacterRepository

    // MARK: Life Cycle

    init(characterRepository: CharacterRepository) {
        self.characterRepository = characterRepository
    }

    // MARK: Methods

    func execute(forId id: String) async -> Result<Character, Error> {
        return await characterRepository.get(forId: id)
    }
}
