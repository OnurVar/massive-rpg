package com.onurvar.massiverpg.data.datasource

import com.google.firebase.Firebase
import com.google.firebase.auth.auth
import com.onurvar.massiverpg.domain.protocol.datasource.UserContextDataSource

class UserContextDataSourceImpl : UserContextDataSource {
    private val auth = Firebase.auth

    override fun getCurrentUserId(): String? {
        return auth.currentUser?.uid
    }

}