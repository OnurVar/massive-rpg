package com.onurvar.massiverpg.data.repository

import com.onurvar.massiverpg.domain.model.Character
import com.onurvar.massiverpg.domain.protocol.datasource.FirebaseAuthDataSource
import com.onurvar.massiverpg.domain.protocol.datasource.FirebaseFirestoreDataSource
import com.onurvar.massiverpg.domain.protocol.datasource.UserContextDataSource
import com.onurvar.massiverpg.domain.protocol.repository.CharacterRepository

class CharacterRepositoryImpl(
    private val firebaseFirestoreDataSource: FirebaseFirestoreDataSource,
    private var userContextDataSource: UserContextDataSource
) : CharacterRepository {
    override suspend fun getCharacterList(): List<Character> {
        val userId =
            userContextDataSource.getCurrentUserId() ?: throw Exception("Current user not found!")
        return firebaseFirestoreDataSource.getCharacterList(userId)
    }
}   