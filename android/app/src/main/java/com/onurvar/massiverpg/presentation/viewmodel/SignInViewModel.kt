package com.onurvar.massiverpg.presentation.viewmodel

import android.app.Activity
import android.app.Application
import android.content.Intent
import android.content.IntentSender
import android.widget.Toast
import androidx.activity.result.ActivityResult
import androidx.activity.result.ActivityResultLauncher
import androidx.activity.result.IntentSenderRequest
import androidx.lifecycle.ViewModel
import androidx.lifecycle.ViewModelProvider
import androidx.lifecycle.viewModelScope
import com.google.android.gms.auth.api.identity.BeginSignInRequest
import com.google.android.gms.auth.api.identity.Identity
import com.google.android.gms.auth.api.identity.SignInClient
import com.google.firebase.Firebase
import com.google.firebase.auth.GoogleAuthProvider
import com.google.firebase.auth.auth
import kotlinx.coroutines.tasks.await
import com.onurvar.massiverpg.R
import com.onurvar.massiverpg.domain.usecase.BeginSignInUseCase
import com.onurvar.massiverpg.domain.usecase.SignInUseCase
import com.onurvar.massiverpg.presentation.view.HomeActivity
import com.onurvar.massiverpg.presentation.view.SignInActivity
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class SignInViewModel @Inject constructor(
    private val application: Application,
    private val beginSignInUseCase: BeginSignInUseCase,
    private val signInUseCase: SignInUseCase
) :
    ViewModel() {


    fun beginSignIn(signInResultLauncher: ActivityResultLauncher<IntentSenderRequest>) {
        viewModelScope.launch {
            val intentSender = beginSignInUseCase.execute()
            signInResultLauncher.launch(IntentSenderRequest.Builder(intentSender).build())
        }
    }

    fun handleSignInResult(activity: SignInActivity, result: ActivityResult) {
        viewModelScope.launch {
            try {
                val intent =
                    result.data ?: throw Exception("Something went wrong. Please try again later.")
                val user = signInUseCase.execute(intent)
                Toast.makeText(
                    application.applicationContext,
                    "Welcome ${user.name}",
                    Toast.LENGTH_LONG
                ).show()
                activity.startActivity(Intent(activity, HomeActivity::class.java))
                activity.overridePendingTransition(
                    androidx.appcompat.R.anim.abc_slide_in_bottom,
                    androidx.constraintlayout.widget.R.anim.abc_fade_out
                );
            } catch (e: Exception) {
                e.printStackTrace()
                Toast.makeText(application.applicationContext, e.message, Toast.LENGTH_LONG).show()
            }
        }

    }
}