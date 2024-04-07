package com.onurvar.massiverpg.signin

import android.app.Application
import android.content.Intent
import android.content.IntentSender
import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import androidx.lifecycle.ViewModelProvider
import com.google.android.gms.auth.api.identity.BeginSignInRequest
import com.google.android.gms.auth.api.identity.BeginSignInResult
import com.google.android.gms.auth.api.identity.Identity
import com.google.android.gms.auth.api.identity.SignInClient
import com.google.firebase.Firebase
import com.google.firebase.auth.GoogleAuthProvider
import com.google.firebase.auth.auth
import kotlinx.coroutines.tasks.await
import com.onurvar.massiverpg.R
import kotlinx.coroutines.CancellationException
import java.lang.Exception

class SignInViewModelFactory(
    private val application: Application
) : ViewModelProvider.Factory {
    fun create(): SignInViewModel {
        return SignInViewModel(application)
    }
}

class SignInViewModel(
    private val application: Application
) :
    ViewModel() {

    // Variables
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


    // Methods

    // Begin the sign in process. It returns an IntentSender if the process is successful.
    suspend fun beginSignIn(): IntentSender {
        val result = signInClient.beginSignIn(signInRequest).await()
        return result.pendingIntent.intentSender
    }

    // Signs the user in with the given Intent.
    suspend fun signIn(intent: Intent) {
        val credential = signInClient.getSignInCredentialFromIntent(intent)
        val googleIdToken = credential.googleIdToken
        val googleCredential = GoogleAuthProvider.getCredential(googleIdToken, null)
        auth.signInWithCredential(googleCredential).await()
    }
}