package com.onurvar.massiverpg.domain.protocol.datasource

import android.content.Intent
import android.content.IntentSender
import com.onurvar.massiverpg.domain.model.User

interface FirebaseAuthDataSource {

    // Begin the sign in process. It returns an IntentSender if the process is successful.
    suspend fun beginSignIn(): IntentSender

    // Signs the user in with the given Intent.
    suspend fun signIn(intent: Intent): User

    // Check if the user is signed in. It returns true if the user is signed in, false otherwise.
    fun checkSignedInUser(): Boolean

    // Signs the user out.
    suspend fun signOut()

    fun getUserId(): String?
}