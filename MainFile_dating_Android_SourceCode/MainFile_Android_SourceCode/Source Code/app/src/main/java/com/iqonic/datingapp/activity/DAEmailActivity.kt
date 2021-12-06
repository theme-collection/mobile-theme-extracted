package com.iqonic.datingapp.activity

import android.os.Bundle
import android.text.Editable
import android.text.TextWatcher
import android.text.method.PasswordTransformationMethod
import android.view.View
import com.iqonic.datingapp.R
import com.iqonic.datingapp.DABaseActivity
import com.iqonic.datingapp.utils.invalidateButton
import com.iqonic.datingapp.utils.onClick
import kotlinx.android.synthetic.main.da_activity_change_email.*

class DAEmailActivity : DABaseActivity(), TextWatcher {
    override fun afterTextChanged(p0: Editable?) {
        invalidateButton(p0.toString().isNotEmpty(),btnSend)
    }

    override fun beforeTextChanged(p0: CharSequence?, p1: Int, p2: Int, p3: Int) {
    }

    override fun onTextChanged(p0: CharSequence?, p1: Int, p2: Int, p3: Int) {
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.da_activity_change_email)
        edtEmail.addTextChangedListener(this)
        btnSend.onClick {
            finish()
        }
        ivBack.onClick {
            onBackPressed()
        }
    }
    object BiggerDotTransformation : PasswordTransformationMethod() {

        override fun getTransformation(source: CharSequence, view: View): CharSequence {
            return PasswordCharSequence(super.getTransformation(source, view))
        }

        private class PasswordCharSequence(
            val transformation: CharSequence
        ) : CharSequence by transformation {
            override fun get(index: Int): Char = if (transformation[index] == DOT) {
                BIGGER_DOT
            } else {
                transformation[index]
            }
        }

        private const val DOT = '\u2022'
        private const val BIGGER_DOT = '●'
    }

}
