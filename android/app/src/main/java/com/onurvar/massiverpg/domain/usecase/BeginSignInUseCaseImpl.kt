package com.onurvar.massiverpg.domain.usecase

import android.content.IntentSender
import com.onurvar.massiverpg.domain.repository.AuthRepository
import javax.inject.Inject

class BeginSignInUseCaseImpl @Inject constructor(
    private val authRepository: AuthRepository
) : BeginSignInUseCase {
    override suspend fun execute(): IntentSender {
        return authRepository.beginSignIn()
    }
}