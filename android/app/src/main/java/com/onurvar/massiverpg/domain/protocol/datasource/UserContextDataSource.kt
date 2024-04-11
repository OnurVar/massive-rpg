package com.onurvar.massiverpg.domain.protocol.datasource

interface  UserContextDataSource {

    // Get the current user ID
    fun getCurrentUserId(): String?
}