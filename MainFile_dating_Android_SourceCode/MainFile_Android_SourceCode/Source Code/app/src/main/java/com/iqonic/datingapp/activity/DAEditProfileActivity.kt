package com.iqonic.datingapp.activity

import android.app.DatePickerDialog
import android.os.Bundle
import android.text.Editable
import android.text.TextWatcher
import com.iqonic.datingapp.R
import com.iqonic.datingapp.DABaseActivity
import com.iqonic.datingapp.utils.*
import kotlinx.android.synthetic.main.da_activity_editprofile.*
import java.text.SimpleDateFormat
import java.util.*

class DAEditProfileActivity : DABaseActivity(), TextWatcher {
    override fun afterTextChanged(p0: Editable?) {
       invalidateButton(p0.toString().isNotEmpty(),btnNext)
    }

    override fun beforeTextChanged(p0: CharSequence?, p1: Int, p2: Int, p3: Int) {

    }

    override fun onTextChanged(p0: CharSequence?, p1: Int, p2: Int, p3: Int) {

    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.da_activity_editprofile)
        ivFemale.onClick {
            ivMale.background = getDrawable(R.drawable.da_bg_gray)
            ivMale.applyColorFilter(color(R.color.da_textColorSecondary))
            applyColorFilter(color(R.color.da_white))
            background = getDrawable(R.drawable.da_circle_redprimary)
        }
        ivMale.onClick {
            ivFemale.background = getDrawable(R.drawable.da_bg_gray)
            ivFemale.applyColorFilter(color(R.color.da_textColorSecondary))
            applyColorFilter(color(R.color.da_white))
            background = getDrawable(R.drawable.da_circle_redprimary)
        }
        edtUsername.addTextChangedListener(this)
        edtBirthday.addTextChangedListener(this)
        edtAboutMe.addTextChangedListener(this)

        edtBirthday.onClick {

        }
        ivBack.onClick {
            onBackPressed()
        }
        val c = Calendar.getInstance()

        edtBirthday.onClick {
            DatePickerDialog(
                this@DAEditProfileActivity,
                DatePickerDialog.OnDateSetListener { view, year, monthOfYear, dayOfMonth ->
                    c.set(Calendar.YEAR,year)
                    c.set(Calendar.MONTH,monthOfYear)
                    c.set(Calendar.DAY_OF_MONTH,dayOfMonth)
                    edtBirthday.setText( SimpleDateFormat("dd/MM/yyyy", Locale.getDefault()).format(c.time))
                },
                c.get(Calendar.YEAR),
                c.get(Calendar.MONTH),
                c.get(Calendar.DAY_OF_MONTH)
            ).show()
        }
        btnNext.onClick {
            launchActivityWithNewTask<DADashboardActivity>()
        }
    }
}
