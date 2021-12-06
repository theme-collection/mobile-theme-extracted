package com.iqonic.datingapp.activity

import android.os.Bundle
import android.view.View
import com.iqonic.datingapp.R
import com.iqonic.datingapp.DABaseActivity
import com.iqonic.datingapp.models.User
import com.iqonic.datingapp.utils.*
import kotlinx.android.synthetic.main.da_activity_search.*
import kotlinx.android.synthetic.main.da_item_search.view.*

class DASearchActivity : DABaseActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.da_activity_search)
        var recentAdapter=DARecyclerViewAdapter<User>(R.layout.da_item_search,onBind = { view: View, contact: User, i: Int ->
            view.ivUser.setImageResource(contact.img!!)
            view.tvUserName.text=contact.name
            view.viewStatus.apply {
                visibility = if (contact.isOnline){
                    View.VISIBLE
                }else{
                    View.GONE
                }
            }
        })
        var otherAdapter=DARecyclerViewAdapter<User>(R.layout.da_item_search,onBind = { view: View, contact: User, i: Int ->
            view.ivUser.setImageResource(contact.img!!)
            view.tvUserName.text=contact.name
            view.viewStatus.apply {
                visibility = if (contact.isOnline){
                    View.VISIBLE
                }else{
                    View.GONE
                }
            }

        })

        rvRecent.apply {
            setVerticalLayout()
            adapter=recentAdapter
        }
        rvPeople.apply {
            setVerticalLayout()
            adapter=otherAdapter
        }
        recentAdapter.addItems(getRecents())
        otherAdapter.addItems(getPending())
        tvCancel.onClick {
            onBackPressed()
        }
    }
}
