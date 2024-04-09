package com.onurvar.massiverpg.domain.usecase

import com.onurvar.massiverpg.domain.protocol.repository.AuthRepository
import com.onurvar.massiverpg.domain.protocol.usecase.CheckSignedInUserUseCase
import javax.inject.Inject

class CheckSignedInUserUseCaseImpl @Inject constructor(
    private val authRepository: AuthRepository
) : CheckSignedInUserUseCase {
    override fun execute(): Boolean {
        return authRepository.checkSignedInUser()
    }
}