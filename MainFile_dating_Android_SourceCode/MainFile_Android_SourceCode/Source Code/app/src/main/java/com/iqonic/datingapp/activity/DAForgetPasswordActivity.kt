package com.iqonic.datingapp.activity

import android.os.Bundle
import android.text.Editable
import android.text.TextWatcher
import com.iqonic.datingapp.R
import com.iqonic.datingapp.DABaseActivity
import com.iqonic.datingapp.utils.*
import kotlinx.android.synthetic.main.da_activity_forget_password.*

class DAForgetPasswordActivity : DABaseActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.da_activity_forget_password)
        edMobileNumber.addTextChangedListener(object : TextWatcher {
            override fun afterTextChanged(p0: Editable?) {
                invalidateButton(p0.toString().length >= 10, btnSend)
            }

            override fun beforeTextChanged(p0: CharSequence?, p1: Int, p2: Int, p3: Int) {
            }

            override fun onTextChanged(p0: CharSequence?, p1: Int, p2: Int, p3: Int) {
            }

        })
        btnSend.onClick {
            launchActivity<DAVerificationActivity>() {
                putExtra("isForget", true)
            }

        }
        ivBack.onClick {
            onBackPressed()
        }
    }

}
