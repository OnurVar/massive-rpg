package com.onurvar.massiverpg.domain.usecase

import android.content.IntentSender
import com.onurvar.massiverpg.domain.protocol.repository.AuthRepository
import com.onurvar.massiverpg.domain.protocol.usecase.BeginSignInUseCase
import javax.inject.Inject

class BeginSignInUseCaseImpl @Inject constructor(
    private val authRepository: AuthRepository
) : BeginSignInUseCase {
    override suspend fun execute(): IntentSender {
        return authRepository.beginSignIn()
    }
}