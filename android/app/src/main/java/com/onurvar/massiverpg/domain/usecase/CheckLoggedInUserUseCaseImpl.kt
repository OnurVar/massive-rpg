package com.onurvar.massiverpg.domain.usecase

import com.onurvar.massiverpg.domain.repository.AuthRepository
import javax.inject.Inject

class CheckLoggedInUserUseCaseImpl @Inject constructor(
    private val authRepository: AuthRepository
) : CheckLoggedInUserUseCase {
    override fun execute(): Boolean {
        return authRepository.checkLoggedInUser()
    }
}