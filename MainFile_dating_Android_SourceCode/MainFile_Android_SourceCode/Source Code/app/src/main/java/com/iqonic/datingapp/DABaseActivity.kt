package com.iqonic.datingapp

import android.content.Context
import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import com.iqonic.datingapp.utils.color
import com.iqonic.datingapp.utils.lightStatusBar
import io.github.inflationx.viewpump.ViewPumpContextWrapper

open class DABaseActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        lightStatusBar(color(R.color.da_white))
    }
/*
     fun setToolBar(s: String) {
        ivBack.onClick {
            onBackPressed()
        }
        toolBarTitle.text=s
    }
*/

    override fun attachBaseContext(newBase: Context?) {
        super.attachBaseContext(ViewPumpContextWrapper.wrap(newBase!!))
    }
}