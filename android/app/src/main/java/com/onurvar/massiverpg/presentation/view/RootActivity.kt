package com.onurvar.massiverpg.presentation.view

import android.content.Intent
import android.os.Bundle
import androidx.activity.viewModels
import androidx.appcompat.app.AppCompatActivity
import com.onurvar.massiverpg.R
import com.onurvar.massiverpg.presentation.viewmodel.RootViewModel
import dagger.hilt.android.AndroidEntryPoint


@AndroidEntryPoint
class RootActivity : AppCompatActivity() {
    private val viewModel: RootViewModel by viewModels()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
    }

    override fun onStart() {
        super.onStart()

        // Check if the user is logged in. If the user is logged in, start the HomeActivity. If the user is not logged in, start the SignInActivity.
        viewModel.checkAndNavigate(this)
    }
}