package com.onurvar.massiverpg.domain.protocol.usecase

import com.onurvar.massiverpg.domain.model.Character

interface GetCharacterListUseCase {
    suspend fun execute(): List<Character>
}