package com.onurvar.massiverpg.data.repository

import com.onurvar.massiverpg.domain.model.Character
import com.onurvar.massiverpg.domain.protocol.datasource.FirebaseAuthDataSource
import com.onurvar.massiverpg.domain.protocol.datasource.FirebaseFirestoreDataSource
import com.onurvar.massiverpg.domain.protocol.repository.CharacterRepository

class CharacterRepositoryImpl(
    private var firebaseAuthDataSource: FirebaseAuthDataSource,
    private val firebaseFirestoreDataSource: FirebaseFirestoreDataSource
) : CharacterRepository {
    override suspend fun getCharacterList(): List<Character> {
        val userId = firebaseAuthDataSource.getUserId() ?: throw Exception("Current user not found!")
        return firebaseFirestoreDataSource.getCharacterList(userId)
    }
}   