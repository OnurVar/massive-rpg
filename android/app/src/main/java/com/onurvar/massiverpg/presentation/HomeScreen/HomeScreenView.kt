package com.onurvar.massiverpg.presentation.HomeScreen

import android.os.Bundle
import android.view.Menu
import android.view.MenuItem
import androidx.activity.viewModels
import androidx.appcompat.app.AppCompatActivity
import androidx.appcompat.widget.SearchView
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import androidx.swiperefreshlayout.widget.SwipeRefreshLayout
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

        // Set up RecyclerView
        val recyclerView = findViewById<RecyclerView>(R.id.recycler_view)
        recyclerView.layoutManager = LinearLayoutManager(this)
        recyclerView.adapter = characterListAdapter

        // Observe characters LiveData
        viewModel.characters.observe(this) { characters ->
            characterListAdapter.updateCharacters(characters)
        }

        // Set up SwipeRefreshLayout
        val swipeRefreshLayout = findViewById<SwipeRefreshLayout>(R.id.swipe_refresh_layout)
        swipeRefreshLayout.setOnRefreshListener {
            viewModel.loadCharacters(swipeRefreshLayout)
        }

        // Load characters
        viewModel.loadCharacters(swipeRefreshLayout)
    }

    override fun onCreateOptionsMenu(menu: Menu?): Boolean {
        super.onCreateOptionsMenu(menu)
        menuInflater.inflate(R.menu.home_activity_top_navigation_menu, menu)

        // Set up search bar
        val searchItem = menu?.findItem(R.id.action_search)
        val searchView = searchItem?.actionView as SearchView
        searchView.setOnQueryTextListener(object : SearchView.OnQueryTextListener {
            override fun onQueryTextSubmit(query: String?): Boolean {
                return false
            }

            override fun onQueryTextChange(newText: String?): Boolean {
                viewModel.searchQuery.value = newText
                return false
            }
        })

        return super.onCreateOptionsMenu(menu)
    }


    override fun onOptionsItemSelected(item: MenuItem): Boolean {
        if (item.itemId == R.id.action_sign_out) {
            viewModel.signOut(this)
        }
        return super.onOptionsItemSelected(item)
    }

}