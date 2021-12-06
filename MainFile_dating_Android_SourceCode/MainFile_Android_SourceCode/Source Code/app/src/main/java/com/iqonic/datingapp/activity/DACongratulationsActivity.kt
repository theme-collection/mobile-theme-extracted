package com.iqonic.datingapp.activity

import android.os.Bundle
import com.iqonic.datingapp.R
import com.iqonic.datingapp.DABaseActivity
import android.graphics.Shader.TileMode
import android.graphics.LinearGradient
import com.iqonic.datingapp.utils.*
import kotlinx.android.synthetic.main.da_activity_congratulations.*


class DACongratulationsActivity : DABaseActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.da_activity_congratulations)
        makeNormalStatusBar()
        makeTransaprant()

        val appShader = LinearGradient(
            0f, 0f, btnLoginAppointment.paint.measureText(btnLoginAppointment.text.toString()),btnLoginAppointment.textSize,
            intArrayOf( color(R.color.da_red),color(R.color.da_colorAccent)),
            null, TileMode.CLAMP
        )
        val sendShader = LinearGradient(
            0f, 0f, btnSendMessage.paint.measureText(btnSendMessage.text.toString()),btnSendMessage.textSize,
            intArrayOf( color(R.color.da_red),color(R.color.da_colorAccent)),
           null, TileMode.CLAMP
        )

        btnLoginAppointment.makeGradient(this)
        btnSendMessage.makeGradient(this)
        tvSearch.onClick {
            onBackPressed()
        }
        btnLoginAppointment.onClick {
            launchActivity<DAMakeAppointmentActivity>()
        }

        btnSendMessage.onClick {
            launchActivity<DAChatActivity>()
        }
    }
}
