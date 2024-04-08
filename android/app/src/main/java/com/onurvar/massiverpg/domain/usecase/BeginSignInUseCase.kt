package com.onurvar.massiverpg.domain.usecase

import android.content.IntentSender

interface BeginSignInUseCase {
    suspend fun execute(): IntentSender
}
