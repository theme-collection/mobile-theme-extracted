package com.iqonic.datingapp.activity

import android.os.Bundle
import com.iqonic.datingapp.R
import com.iqonic.datingapp.DABaseActivity
import com.iqonic.datingapp.utils.*
import kotlinx.android.synthetic.main.da_activity_view_profile.*

class DAViewProfileActivity : DABaseActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.da_activity_view_profile)
        makeNormalStatusBar()
        makeTransaprant()
        ivEdit.onClick {
            launchActivity<DAProfileActivity>()
        }
        ivBack.onClick {
            onBackPressed()
        }
    }
}
