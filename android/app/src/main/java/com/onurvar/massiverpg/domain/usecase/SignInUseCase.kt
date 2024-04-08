package com.onurvar.massiverpg.domain.usecase

import android.content.Intent
import com.onurvar.massiverpg.domain.model.User

interface SignInUseCase {
    suspend fun execute(intent: Intent): User
}