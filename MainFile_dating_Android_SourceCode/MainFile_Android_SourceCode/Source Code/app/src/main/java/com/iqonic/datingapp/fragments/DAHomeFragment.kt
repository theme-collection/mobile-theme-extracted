package com.iqonic.datingapp.fragments

import android.content.Intent
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.view.animation.AccelerateInterpolator
import android.view.animation.DecelerateInterpolator
import android.view.animation.LinearInterpolator
import androidx.fragment.app.Fragment
import androidx.recyclerview.widget.DefaultItemAnimator
import com.iqonic.datingapp.R
import com.iqonic.datingapp.activity.DAUserDetailActivity
import com.iqonic.datingapp.utils.cardstackview.*
import kotlinx.android.synthetic.main.da_fragment_home.*
import kotlinx.android.synthetic.main.da_item_user.view.*
import com.iqonic.datingapp.models.User
import androidx.core.app.ActivityOptionsCompat
import com.iqonic.datingapp.activity.DACongratulationsActivity
import com.iqonic.datingapp.activity.DANotificationActivity
import com.iqonic.datingapp.utils.*


class DAHomeFragment : Fragment() {
    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        return inflater.inflate(R.layout.da_fragment_home, container, false)
    }

    private lateinit var adapter: DARecyclerViewAdapter<User>

    companion object {

        private var cardView: CardStackView? = null
        private var manager: CardStackLayoutManager? = null
        var topPos = 0
        fun swipe(setting: SwipeAnimationSetting) {
            manager?.setSwipeAnimationSetting(setting)
            cardView?.swipe()
        }

        fun rewind(setting: RewindAnimationSetting) {
            manager?.setRewindAnimationSetting(setting)
            cardView?.rewind()
        }
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        initialize(view)

        adapter.addItems(generateUser())
        tvAppName.makeGradient(activity!!)
        ivClose.setOnClickListener {
            if (manager?.topPosition!! < adapter.itemCount) {
                val setting = SwipeAnimationSetting.Builder()
                    .setDirection(Direction.Left)
                    .setDuration(Duration.Slow.duration)
                    .setInterpolator(AccelerateInterpolator())
                    .build()
                swipe(setting)
            }

        }

        ivUndo.setOnClickListener {

            val setting = RewindAnimationSetting.Builder()
                .setDirection(Direction.Bottom)
                .setDuration(Duration.Normal.duration)
                .setInterpolator(DecelerateInterpolator())
                .build()
            rewind(setting)

        }

        ivHeart.setOnClickListener {
            if (manager?.topPosition!! < adapter.itemCount) {
                val setting = SwipeAnimationSetting.Builder()
                    .setDirection(Direction.Right)
                    .setDuration(Duration.Slow.duration)
                    .setInterpolator(AccelerateInterpolator())
                    .build()
                swipe(setting)
            }
        }
        ivNotification.onClick {
            activity!!.launchActivity<DANotificationActivity>()
        }
    }

    private fun checkEmpty() {
        if (manager?.topPosition == adapter.itemCount - 1) {
            rlContent.visibility = View.GONE
            llBottom.visibility = View.GONE
            tvEmpty.visibility = View.VISIBLE
        } else {
            rlContent.visibility = View.VISIBLE
            llBottom.visibility = View.VISIBLE
            tvEmpty.visibility = View.GONE
        }

    }

    private fun setUser() {
        val item = adapter.getItem(manager!!.topPosition)
        tvName.text = item.name
        tvDisatance.text = item.distance
        tvProfession.text = item.proffesion
        topPos = manager?.topPosition!!
    }
    private var isPause=false
    override fun onPause() {
        super.onPause()
    }

    private fun initialize(view: View) {
        manager = CardStackLayoutManager(activity!!, object : CardStackListener {
            override fun onCardDragging(direction: Direction, ratio: Float) {
            }

            override fun onCardSwiped(direction: Direction) {
                if (direction==Direction.Right && !isPause ){
                    isPause=true
                    activity!!.launchActivity<DACongratulationsActivity> {  }
                }

            }

            override fun onCardAppeared(view: View, position: Int) {
                setUser()

            }

            override fun onCardDisappeared(view: View, position: Int) {
                checkEmpty()

            }

            override fun onCardRewound() {
            }

            override fun onCardCanceled() {
            }


        })
        manager?.setStackFrom(StackFrom.None)
        manager?.setVisibleCount(3)
        manager?.setTranslationInterval(8.0f)
        manager?.setScaleInterval(0.95f)
        manager?.setSwipeThreshold(0.3f)
        manager?.setMaxDegree(60.0f)
        manager?.setDirections(Direction.HORIZONTAL)
        manager?.setCanScrollHorizontal(false)
        manager?.setCanScrollVertical(false)
        manager?.cardStackListener
        manager?.setSwipeableMethod(SwipeableMethod.AutomaticAndManual)
        manager?.setOverlayInterpolator(LinearInterpolator())
        adapter = DARecyclerViewAdapter(
            R.layout.da_item_user,
            onBind = { view: View, user: User, i: Int ->
                view.ivDateProfile.setImageResource(user.img!!)

            })
        adapter.onItemClick = { i: Int, view: View, user: User ->
            var intent = Intent(activity, DAUserDetailActivity::class.java);
            val options = ActivityOptionsCompat.makeSceneTransitionAnimation(
                activity!!,
                view.ivDateProfile as View,
                "profile"
            )
            startActivityForResult(intent, 101, options.toBundle())
            isPause=true

        }
        cardView = view.findViewById(R.id.cardStackView)
        cardView?.layoutManager = manager
        cardView?.adapter = adapter
        cardView?.itemAnimator.apply {
            if (this is DefaultItemAnimator) {
                supportsChangeAnimations = false
            }
        }
    }

    override fun onResume() {
        super.onResume()
        isPause=true

        /*  manager?.topPosition = topPos
          setUser()*/
    }


}