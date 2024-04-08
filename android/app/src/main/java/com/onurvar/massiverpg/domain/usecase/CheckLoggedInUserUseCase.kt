package com.onurvar.massiverpg.domain.usecase

import android.content.IntentSender

interface CheckLoggedInUserUseCase {
    fun execute(): Boolean
}