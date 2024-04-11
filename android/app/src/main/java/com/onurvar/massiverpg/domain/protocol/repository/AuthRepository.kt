package com.onurvar.massiverpg.domain.protocol.repository

import android.content.Intent
import android.content.IntentSender
import com.onurvar.massiverpg.domain.model.User

interface AuthRepository {
    // Begin the sign-in process
    suspend fun beginSignIn(): IntentSender

    // Complete the sign-in process
    suspend fun signIn(intent: Intent): User

    // Check if a user is signed in
    fun checkSignedInUser(): Boolean

    // Sign out the current user
    suspend fun signOut()
}