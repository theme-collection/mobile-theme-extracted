package com.iqonic.datingapp.activity

import android.os.Bundle
import android.text.Editable
import android.text.TextWatcher
import com.iqonic.datingapp.R
import com.iqonic.datingapp.DABaseActivity
import com.iqonic.datingapp.utils.*
import kotlinx.android.synthetic.main.da_activity_new_password.*

class DANewPasswordActivity : DABaseActivity(), TextWatcher {
    override fun afterTextChanged(p0: Editable?) {
        invalidateButton(p0.toString().isNotEmpty(), btnLogin)
    }

    override fun beforeTextChanged(p0: CharSequence?, p1: Int, p2: Int, p3: Int) {
    }

    override fun onTextChanged(p0: CharSequence?, p1: Int, p2: Int, p3: Int) {
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.da_activity_new_password)
        edMobilePassword.addTextChangedListener(this)
        edReMobilePassword.addTextChangedListener(this)
        edMobilePassword.transformationMethod = BiggerDotTransformation
        edReMobilePassword.transformationMethod = BiggerDotTransformation
        btnLogin.onClick {
            launchActivityWithNewTask<DADashboardActivity>()
        }
        ivBack.onClick {
            onBackPressed()
        }
        ivTogglePswd.onClick {
            edMobilePassword.togglePassword()

        }
        ivReTogglePswd.onClick {
            edReMobilePassword.togglePassword()
        }
    }


}
