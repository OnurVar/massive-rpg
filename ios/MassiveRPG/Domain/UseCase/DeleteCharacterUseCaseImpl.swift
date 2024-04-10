//
//  DeleteCharacterUseCaseImpl.swift
//  MassiveRPG-Prod
//
//  Created by Onur Var on 10.04.2024.
//

class DeleteCharacterUseCaseImpl: DeleteCharacterUseCase {
    // MARK: Variables

    let characterRepository: CharacterRepository

    // MARK: Life Cycle

    init(characterRepository: CharacterRepository) {
        self.characterRepository = characterRepository
    }

    // MARK: Methods

    func execute(forId id: String) async -> Result<Void, Error> {
        return await characterRepository.delete(forId: id)
    }
}
