package com.onurvar.massiverpg.domain.datasource

import android.content.Intent
import android.content.IntentSender
import com.onurvar.massiverpg.domain.model.User

interface FirebaseDataSource {

    // Begin the sign in process. It returns an IntentSender if the process is successful.
    suspend fun beginSignIn(): IntentSender

    // Signs the user in with the given Intent.
    suspend fun signIn(intent: Intent): User

    // Check if the user is logged in. It returns true if the user is logged in, false otherwise.
    fun checkLoggedInUser(): Boolean

    // Signs the user out.
    suspend fun signOut()
}