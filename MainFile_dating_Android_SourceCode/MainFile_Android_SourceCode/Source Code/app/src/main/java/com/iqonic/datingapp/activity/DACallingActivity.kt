package com.iqonic.datingapp.activity

import android.os.Bundle
import android.os.Handler
import android.view.View
import com.iqonic.datingapp.R
import com.iqonic.datingapp.DABaseActivity
import com.iqonic.datingapp.utils.applyColorFilter
import com.iqonic.datingapp.utils.color
import com.iqonic.datingapp.utils.makeTransaprant
import com.iqonic.datingapp.utils.onClick
import kotlinx.android.synthetic.main.da_activity_call.*

class DACallingActivity : DABaseActivity() {
    var isRecordOn:Boolean=false
    var isSpeakerOn:Boolean=false
    var isBluetoothOn:Boolean=false
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.da_activity_call)
        makeTransaprant()
        if (intent.getBooleanExtra("isCalling",false)){
            ivCall.visibility=View.GONE
            Handler().postDelayed(Runnable {
                rlKeys.visibility = View.VISIBLE
                tvTime.text="00:10"
            },2000)
        }
        ivHangup.onClick {
            finish()
        }
        ivCall.onClick {
            rlKeys.visibility = View.VISIBLE
            visibility = View.GONE
        }
        ivRecord.onClick {
            if (isRecordOn){
                applyColorFilter(color(R.color.da_green))
            }else{
                applyColorFilter(color(R.color.da_white))
            }
            isRecordOn=!isRecordOn
        }
        ivDial.onClick {

        }
        ivSpeaker.onClick {
            if (isSpeakerOn){
                applyColorFilter(color(R.color.da_green))
            }else{
                applyColorFilter(color(R.color.da_white))
            }
            isSpeakerOn=!isSpeakerOn
        }
        ivBluetooth.onClick {
            if (isBluetoothOn){
                applyColorFilter(color(R.color.da_green))
            }else{
                applyColorFilter(color(R.color.da_white))
            }
            isBluetoothOn=!isBluetoothOn
        }
        ivContact.onClick {

        }
        ivMore.onClick {

        }
    }

}
