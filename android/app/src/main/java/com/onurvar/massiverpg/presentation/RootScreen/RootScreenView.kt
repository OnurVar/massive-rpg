package com.onurvar.massiverpg.presentation.RootScreen

import android.os.Bundle
import androidx.activity.viewModels
import androidx.appcompat.app.AppCompatActivity
import com.onurvar.massiverpg.R
import dagger.hilt.android.AndroidEntryPoint


@AndroidEntryPoint
class RootScreenView : AppCompatActivity() {
    private val viewModel: RootScreenViewModel by viewModels()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_root)
    }

    override fun onStart() {
        super.onStart()

        // Check if the user is signed in. If the user is signed in, start the HomeScreen. If the user is not signed in, start the SignInActivity.
        viewModel.checkAndNavigate(this)
    }
}