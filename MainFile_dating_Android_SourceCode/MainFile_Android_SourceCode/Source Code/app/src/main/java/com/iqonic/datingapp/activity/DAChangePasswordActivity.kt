package com.iqonic.datingapp.activity

import android.os.Bundle
import android.text.Editable
import android.text.TextWatcher
import com.iqonic.datingapp.R
import com.iqonic.datingapp.DABaseActivity
import com.iqonic.datingapp.utils.*
import kotlinx.android.synthetic.main.da_activity_change_password.*

class DAChangePasswordActivity : DABaseActivity(), TextWatcher {
    override fun afterTextChanged(p0: Editable?) {
        invalidateButton(p0.toString().isNotEmpty(),btnSend)
    }

    override fun beforeTextChanged(p0: CharSequence?, p1: Int, p2: Int, p3: Int) {
    }

    override fun onTextChanged(p0: CharSequence?, p1: Int, p2: Int, p3: Int) {
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.da_activity_change_password)
        edtCurrentPassword.addTextChangedListener(this)
        edMobilePassword.addTextChangedListener(this)
        edReMobilePassword.addTextChangedListener(this)
        edtCurrentPassword.transformationMethod=BiggerDotTransformation
        edMobilePassword.transformationMethod=BiggerDotTransformation
        edReMobilePassword.transformationMethod=BiggerDotTransformation
        btnSend.onClick {
            launchActivityWithNewTask<DASignInActivity>()
        }
        ivBack.onClick {
            onBackPressed()
        }

        ivCurrentTogglePswd.onClick {
            edtCurrentPassword.togglePassword()
        }
        ivTogglePswd.onClick {
            edMobilePassword.togglePassword()
        }
        ivReTogglePswd.onClick {
            edReMobilePassword.togglePassword()
        }
    }

}
