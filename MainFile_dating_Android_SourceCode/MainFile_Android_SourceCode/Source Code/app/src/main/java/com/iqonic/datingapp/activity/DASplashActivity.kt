package com.iqonic.datingapp.activity

import android.os.Bundle
import android.os.Handler
import com.iqonic.datingapp.R
import com.iqonic.datingapp.DABaseActivity
import com.iqonic.datingapp.utils.launchActivityWithNewTask
import com.iqonic.datingapp.utils.makeGradient
import kotlinx.android.synthetic.main.da_activity_splash.*

class DASplashActivity : DABaseActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.da_activity_splash)

        tvAppName.makeGradient(this)
        Handler().postDelayed(Runnable {

            launchActivityWithNewTask<DAWalkThroughActivity>()
        },2000)
    }
}
