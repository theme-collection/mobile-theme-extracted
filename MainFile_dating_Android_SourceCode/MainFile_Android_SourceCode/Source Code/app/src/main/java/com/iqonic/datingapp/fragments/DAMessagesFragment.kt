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
import com.iqonic.datingapp.R
import com.iqonic.datingapp.activity.DASearchActivity
import com.iqonic.datingapp.utils.launchActivity
import com.iqonic.datingapp.utils.onClick
import com.iqonic.datingapp.utils.replaceChildFragment
import kotlinx.android.synthetic.main.da_fragment_message.*

class DAMessagesFragment : Fragment() {
    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        return inflater.inflate(R.layout.da_fragment_message, container, false)
    }

    var daMessagesAllFragment = DAMessagesAllFragment()
    var daMessagesMatchFragment = DAMessagesMatchFragment()
    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
      //  var adapter = WalkAdapter(childFragmentManager)
        /*vpMessages.adapter = adapter
        vpMessages.addOnPageChangeListener(object : ViewPager.OnPageChangeListener {
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
                    setConstraintGravity(tvAll)
                } else {
                    setConstraintGravity(tvMatches)

                }
            }

        })*/
        tvAll.onClick {
            setConstraintGravity(this)
            replaceChildFragment(daMessagesAllFragment,R.id.vpMessages)
        }
        tvMatches.onClick {
            setConstraintGravity(this)
            replaceChildFragment(daMessagesMatchFragment,R.id.vpMessages)

        }
        ivSearch.onClick {
            activity!!.launchActivity<DASearchActivity>()
        }
        replaceChildFragment(daMessagesAllFragment,R.id.vpMessages)

        //setCustomFont()
    }

    private fun setConstraintGravity(view: TextView) {
        tvAll.setTextColor(ContextCompat.getColor(activity!!, R.color.da_textColorSecondary))
        tvMatches.setTextColor(ContextCompat.getColor(activity!!, R.color.da_textColorSecondary))

        val constraintSet = ConstraintSet()
        constraintSet.clone(tabMessages)
        view.setTextColor(ContextCompat.getColor(activity!!, R.color.da_red))
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
        TransitionManager.beginDelayedTransition(tabMessages)
        constraintSet.applyTo(tabMessages)
    }

    internal inner class WalkAdapter(fragmentManager: FragmentManager) :
        FragmentPagerAdapter(fragmentManager) {

        override fun getCount(): Int {
            return 2
        }

        override fun getItem(position: Int): Fragment {
            if (position == 0) {
                return daMessagesAllFragment
            }
            return daMessagesMatchFragment
        }
    }

/*
    private fun setCustomFont() {
        val vg = tabs.getChildAt(0) as ViewGroup
        val tabsCount = vg.childCount

        for (j in 0 until tabsCount) {
            val vgTab = vg.getChildAt(j) as ViewGroup

            val mTabChildCount = vgTab.childCount

            for (i in 0 until mTabChildCount) {
                val tabViewChild = vgTab.getChildAt(i)
                if (tabViewChild is TextView) {
                    tabViewChild.typeface = activity!!.daAppFontSemiBold()
                }
            }
        }
    }
*/

}