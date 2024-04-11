package com.onurvar.massiverpg.presentation.SignInScreen

import android.os.Bundle
import androidx.activity.result.contract.ActivityResultContracts
import androidx.activity.viewModels
import androidx.appcompat.app.AppCompatActivity
import com.google.android.gms.common.SignInButton
import com.onurvar.massiverpg.R
import dagger.hilt.android.AndroidEntryPoint

@AndroidEntryPoint
class SignInScreenView : AppCompatActivity() {
    private val viewModel: SignInScreenViewModel by viewModels()

    private val signInResultLauncher =
        registerForActivityResult(ActivityResultContracts.StartIntentSenderForResult()) { result ->
            viewModel.handleSignInResult(this, result)
        }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_sign_in)

        val signInButton = findViewById<SignInButton>(R.id.sign_in_button)
        signInButton.setOnClickListener {
            viewModel.beginSignIn(signInResultLauncher)
        }
    }


}