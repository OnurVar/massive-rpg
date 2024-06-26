package com.onurvar.massiverpg.presentation.RootScreen

import android.content.Intent
import androidx.lifecycle.ViewModel
import com.onurvar.massiverpg.R
import com.onurvar.massiverpg.domain.protocol.usecase.CheckSignedInUserUseCase
import com.onurvar.massiverpg.presentation.HomeScreen.HomeScreenView
import com.onurvar.massiverpg.presentation.SignInScreen.SignInScreenView
import dagger.hilt.android.lifecycle.HiltViewModel
import javax.inject.Inject

@HiltViewModel
class RootScreenViewModel @Inject constructor(
    private val checkSignedInUserUseCase: CheckSignedInUserUseCase
) : ViewModel() {

    fun checkAndNavigate(activity: RootScreenView) {
        val intent = if (checkSignedInUserUseCase.execute()) {
            Intent(activity, HomeScreenView::class.java)
        } else {
            Intent(activity, SignInScreenView::class.java)
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