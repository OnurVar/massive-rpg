package com.onurvar.massiverpg.data.datasource

import com.google.firebase.Firebase
import com.google.firebase.firestore.Query
import com.google.firebase.firestore.firestore
import com.onurvar.massiverpg.domain.protocol.datasource.FirebaseFirestoreDataSource
import com.onurvar.massiverpg.domain.model.Character
import kotlinx.coroutines.tasks.await

class FirebaseFirestoreDataSourceImpl : FirebaseFirestoreDataSource {
    override suspend fun getCharacterList(userId: String): List<Character> {
        val db = Firebase.firestore
        val snapshot = db
            .collection("users")
            .document(userId)
            .collection("characters")
            .whereEqualTo("is_deleted", false)
            .orderBy("updated_at", Query.Direction.DESCENDING)
            .get()
            .await()
        return snapshot.toObjects(Character::class.java)
    }

}