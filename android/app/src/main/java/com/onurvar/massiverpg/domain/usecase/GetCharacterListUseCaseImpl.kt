
package com.onurvar.massiverpg.domain.usecase

import com.onurvar.massiverpg.domain.model.Character
import com.onurvar.massiverpg.domain.protocol.repository.CharacterRepository
import com.onurvar.massiverpg.domain.protocol.usecase.GetCharacterListUseCase

class GetCharacterListUseCaseImpl(
    private val characterRepository: CharacterRepository
) : GetCharacterListUseCase {
    override suspend fun execute(): List<Character> {
        return characterRepository.getCharacterList()
    }
}