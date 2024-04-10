package com.onurvar.massiverpg.data.repository

import android.app.Application
import android.content.Intent
import android.content.IntentSender
import com.onurvar.massiverpg.domain.protocol.datasource.FirebaseAuthDataSource
import com.onurvar.massiverpg.domain.model.User
import com.onurvar.massiverpg.domain.protocol.repository.AuthRepository


class AuthRepositoryImpl(
    private val firebaseAuthDataSource: FirebaseAuthDataSource
) : AuthRepository {
    override suspend fun beginSignIn(): IntentSender {
        return firebaseAuthDataSource.beginSignIn()
    }

    override suspend fun signIn(intent: Intent): User {
        return firebaseAuthDataSource.signIn(intent)
    }

    override fun checkSignedInUser(): Boolean {
        return firebaseAuthDataSource.checkSignedInUser()
    }

    override suspend fun signOut() {
        firebaseAuthDataSource.signOut()
    }

}