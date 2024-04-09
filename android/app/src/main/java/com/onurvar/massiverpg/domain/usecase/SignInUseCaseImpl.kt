package com.onurvar.massiverpg.domain.usecase

import android.content.Intent
import com.onurvar.massiverpg.domain.model.User
import com.onurvar.massiverpg.domain.protocol.repository.AuthRepository
import com.onurvar.massiverpg.domain.protocol.usecase.SignInUseCase
import javax.inject.Inject

class SignInUseCaseImpl @Inject constructor(
    private val authRepository: AuthRepository
) : SignInUseCase {
    override suspend fun execute(intent: Intent): User {
        return authRepository.signIn(intent)
    }
}