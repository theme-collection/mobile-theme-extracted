package com.iqonic.datingapp.activity

import android.app.Dialog
import android.graphics.drawable.ColorDrawable
import android.os.Bundle
import android.text.Editable
import android.text.TextWatcher
import android.view.View
import android.widget.FrameLayout
import android.widget.ImageView
import com.iqonic.datingapp.R
import com.iqonic.datingapp.DABaseActivity
import com.iqonic.datingapp.utils.invalidateButton
import com.iqonic.datingapp.utils.launchActivity
import com.iqonic.datingapp.utils.onClick
import com.iqonic.datingapp.utils.updateGenderButton
import kotlinx.android.synthetic.main.da_activity_profile.*
import kotlinx.android.synthetic.main.da_item_addphoto.*

class DAProfileActivity : DABaseActivity(), TextWatcher {


    private fun showAddPhotoDialog() {
        val dialog = Dialog(this)
        dialog.window?.setBackgroundDrawable(ColorDrawable(0))
        dialog.setContentView(R.layout.da_item_addphoto)
        dialog.window?.setLayout(
            FrameLayout.LayoutParams.MATCH_PARENT,
            FrameLayout.LayoutParams.WRAP_CONTENT
        )
        dialog.tvCamera.onClick {
            launchActivity<DACameraActivity>()
        }
        dialog.tvCameraRoll.onClick {
            launchActivity<DACameraActivity>()
        }
        dialog.show()

    }

    override fun afterTextChanged(p0: Editable?) {
        invalidateButton(p0.toString().isNotEmpty(), btnSave)
    }

    override fun beforeTextChanged(p0: CharSequence?, p1: Int, p2: Int, p3: Int) {

    }

    override fun onTextChanged(p0: CharSequence?, p1: Int, p2: Int, p3: Int) {

    }

    private var cardClickListener = View.OnClickListener { showAddPhotoDialog() }
    private var genderClickListener = View.OnClickListener {
        updateGenderButton(it as ImageView, selected)
        selected = it
    }
    private var selected: ImageView? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.da_activity_profile)

        edtUsername.addTextChangedListener(this)
        edtAboutMe.addTextChangedListener(this)
        cardProfile1.setOnClickListener(cardClickListener)
        cardProfile2.setOnClickListener(cardClickListener)
        cardProfile3.setOnClickListener(cardClickListener)
        cardProfile4.setOnClickListener(cardClickListener)
        cardProfile5.setOnClickListener(cardClickListener)
        cardProfile6.setOnClickListener(cardClickListener)
        ivFemale.setOnClickListener(genderClickListener)
        ivMale.setOnClickListener(genderClickListener)
        ivOther.setOnClickListener(genderClickListener)

        ivMale.performClick()
        ivBack.onClick {
            onBackPressed()
        }
    }
}
