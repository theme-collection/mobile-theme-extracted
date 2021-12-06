package com.iqonic.datingapp.activity

import android.os.Bundle
import android.os.Handler
import android.view.View
import android.widget.ImageView
import com.google.android.material.bottomsheet.BottomSheetDialog
import com.iqonic.datingapp.R
import com.iqonic.datingapp.DABaseActivity
import com.iqonic.datingapp.utils.onClick
import com.iqonic.datingapp.utils.updateGenderButton
import kotlinx.android.synthetic.main.da_activity_filter.*
import kotlinx.android.synthetic.main.da_bottom_sheet_activity.*

class DAFilterActivity : DABaseActivity(), View.OnClickListener {
    override fun onClick(p0: View?) {
        updateGenderButton(p0 as ImageView,selected)
        selected=p0 as ImageView
        Handler().postDelayed(Runnable {
            dialog?.dismiss()

        },150)
    }

    private var dialog: BottomSheetDialog? = null
    private val distanceArray =
        arrayOf("1 km", "2 km", "3 km", "4 km", "5 km", "6 km", "7 km", "8 km", "9 km", "10 km")
    private val ageArray2 = arrayOf("18", "19", "20", "21", "22", "23", "24", "25")
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.da_activity_filter)
        rangebarDistance.tickTopLabels = distanceArray
        rangebarAge.tickTopLabels = ageArray2

        tvLocation.onClick {
            showBottomSheetDialog(true)
        }
        tvGender.onClick {
            showBottomSheetDialog(false)
        }
        ivBack.onClick {
            onBackPressed()
        }
    }

    private var selected: ImageView? = null
    private fun showBottomSheetDialog(b: Boolean) {
        if (dialog == null) {
            dialog = BottomSheetDialog(this)
            val contentView = View.inflate(this,
                R.layout.da_bottom_sheet_activity, null)
            dialog?.setContentView(contentView)
            (contentView.parent as View).setBackgroundColor(resources.getColor(android.R.color.transparent))
            dialog?.ivFemale?.setOnClickListener(this)
            dialog?.ivMale?.setOnClickListener(this)
            dialog?.ivOther?.setOnClickListener(this)
            dialog?.ivClose?.setOnClickListener {
                dialog?.dismiss()
            }

        }
        if (b) {
            dialog?.rlLocation?.visibility = View.VISIBLE
            dialog?.rlGender?.visibility = View.GONE

        } else {
            dialog?.rlLocation?.visibility = View.GONE
            dialog?.rlGender?.visibility = View.VISIBLE
        }
        dialog?.show()
    }

}
