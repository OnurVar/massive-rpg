package com.onurvar.massiverpg.domain.protocol.datasource

import com.onurvar.massiverpg.domain.model.Character

interface FirebaseFirestoreDataSource {

    // Get the list of characters for the user
    suspend fun getCharacterList(userId: String): List<Character>
}