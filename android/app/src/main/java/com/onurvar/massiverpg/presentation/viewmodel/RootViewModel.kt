package com.onurvar.massiverpg.presentation.viewmodel

import android.content.Intent
import androidx.lifecycle.ViewModel
import com.onurvar.massiverpg.R
import com.onurvar.massiverpg.domain.protocol.usecase.CheckSignedInUserUseCase
import com.onurvar.massiverpg.presentation.view.HomeActivity
import com.onurvar.massiverpg.presentation.view.RootActivity
import com.onurvar.massiverpg.presentation.view.SignInActivity
import dagger.hilt.android.lifecycle.HiltViewModel
import javax.inject.Inject

@HiltViewModel
class RootViewModel @Inject constructor(
    private val checkSignedInUserUseCase: CheckSignedInUserUseCase
) : ViewModel() {

    fun checkAndNavigate(activity: RootActivity) {
        val intent = if (checkSignedInUserUseCase.execute()) {
            Intent(activity, HomeActivity::class.java)
        } else {
            Intent(activity, SignInActivity::class.java)
        }
        intent.flags = Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_CLEAR_TASK
        activity.startActivity(intent)
        activity.overridePendingTransition(
            R.anim.animation_fade_in,
            R.anim.animation_no_animation
        );
        activity.finish()
    }
}