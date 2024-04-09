package com.onurvar.massiverpg.domain.protocol.usecase

import android.content.IntentSender

interface BeginSignInUseCase {
    suspend fun execute(): IntentSender
}
