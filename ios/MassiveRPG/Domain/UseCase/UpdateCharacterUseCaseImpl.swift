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

    func execute(forId id: String, form: CharacterForm) async -> Result<Void, Error> {
        return await characterRepository.update(forId: id, form: form)
    }
}
