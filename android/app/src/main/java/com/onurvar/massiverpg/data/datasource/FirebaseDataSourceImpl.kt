package com.onurvar.massiverpg.data.datasource

import android.app.Application
import android.content.Intent
import android.content.IntentSender
import com.google.android.gms.auth.api.identity.BeginSignInRequest
import com.google.android.gms.auth.api.identity.Identity
import com.google.android.gms.auth.api.identity.SignInClient
import com.google.firebase.Firebase
import com.google.firebase.auth.GoogleAuthProvider
import com.google.firebase.auth.auth
import com.onurvar.massiverpg.R
import com.onurvar.massiverpg.domain.datasource.FirebaseDataSource
import com.onurvar.massiverpg.domain.model.User
import kotlinx.coroutines.tasks.await

class FirebaseDataSourceImpl(
    private val application: Application
) : FirebaseDataSource {

    private val auth = Firebase.auth
    private val signInClient: SignInClient =
        Identity.getSignInClient(application.applicationContext)
    private val signInRequest: BeginSignInRequest = BeginSignInRequest.builder()
        .setGoogleIdTokenRequestOptions(
            BeginSignInRequest.GoogleIdTokenRequestOptions.builder()
                .setSupported(true)
                .setFilterByAuthorizedAccounts(false)
                .setServerClientId(application.applicationContext.getString(R.string.default_web_client_id))
                .build()
        )
        .setAutoSelectEnabled(true)
        .build()

    override suspend fun beginSignIn(): IntentSender {

        // Begin the sign in flow
        val result = signInClient.beginSignIn(signInRequest).await()
        
        // Return the intent sender
        return result.pendingIntent.intentSender
    }

    override suspend fun signIn(intent: Intent): User {

        // Get the user's credential from the intent
        val credential = signInClient.getSignInCredentialFromIntent(intent)

        // Get the user's Google ID token
        val googleIdToken = credential.googleIdToken

        // Create a Google credential
        val googleCredential = GoogleAuthProvider.getCredential(googleIdToken, null)

        // Sign in with the Google credential
        val signInResult = auth.signInWithCredential(googleCredential).await()

        // Get the signed in user. If the user is null, throw an exception
        val user = signInResult.user ?: throw Exception("User is not signed in")

        // Return the user
        return User(user.uid, user.displayName, user.email, user.photoUrl.toString())
    }

    override fun checkLoggedInUser(): Boolean {
        return auth.currentUser != null
    }

    override suspend fun signOut() {
        signInClient.signOut().await()
        auth.signOut()
    }
}