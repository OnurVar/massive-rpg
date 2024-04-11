package com.onurvar.massiverpg.presentation.Subviews.CharacterList

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import com.onurvar.massiverpg.R
import com.onurvar.massiverpg.domain.model.Character

class CharacterListAdapter(private val characters: List<Character>) :
    RecyclerView.Adapter<CharacterListAdapter.CharacterViewHolder>() {

    class CharacterViewHolder(val view: View) : RecyclerView.ViewHolder(view) {
        val nameTextView: TextView = view.findViewById(R.id.character_name)
        val descriptionTextView: TextView = view.findViewById(R.id.character_description)
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): CharacterViewHolder {
        val view =
            LayoutInflater.from(parent.context).inflate(R.layout.character_list_item, parent, false)
        return CharacterViewHolder(view)
    }

    override fun onBindViewHolder(holder: CharacterViewHolder, position: Int) {
        val character = characters[position]
        holder.nameTextView.text = character.name
        holder.descriptionTextView.text = character.name
    }

    override fun getItemCount() = characters.size
}