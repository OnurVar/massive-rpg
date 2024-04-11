package com.onurvar.massiverpg.domain.protocol.repository

import com.onurvar.massiverpg.domain.model.Character

interface CharacterRepository {
    suspend fun getCharacterList(): List<Character>
}