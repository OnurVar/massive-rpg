package com.onurvar.massiverpg.domain.protocol.repository

import android.content.Intent
import android.content.IntentSender
import com.onurvar.massiverpg.domain.model.User

interface AuthRepository {
    suspend fun beginSignIn(): IntentSender
    suspend fun signIn(intent: Intent): User
    fun checkSignedInUser(): Boolean
    suspend fun signOut()
}