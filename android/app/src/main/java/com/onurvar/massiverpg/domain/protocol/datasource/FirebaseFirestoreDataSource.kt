package com.onurvar.massiverpg.domain.protocol.datasource

import com.onurvar.massiverpg.domain.model.Character

interface FirebaseFirestoreDataSource {
    suspend fun getCharacterList(userId: String): List<Character>
}