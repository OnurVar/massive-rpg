package com.onurvar.massiverpg.domain.protocol.usecase

import android.content.IntentSender

interface CheckSignedInUserUseCase {
    fun execute(): Boolean
}