package com.iqonic.datingapp.activity

import android.os.Bundle
import android.text.Editable
import android.text.TextWatcher
import com.iqonic.datingapp.R
import com.iqonic.datingapp.DABaseActivity
import com.iqonic.datingapp.utils.invalidateButton
import com.iqonic.datingapp.utils.launchActivityWithNewTask
import com.iqonic.datingapp.utils.onClick
import kotlinx.android.synthetic.main.da_activity_signin.*

class DASignInActivity : DABaseActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.da_activity_signin)

        edMobileNumber.addTextChangedListener(object :TextWatcher{
            override fun afterTextChanged(p0: Editable?) {
                invalidateButton(p0.toString().length>=10,btnSignIn)
             }

            override fun beforeTextChanged(p0: CharSequence?, p1: Int, p2: Int, p3: Int) {
            }

            override fun onTextChanged(p0: CharSequence?, p1: Int, p2: Int, p3: Int) {
            }
        })
      btnSignIn.onClick {
          var launguage= counryCodePicker.languageToApply

          launchActivityWithNewTask<DAVerificationActivity>()
      }
    }

}
