package com.onurvar.massiverpg.presentation.Subviews.CharacterList

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import androidx.compose.ui.text.capitalize
import androidx.recyclerview.widget.RecyclerView
import com.onurvar.massiverpg.R
import com.onurvar.massiverpg.domain.model.Character

class CharacterListAdapter(private var characters: List<Character>) :
    RecyclerView.Adapter<CharacterListAdapter.CharacterViewHolder>() {

    class CharacterViewHolder(val view: View) : RecyclerView.ViewHolder(view) {
        val title: TextView = view.findViewById(R.id.title)
        val subtitle: TextView = view.findViewById(R.id.subtitle)
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): CharacterViewHolder {
        val view =
            LayoutInflater.from(parent.context).inflate(R.layout.character_list_item, parent, false)
        return CharacterViewHolder(view)
    }

    override fun onBindViewHolder(holder: CharacterViewHolder, position: Int) {
        val character = characters[position]
        holder.title.text = character.name
        holder.subtitle.text =
            "${character.cRace?.capitalize() ?: ""} / ${character.cClass?.capitalize() ?: ""}"
    }

    override fun getItemCount() = characters.size

    fun updateCharacters(newItems: List<Character>) {
        characters = newItems
        notifyDataSetChanged()
    }
}