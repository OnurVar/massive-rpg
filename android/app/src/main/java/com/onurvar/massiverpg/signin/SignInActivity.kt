package com.onurvar.massiverpg.signin

import android.app.Activity
import android.content.Intent
import android.os.Bundle
import androidx.activity.result.IntentSenderRequest
import androidx.activity.result.contract.ActivityResultContracts
import androidx.appcompat.app.AppCompatActivity
import androidx.lifecycle.lifecycleScope
import com.google.android.gms.common.SignInButton
import com.onurvar.massiverpg.MainActivity
import com.onurvar.massiverpg.R
import kotlinx.coroutines.launch
import java.lang.Exception

class SignInActivity : AppCompatActivity() {
    private lateinit var viewModel: SignInViewModel
    private val signInResultLauncher =
        registerForActivityResult(ActivityResultContracts.StartIntentSenderForResult()) { result ->
            if (result.resultCode == Activity.RESULT_OK) {
                val intent = result.data
                if (intent != null) {
                    lifecycleScope.launch {
                        try {
                            viewModel.signIn(intent)
                            startActivity(Intent(this@SignInActivity, MainActivity::class.java))
                            overridePendingTransition(
                                androidx.appcompat.R.anim.abc_slide_in_bottom,
                                androidx.constraintlayout.widget.R.anim.abc_fade_out
                            );
                            println(result)
                        } catch (e: Exception) {
                            e.printStackTrace()
                        }
                    }
                }
            }
        }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_sign_in)

        viewModel = SignInViewModelFactory(application).create()

        val signInButton = findViewById<SignInButton>(R.id.sign_in_button)
        signInButton.setOnClickListener {
            signInWithGoogle()
        }
    }

    private fun signInWithGoogle() {
        lifecycleScope.launch {
            try {
                val result = viewModel.beginSignIn()
                signInResultLauncher.launch(IntentSenderRequest.Builder(result).build())
            } catch (e: Exception) {
                e.printStackTrace()
            }

        }
    }
}