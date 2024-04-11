package com.onurvar.massiverpg.presentation.SignInScreen

import android.app.Application
import android.content.Intent
import android.widget.Toast
import androidx.activity.result.ActivityResult
import androidx.activity.result.ActivityResultLauncher
import androidx.activity.result.IntentSenderRequest
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.onurvar.massiverpg.R
import com.onurvar.massiverpg.domain.protocol.usecase.BeginSignInUseCase
import com.onurvar.massiverpg.domain.protocol.usecase.SignInUseCase
import com.onurvar.massiverpg.presentation.HomeScreen.HomeScreenView
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class SignInScreenViewModel @Inject constructor(
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

    fun handleSignInResult(activity: SignInScreenView, result: ActivityResult) {
        viewModelScope.launch {
            try {
                val signInIntent =
                    result.data ?: throw Exception("Something went wrong. Please try again later.")
                val user = signInUseCase.execute(signInIntent)
                Toast.makeText(
                    application.applicationContext,
                    "Welcome ${user.name}",
                    Toast.LENGTH_LONG
                ).show()

                val intent = Intent(activity, HomeScreenView::class.java)
                intent.flags = Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_CLEAR_TASK
                activity.startActivity(intent)
                activity.overridePendingTransition(
                    R.anim.animation_fade_in,
                    R.anim.animation_no_animation
                );
            } catch (e: Exception) {
                e.printStackTrace()
                Toast.makeText(application.applicationContext, e.message, Toast.LENGTH_LONG).show()
            }
        }

    }
}