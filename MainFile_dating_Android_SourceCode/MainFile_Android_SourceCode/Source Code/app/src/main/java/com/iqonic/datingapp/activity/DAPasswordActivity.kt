package com.iqonic.datingapp.activity

import android.os.Bundle
import android.text.Editable
import android.text.TextWatcher
import com.iqonic.datingapp.R
import com.iqonic.datingapp.DABaseActivity
import com.iqonic.datingapp.utils.*
import kotlinx.android.synthetic.main.da_activity_password.*

class DAPasswordActivity : DABaseActivity(), TextWatcher {
    override fun afterTextChanged(p0: Editable?) {
        invalidateButton(p0.toString().isNotEmpty(),btnNext)
    }

    override fun beforeTextChanged(p0: CharSequence?, p1: Int, p2: Int, p3: Int) {
    }

    override fun onTextChanged(p0: CharSequence?, p1: Int, p2: Int, p3: Int) {
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.da_activity_password)
        edMobilePassword.addTextChangedListener(this)
        edReMobilePassword.addTextChangedListener(this)
        edMobilePassword.transformationMethod= BiggerDotTransformation
        edReMobilePassword.transformationMethod=BiggerDotTransformation
        btnNext.onClick {
            launchActivity<DAEditProfileActivity>()
        }
        tvForgetPassword.onClick {
            launchActivity<DAForgetPasswordActivity>()
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
