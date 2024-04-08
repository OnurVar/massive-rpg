package com.onurvar.massiverpg.domain.usecase

import com.onurvar.massiverpg.domain.repository.AuthRepository
import javax.inject.Inject

class SignOutUseCaseImpl @Inject constructor(
    private val authRepository: AuthRepository
) : SignOutUseCase {
    override suspend fun execute() {
        authRepository.signOut()
    }
}