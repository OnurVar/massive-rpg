package com.onurvar.massiverpg.data.repository

import android.app.Application
import android.content.Intent
import android.content.IntentSender
import com.onurvar.massiverpg.domain.protocol.datasource.FirebaseDataSource
import com.onurvar.massiverpg.domain.model.User
import com.onurvar.massiverpg.domain.protocol.repository.AuthRepository


class AuthRepositoryImpl(
    private val firebaseDataSource: FirebaseDataSource
) : AuthRepository {
    override suspend fun beginSignIn(): IntentSender {
        return firebaseDataSource.beginSignIn()
    }

    override suspend fun signIn(intent: Intent): User {
        return firebaseDataSource.signIn(intent)
    }

    override fun checkSignedInUser(): Boolean {
        return firebaseDataSource.checkSignedInUser()
    }

    override suspend fun signOut() {
        firebaseDataSource.signOut()
    }

}