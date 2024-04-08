package com.onurvar.massiverpg.presentation.viewmodel

import android.app.Application
import android.content.Context
import android.content.Intent
import android.widget.Toast
import androidx.lifecycle.ViewModel
import androidx.lifecycle.ViewModelProvider
import androidx.lifecycle.viewModelScope
import com.google.android.gms.auth.api.identity.Identity
import com.google.android.gms.auth.api.identity.SignInClient
import com.google.firebase.Firebase
import com.google.firebase.auth.auth
import com.onurvar.massiverpg.domain.usecase.CheckLoggedInUserUseCase
import com.onurvar.massiverpg.domain.usecase.SignOutUseCase
import com.onurvar.massiverpg.presentation.view.HomeActivity
import com.onurvar.massiverpg.presentation.view.RootActivity
import com.onurvar.massiverpg.presentation.view.SignInActivity
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.launch
import kotlinx.coroutines.tasks.await
import java.lang.Exception
import javax.inject.Inject

@HiltViewModel
class HomeViewModel @Inject constructor(
    private val application: Application,
    private val signOutUseCase: SignOutUseCase
) : ViewModel() {

    fun signOut(activity: HomeActivity) {
        viewModelScope.launch {
            try {
                signOutUseCase.execute()
                activity.startActivity(Intent(activity, RootActivity::class.java))
                activity.overridePendingTransition(
                    androidx.appcompat.R.anim.abc_fade_in,
                    androidx.constraintlayout.widget.R.anim.abc_slide_out_bottom
                );
                Toast.makeText(application.applicationContext, "Logged out", Toast.LENGTH_LONG).show()
            } catch (e: Exception) {
                e.printStackTrace()
                Toast.makeText(application.applicationContext, e.message, Toast.LENGTH_LONG).show()
            }
        }
    }
}