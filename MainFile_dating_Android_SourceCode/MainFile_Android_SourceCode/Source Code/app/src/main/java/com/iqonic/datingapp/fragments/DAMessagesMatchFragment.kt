package com.iqonic.datingapp.fragments

import android.os.Bundle
import android.view.Gravity
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.coordinatorlayout.widget.CoordinatorLayout
import androidx.fragment.app.Fragment
import androidx.recyclerview.widget.GridLayoutManager
import com.iqonic.datingapp.R
import com.iqonic.datingapp.activity.DAChatActivity
import com.iqonic.datingapp.models.User
import com.iqonic.datingapp.utils.*
import kotlinx.android.synthetic.main.da_fragment_matches_message.*
import kotlinx.android.synthetic.main.da_item_match.view.*

class DAMessagesMatchFragment : Fragment() {
    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        return inflater.inflate(R.layout.da_fragment_matches_message, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        val width = (activity!!.getDisplayWidth() / 4.2).toInt()
        var layoutParams=CoordinatorLayout.LayoutParams(width, width)
        layoutParams.bottomMargin=width/8
        var layoutParams2=CoordinatorLayout.LayoutParams((width/2.5).toInt(), (width/2.5).toInt())
        layoutParams2.gravity=Gravity.BOTTOM or Gravity.CENTER_HORIZONTAL

        var matchAdapter = DARecyclerViewAdapter<User>(
            R.layout.da_item_match,
            onBind = { view: View, user: User, i: Int ->
                view.ivProfile.layoutParams=layoutParams
                view.ivImg.layoutParams=layoutParams2
                view.ivImg.setPadding(width/10,width/10,width/10,width/10)
                if (i % 3 == 1) {
                    view.viewDummy.visibility = View.VISIBLE
                } else {
                    view.viewDummy.visibility = View.GONE
                }
                view.ivProfile.setImageResource(user.img!!)
                view.tvName.text = user.name
            })
        rvMatches.apply {
            layoutManager = GridLayoutManager(activity!!,3)
            adapter = matchAdapter
        }
        matchAdapter.addItems(generateUser())
        matchAdapter.onItemClick = { i: Int, view: View, user: User ->
                activity!!.launchActivity<DAChatActivity>()
        }

    }


}