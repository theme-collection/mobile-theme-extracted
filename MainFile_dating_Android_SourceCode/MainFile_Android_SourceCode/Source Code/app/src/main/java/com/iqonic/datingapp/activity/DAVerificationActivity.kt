package com.iqonic.datingapp.activity

import android.os.Bundle
import android.text.Editable
import android.text.TextWatcher
import android.view.View
import android.widget.EditText
import com.iqonic.datingapp.R
import com.iqonic.datingapp.DABaseActivity
import com.iqonic.datingapp.utils.DAOTPEditText
import com.iqonic.datingapp.utils.invalidateButton
import com.iqonic.datingapp.utils.launchActivity
import com.iqonic.datingapp.utils.onClick
import kotlinx.android.synthetic.main.da_activity_verification.*

class DAVerificationActivity : DABaseActivity() {
    private var mEds: Array<EditText?>? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.da_activity_verification)
        mEds = arrayOf(edDigit1, edDigit2, edDigit3, edDigit4)
        ivBack.onClick {
            onBackPressed()
        }
        DAOTPEditText(
            mEds!!,
            this,
            getDrawable(android.R.color.transparent)!!,
            getDrawable(R.drawable.da_bg_unselected_dot)!!
        )
        mEds!!.forEachIndexed { _, editText ->
            editText?.onFocusChangeListener = focusChangeListener
            editText?.addTextChangedListener(object : TextWatcher {
                override fun afterTextChanged(p0: Editable?) {
                    invalidateButton(p0.toString().isNotEmpty(),btnVerify)
                }

                override fun beforeTextChanged(p0: CharSequence?, p1: Int, p2: Int, p3: Int) {
                }

                override fun onTextChanged(p0: CharSequence?, p1: Int, p2: Int, p3: Int) {
                }

            })
        }
        btnVerify.onClick {
            if (intent.getBooleanExtra("isForget",false)){
                launchActivity<DANewPasswordActivity>()

            }else{

                launchActivity<DAPasswordActivity>()
            }
        }
    }

    private val focusChangeListener = View.OnFocusChangeListener { v, hasFocus ->
        if (hasFocus)
            (v as EditText).background = getDrawable(android.R.color.transparent)
    }

}
