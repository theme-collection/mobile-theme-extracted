package com.iqonic.datingapp.fragments

import android.content.Intent
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.core.app.ActivityOptionsCompat
import androidx.fragment.app.Fragment
import androidx.recyclerview.widget.GridLayoutManager
import com.iqonic.datingapp.R
import com.iqonic.datingapp.activity.DAUserDetailActivity
import com.iqonic.datingapp.models.User
import com.iqonic.datingapp.utils.*
import kotlinx.android.synthetic.main.da_item_list.view.*
import kotlinx.android.synthetic.main.da_fragment_explore_list.*

class DAExploreListFragment :Fragment() {
    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        return inflater.inflate(R.layout.da_fragment_explore_list,container,false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        var listAdapter=DARecyclerViewAdapter(R.layout.da_item_list,onBind = { view: View, user: User, i: Int ->
            view.ivImg.loadImage(user.img!!,activity!!)
            view.tvName.text=user.name+","+user.age
            view.tvDisatance.text=user.distance
        })
       rvList.apply {
           layoutManager = GridLayoutManager(activity, 2)
           setHasFixedSize(true)
           adapter = listAdapter
       }
       listAdapter.addItems(generateList())
        listAdapter.onItemClick={ i: Int, listView: View, _: User ->
            var intent = Intent(activity, DAUserDetailActivity::class.java)
            intent.putExtra("from_explore",true)
            intent.putExtra("pos",i)

            val options = ActivityOptionsCompat.makeSceneTransitionAnimation(
                activity!!,
                listView.ivImg as View,
                "profile"
            )
            startActivityForResult(intent, 101, options.toBundle())        }
    }
}