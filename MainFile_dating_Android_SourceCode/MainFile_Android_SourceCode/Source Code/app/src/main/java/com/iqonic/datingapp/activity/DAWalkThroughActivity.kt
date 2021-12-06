package com.iqonic.datingapp.activity

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.viewpager.widget.PagerAdapter
import androidx.viewpager.widget.ViewPager
import com.iqonic.datingapp.R
import com.iqonic.datingapp.DABaseActivity
import com.iqonic.datingapp.utils.launchActivityWithNewTask
import com.iqonic.datingapp.utils.onClick
import kotlinx.android.synthetic.main.da_item_walk.view.*
import kotlinx.android.synthetic.main.da_activity_walkthrough.*

class DAWalkThroughActivity : DABaseActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.da_activity_walkthrough)
        val adapter = WalkAdapter()
        vpWalkThrough.adapter = adapter
        dots.attachViewPager(vpWalkThrough)
        dots.setDotDrawable(R.drawable.da_bg_color_primary, R.drawable.da_bg_black_dot)
        vpWalkThrough.addOnPageChangeListener(object : ViewPager.OnPageChangeListener {
            override fun onPageScrollStateChanged(state: Int) {
            }

            override fun onPageScrolled(position: Int, positionOffset: Float, positionOffsetPixels: Int) {

            }

            override fun onPageSelected(position: Int) {
                if (position==2){
                   btnGetStarted.visibility=View.VISIBLE
                }else{
                    btnGetStarted.visibility=View.GONE

                }
            }

        })
        tvSkip.onClick {
             launchActivityWithNewTask<DADashboardActivity> ()
        }
        btnGetStarted.onClick {
            launchActivityWithNewTask<DASignInActivity> ()
        }
    }


    internal inner class WalkAdapter : PagerAdapter() {

        private var mHeading = arrayOf(
            "Find and meet\nnew people",
            "Pair and talk\nwith people",
            "Start dating to learn\n each other "
        )

        private val mImg = intArrayOf(R.drawable.da_walk3, R.drawable.da_walk2, R.drawable.da_walk1)

        override fun destroyItem(container: ViewGroup, position: Int, `object`: Any) {
            container.removeView(`object` as View)
        }

        override fun instantiateItem(container: ViewGroup, position: Int): Any {
            val view = LayoutInflater.from(container.context)
                .inflate(R.layout.da_item_walk, container, false)
            view.ivWalk.setImageResource(mImg[position])
            view.tvWalkTitle.text = mHeading[position]
            container.addView(view)
            return view
        }

        override fun getCount(): Int {
            return mImg.size
        }

        override fun isViewFromObject(view: View, `object`: Any): Boolean {
            return view === `object` as View
        }
    }

}
