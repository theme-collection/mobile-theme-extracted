package com.iqonic.datingapp.activity

import android.os.Bundle
import com.iqonic.datingapp.R
import com.iqonic.datingapp.DABaseActivity
import com.iqonic.datingapp.fragments.DAExploreFragment
import com.iqonic.datingapp.fragments.DAHomeFragment
import com.iqonic.datingapp.fragments.DAMessagesFragment
import com.iqonic.datingapp.fragments.DAProfileFragment
import com.iqonic.datingapp.utils.color
import com.iqonic.datingapp.utils.lightStatusBar
import com.iqonic.datingapp.utils.replaceFragment
import kotlinx.android.synthetic.main.da_activity_dashboard.*

class DADashboardActivity : DABaseActivity() {

    var homeFragment = DAHomeFragment()
    var exploreFragment = DAExploreFragment()
    var messageFragment = DAMessagesFragment()
    var profileFragment = DAProfileFragment()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.da_activity_dashboard)
        lightStatusBar(color(R.color.da_white))
        replaceFragment(homeFragment, R.id.frameContainer)
        bottomNavigation.setOnNavigationItemSelectedListener {
            when (it.itemId) {
                R.id.menuHome -> {
                    replaceFragment(homeFragment, R.id.frameContainer)

                }
                R.id.menuExplore -> {
                    replaceFragment(exploreFragment, R.id.frameContainer)

                }
                R.id.menuMessages -> {
                    replaceFragment(messageFragment, R.id.frameContainer)

                }
                R.id.menuSettings -> {
                    replaceFragment(profileFragment, R.id.frameContainer)
                }
            }
            return@setOnNavigationItemSelectedListener true
        }
        bottomNavigation.itemIconTintList=null
    }
}
