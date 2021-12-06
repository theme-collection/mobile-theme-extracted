package com.iqonic.datingapp.activity

import android.os.Bundle
import com.iqonic.datingapp.R
import com.iqonic.datingapp.DABaseActivity
import com.iqonic.datingapp.utils.launchActivity
import com.iqonic.datingapp.utils.onClick
import kotlinx.android.synthetic.main.da_activity_security.*

class DASecurityActivity : DABaseActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.da_activity_security)
        tvEmail.onClick {
            launchActivity<DAEmailActivity>()
        }
        tvPassword.onClick {
            launchActivity<DAChangePasswordActivity>()
        }
        ivBack.onClick {
            onBackPressed()
        }
    }

}
