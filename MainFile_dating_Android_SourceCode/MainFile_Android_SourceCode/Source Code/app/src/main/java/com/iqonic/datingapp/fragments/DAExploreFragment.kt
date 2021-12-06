package com.iqonic.datingapp.fragments

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import androidx.constraintlayout.widget.ConstraintSet
import androidx.core.content.ContextCompat
import androidx.fragment.app.Fragment
import androidx.fragment.app.FragmentManager
import androidx.fragment.app.FragmentPagerAdapter
import androidx.transition.TransitionManager
import androidx.viewpager.widget.ViewPager
import com.iqonic.datingapp.R
import com.iqonic.datingapp.activity.DAFilterActivity
import com.iqonic.datingapp.utils.launchActivity
import com.iqonic.datingapp.utils.onClick
import kotlinx.android.synthetic.main.da_fragment_explore.*

class DAExploreFragment : Fragment() {
    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        return inflater.inflate(R.layout.da_fragment_explore, container, false)
    }

    var exploreListFragment = DAExploreListFragment()
    var exploreNearlyFragment = DAExploreNearlyFragment()
    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        tvNearly.onClick {
            setConstraintGravity(this)
            vpContainer.currentItem = 0
        }
        tvList.onClick {
            setConstraintGravity(this)
            vpContainer.currentItem = 1
        }
        var adapter = WalkAdapter(childFragmentManager)
        vpContainer.adapter = adapter


        vpContainer.addOnPageChangeListener(object : ViewPager.OnPageChangeListener {
            override fun onPageScrollStateChanged(state: Int) {
            }

            override fun onPageScrolled(
                position: Int,
                positionOffset: Float,
                positionOffsetPixels: Int
            ) {
            }

            override fun onPageSelected(position: Int) {

                if (position == 0) {
                    setConstraintGravity(tvNearly)
                } else {
                    setConstraintGravity(tvList)

                }
            }

        })
        ivFilter.onClick {
            activity!!.launchActivity<DAFilterActivity>()
        }

    }

    private fun setConstraintGravity(view: TextView) {
        tvNearly.setTextColor(ContextCompat.getColor(activity!!, R.color.da_textColorSecondary))
        tvList.setTextColor(ContextCompat.getColor(activity!!, R.color.da_textColorSecondary))

        val constraintSet = ConstraintSet()
        constraintSet.clone(tabExplore)
        view
            .setTextColor(ContextCompat.getColor(activity!!, R.color.da_red))
        constraintSet.connect(
            R.id.tab,
            ConstraintSet.START,
            view.id,
            ConstraintSet.START,
            0
        )
        constraintSet.connect(
            R.id.tab,
            ConstraintSet.END,
            view.id,
            ConstraintSet.END,
            0
        )

        constraintSet.connect(
            R.id.tab,
            ConstraintSet.TOP,
            view.id,
            ConstraintSet.BOTTOM,
            0
        )
        TransitionManager.beginDelayedTransition(tabExplore)
        constraintSet.applyTo(tabExplore)
    }

    internal inner class WalkAdapter(fragmentManager: FragmentManager) :
        FragmentPagerAdapter(fragmentManager) {

        override fun getCount(): Int {
            return 2
        }

        override fun getItem(position: Int): Fragment {
            if (position == 0) {
                return exploreNearlyFragment
            }
            return exploreListFragment
        }
    }

}