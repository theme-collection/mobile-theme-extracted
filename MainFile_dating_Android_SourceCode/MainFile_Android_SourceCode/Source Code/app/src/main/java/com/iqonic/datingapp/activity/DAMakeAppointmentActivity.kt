package com.iqonic.datingapp.activity

import android.os.Bundle
import com.iqonic.datingapp.R
import com.iqonic.datingapp.DABaseActivity
import com.iqonic.datingapp.utils.onClick
import kotlinx.android.synthetic.main.da_activity_make_appointment.*
import kotlinx.android.synthetic.main.da_activity_security.ivBack
import android.app.TimePickerDialog
import java.util.*
import android.app.DatePickerDialog
import android.text.Editable
import android.text.TextWatcher
import android.view.View
import com.google.android.material.bottomsheet.BottomSheetDialog
import com.iqonic.datingapp.utils.invalidateButton
import kotlinx.android.synthetic.main.da_bottom_sheet_activity.*
import java.text.SimpleDateFormat


class DAMakeAppointmentActivity : DABaseActivity() ,TextWatcher{
    override fun afterTextChanged(p0: Editable?) {
        invalidateButton(p0.toString().isNotEmpty(),btnSend)
    }

    override fun beforeTextChanged(p0: CharSequence?, p1: Int, p2: Int, p3: Int) {
    }

    override fun onTextChanged(p0: CharSequence?, p1: Int, p2: Int, p3: Int) {
    }

    private var dialog: BottomSheetDialog?=null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.da_activity_make_appointment)
        val c = Calendar.getInstance()
        edtTime.addTextChangedListener(this)
        edtDate.addTextChangedListener(this)
        edtPlace.addTextChangedListener(this)
        ivBack.onClick {
            onBackPressed()
        }
        edtTime.onClick {
            val timePickerDialog = TimePickerDialog(
                this@DAMakeAppointmentActivity,
                TimePickerDialog.OnTimeSetListener { view, hourOfDay, minute ->
                    c.set(Calendar.HOUR_OF_DAY,hourOfDay)
                    c.set(Calendar.MINUTE,minute)
                    edtTime.text = SimpleDateFormat("hh:mm a", Locale.getDefault()).format(c.time)
                }, c.get(Calendar.HOUR_OF_DAY), c.get(Calendar.MINUTE), false
            )
            timePickerDialog.show()
        }
        edtDate.onClick {
            DatePickerDialog(
                this@DAMakeAppointmentActivity,
                DatePickerDialog.OnDateSetListener { view, year, monthOfYear, dayOfMonth ->
                    c.set(Calendar.YEAR,year)
                    c.set(Calendar.MONTH,monthOfYear)
                    c.set(Calendar.DAY_OF_MONTH,dayOfMonth)
                    edtDate.text = SimpleDateFormat("dd/MM/yyyy", Locale.getDefault()).format(c.time)
                },
                c.get(Calendar.YEAR),
                c.get(Calendar.MONTH),
                c.get(Calendar.DAY_OF_MONTH)
            ).show()
        }
        edtPlace.onClick {
           showBottomSheetDialog()
        }
    }
    private fun showBottomSheetDialog() {
        if (dialog == null) {
            dialog = BottomSheetDialog(this)
            val contentView = View.inflate(this,
                R.layout.da_bottom_sheet_activity, null)
            dialog?.setContentView(contentView)
            (contentView.parent as View).setBackgroundColor(resources.getColor(android.R.color.transparent))
            dialog?.ivClose?.setOnClickListener {
                dialog?.dismiss()
            }
            dialog?.edtUserLocation?.onClick {
                edtPlace.text=dialog?.edtUserLocation?.text.toString()
                dialog?.dismiss()

            }
            dialog?.rlLocation?.visibility = View.VISIBLE
            dialog?.rlGender?.visibility = View.GONE

        }
        dialog?.show()
    }


}
