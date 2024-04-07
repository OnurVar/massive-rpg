package com.onurvar.massiverpg.home

import android.content.Intent
import android.graphics.Color
import android.os.Bundle
import android.view.Menu
import android.view.MenuItem
import androidx.appcompat.app.AppCompatActivity
import androidx.lifecycle.lifecycleScope
import com.onurvar.massiverpg.MainActivity
import com.onurvar.massiverpg.R
import kotlinx.coroutines.launch
import java.lang.Exception


class HomeActivity : AppCompatActivity() {
    private lateinit var viewModel: HomeViewModel

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(com.onurvar.massiverpg.R.layout.activity_main)

        viewModel = HomeViewModelFactory(application).create()
    }

    override fun onCreateOptionsMenu(menu: Menu?): Boolean {
        super.onCreateOptionsMenu(menu)
        menuInflater.inflate(R.menu.home_activity_top_navigation_menu, menu)
        return true
    }


    override fun onOptionsItemSelected(item: MenuItem): Boolean {
        if (item.itemId == R.id.action_logout) {
            lifecycleScope.launch {
                try {
                    viewModel.signOut()
                    val activity = this@HomeActivity
                    startActivity(Intent(activity, MainActivity::class.java))
                    overridePendingTransition(
                        androidx.appcompat.R.anim.abc_fade_in,
                        androidx.constraintlayout.widget.R.anim.abc_slide_out_bottom
                    );
                } catch (e: Exception) {
                    e.printStackTrace()
                }
            }
        }
        return super.onOptionsItemSelected(item)
    }
}