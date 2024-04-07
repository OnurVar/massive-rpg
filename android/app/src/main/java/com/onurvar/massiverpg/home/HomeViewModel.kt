package com.onurvar.massiverpg.home

import android.app.Application
import androidx.lifecycle.ViewModel
import androidx.lifecycle.ViewModelProvider
import com.google.android.gms.auth.api.identity.Identity
import com.google.android.gms.auth.api.identity.SignInClient
import com.google.firebase.Firebase
import com.google.firebase.auth.auth
import kotlinx.coroutines.tasks.await


class HomeViewModelFactory(
    private val application: Application
) : ViewModelProvider.Factory {
    fun create(): HomeViewModel {
        return HomeViewModel(application)
    }
}

class HomeViewModel(
    private val application: Application
) :
    ViewModel() {

    // Variables
    private val auth = Firebase.auth
    private val signInClient: SignInClient =
        Identity.getSignInClient(application.applicationContext)


    // Sign out the user
    suspend fun signOut() {
        signInClient.signOut().await()
        auth.signOut()
    }
}