package com.onurvar.massiverpg.domain.protocol.repository

import com.onurvar.massiverpg.domain.model.Character

interface CharacterRepository {
    // Get the list of characters
    suspend fun getCharacterList(): List<Character>
}