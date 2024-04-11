package com.onurvar.massiverpg.presentation.HomeScreen

import android.app.ActivityOptions
import android.app.Application
import android.content.Intent
import android.widget.Toast
import androidx.lifecycle.MediatorLiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.Observer
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import androidx.swiperefreshlayout.widget.SwipeRefreshLayout
import com.onurvar.massiverpg.R
import com.onurvar.massiverpg.domain.model.Character
import com.onurvar.massiverpg.domain.protocol.usecase.GetCharacterListUseCase
import com.onurvar.massiverpg.domain.protocol.usecase.SignOutUseCase
import com.onurvar.massiverpg.presentation.SignInScreen.SignInScreenView
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.launch
import java.lang.Exception
import javax.inject.Inject

@HiltViewModel
class HomeScreenViewModel @Inject constructor(
    private val application: Application,
    private val getCharacterListUseCase: GetCharacterListUseCase,
    private val signOutUseCase: SignOutUseCase
) : ViewModel() {

    // LiveData object for the characters
    val characters: MediatorLiveData<List<Character>> = MediatorLiveData()
    private var originalCharacters: List<Character> = emptyList()
    val searchQuery = MutableLiveData<String>()

    init {
        characters.addSource(searchQuery) { filterCharacters() }
    }

    fun signOut(activity: HomeScreenView) {
        viewModelScope.launch {
            try {

                // Sign out
                signOutUseCase.execute()

                // Navigate to sign in screen
                val intent = Intent(activity, SignInScreenView::class.java)
                intent.flags = Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_CLEAR_TASK
                activity.overridePendingTransition(
                    R.anim.animation_fade_in, R.anim.animation_no_animation
                );
                activity.startActivity(
                    intent, ActivityOptions.makeSceneTransitionAnimation(activity).toBundle()
                )

                Toast.makeText(application.applicationContext, "Signed out", Toast.LENGTH_LONG)
                    .show()
            } catch (e: Exception) {
                e.printStackTrace()
                Toast.makeText(application.applicationContext, e.message, Toast.LENGTH_LONG).show()
            }
        }
    }

    fun loadCharacters(swipeRefreshLayout: SwipeRefreshLayout) {

        // Show the loading indicator
        swipeRefreshLayout.isRefreshing = true

        // Execute the use case
        viewModelScope.launch {
            try {

                // Get the character list
                val response = getCharacterListUseCase.execute()

                // Cache the originals
                originalCharacters = response

                // Filter characters with the search query
                filterCharacters()

                // Hide the loading indicator
                swipeRefreshLayout.isRefreshing = false
            } catch (e: Exception) {
                e.printStackTrace()
                Toast.makeText(application.applicationContext, e.message, Toast.LENGTH_LONG).show()
                swipeRefreshLayout.isRefreshing = false
            }
        }
    }

    private fun filterCharacters() {

        // Filter characters with the search query
        val query = searchQuery.value ?: ""

        // Update the characters LiveData
        characters.value = originalCharacters.filter {
            it.name?.contains(query, ignoreCase = true) ?: false
        }
    }
}