package com.onurvar.massiverpg.presentation.viewmodel

import android.app.Activity
import android.content.Context
import android.content.Intent
import androidx.lifecycle.ViewModel
import com.onurvar.massiverpg.domain.usecase.CheckLoggedInUserUseCase
import com.onurvar.massiverpg.presentation.view.HomeActivity
import com.onurvar.massiverpg.presentation.view.RootActivity
import com.onurvar.massiverpg.presentation.view.SignInActivity
import dagger.hilt.android.lifecycle.HiltViewModel
import javax.inject.Inject

@HiltViewModel
class RootViewModel @Inject constructor(
    private val checkLoggedInUserUseCase: CheckLoggedInUserUseCase
) : ViewModel() {

    fun checkAndNavigate(activity: RootActivity) {
        val intent = if (checkLoggedInUserUseCase.execute()) {
            Intent(activity, HomeActivity::class.java)
        } else {
            Intent(activity, SignInActivity::class.java)
        }
        activity.startActivity(intent)
    }
}