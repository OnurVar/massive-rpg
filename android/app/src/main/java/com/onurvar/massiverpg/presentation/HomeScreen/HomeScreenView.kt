package com.onurvar.massiverpg.presentation.HomeScreen

import android.os.Bundle
import android.view.Menu
import android.view.MenuItem
import androidx.activity.viewModels
import androidx.appcompat.app.AppCompatActivity
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.onurvar.massiverpg.R
import com.onurvar.massiverpg.presentation.Subviews.CharacterList.CharacterListAdapter
import dagger.hilt.android.AndroidEntryPoint


@AndroidEntryPoint
class HomeScreenView : AppCompatActivity() {
    private val viewModel: HomeScreenViewModel by viewModels()
    private val characterListAdapter = CharacterListAdapter(emptyList())

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_home)

        val recyclerView = findViewById<RecyclerView>(R.id.recycler_view)
        recyclerView.layoutManager = LinearLayoutManager(this)
        recyclerView.adapter = characterListAdapter


        // Observe characters LiveData
        viewModel.characters.observe(this, { characters ->
            characterListAdapter.upd
            characterListAdapte.notifyDataSetChanged()
        })

        // Load characters
        viewModel.loadCharacters()
    }

    override fun onCreateOptionsMenu(menu: Menu?): Boolean {
        super.onCreateOptionsMenu(menu)
        menuInflater.inflate(R.menu.home_activity_top_navigation_menu, menu)
        return true
    }


    override fun onOptionsItemSelected(item: MenuItem): Boolean {
        if (item.itemId == R.id.action_sign_out) {
            viewModel.signOut(this)
        }
        return super.onOptionsItemSelected(item)
    }

}