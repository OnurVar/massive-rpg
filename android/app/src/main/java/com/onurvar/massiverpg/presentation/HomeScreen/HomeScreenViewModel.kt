package com.onurvar.massiverpg.presentation.HomeScreen

import android.app.ActivityOptions
import android.app.Application
import android.content.Intent
import android.widget.Toast
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.onurvar.massiverpg.R
import com.onurvar.massiverpg.domain.model.Character
import com.onurvar.massiverpg.domain.protocol.usecase.SignOutUseCase
import com.onurvar.massiverpg.presentation.SignInScreen.SignInScreenView
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.launch
import java.lang.Exception
import javax.inject.Inject

@HiltViewModel
class HomeScreenViewModel @Inject constructor(
    private val application: Application, private val signOutUseCase: SignOutUseCase
) : ViewModel() {

    // LiveData object for the characters
    val characters: MutableLiveData<List<Character>> = MutableLiveData()

    fun signOut(activity: HomeScreenView) {
        viewModelScope.launch {
            try {
                signOutUseCase.execute()
                val intent = Intent(activity, SignInScreenView::class.java)
                intent.flags = Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_CLEAR_TASK
                activity.overridePendingTransition(
                    R.anim.animation_fade_in,
                    R.anim.animation_no_animation
                );
                activity.startActivity(
                    intent,
                    ActivityOptions.makeSceneTransitionAnimation(activity).toBundle()
                )

                Toast.makeText(application.applicationContext, "Signed out", Toast.LENGTH_LONG)
                    .show()
            } catch (e: Exception) {
                e.printStackTrace()
                Toast.makeText(application.applicationContext, e.message, Toast.LENGTH_LONG).show()
            }
        }
    }
}