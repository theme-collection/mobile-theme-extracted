package com.iqonic.datingapp.activity

import android.os.Bundle
import android.view.View
import com.iqonic.datingapp.R
import com.iqonic.datingapp.DABaseActivity
import com.iqonic.datingapp.models.DaNotification
import com.iqonic.datingapp.utils.*
import kotlinx.android.synthetic.main.da_activity_notification.*
import kotlinx.android.synthetic.main.da_item_notification.view.*
import kotlinx.android.synthetic.main.da_item_search.view.ivUser
import kotlinx.android.synthetic.main.da_item_search.view.tvUserName

class DANotificationActivity : DABaseActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.da_activity_notification)
        var recentAdapter=DARecyclerViewAdapter<DaNotification>(R.layout.da_item_notification,onBind = { view: View, contact: DaNotification, i: Int ->
            view.ivUser.setImageResource(contact.img!!)
            view.tvUserName.text=contact.notification
           view.tvTime.text=contact.time
            if (contact.day!=null){
                if (i!=0){
                    view.view.visibility=View.VISIBLE
                }
                view.tvDay.visibility=View.VISIBLE
                view.tvDay.text=contact.day
            }else{
                view.view.visibility=View.GONE
                view.tvDay.visibility=View.GONE
            }
        })

        rvNotification.apply {
            setVerticalLayout()
            adapter=recentAdapter
        }
        recentAdapter.addItems(getNotifications())
        ivBack.onClick {
            onBackPressed()
        }
    }
}
