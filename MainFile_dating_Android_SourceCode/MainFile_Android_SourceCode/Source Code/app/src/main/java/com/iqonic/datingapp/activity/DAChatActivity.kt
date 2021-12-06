package com.iqonic.datingapp.activity

import android.os.Bundle
import android.text.Editable
import android.text.TextWatcher
import android.view.Gravity
import android.view.View
import android.widget.FrameLayout
import android.widget.ImageView
import androidx.core.view.isVisible
import androidx.recyclerview.widget.GridLayoutManager
import com.iqonic.datingapp.R
import com.iqonic.datingapp.DABaseActivity
import com.iqonic.datingapp.models.DaChat
import com.iqonic.datingapp.models.DaPhoto
import com.iqonic.datingapp.utils.*
import kotlinx.android.synthetic.main.da_activity_chat.*
import kotlinx.android.synthetic.main.da_chat_layout_bottom.*
import kotlinx.android.synthetic.main.da_item_chat_histroy.view.*
import kotlinx.android.synthetic.main.da_item_chat_photo.view.*

class DAChatActivity : DABaseActivity() {
    companion object {
        private var MESSAGE = "Message"
        private var VOICE_MESSAGE = "Voice Message"
        private var MEDIA = "Media"

    }

    private var messageType: String = MESSAGE
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.da_activity_chat)
        var layoutParams = FrameLayout.LayoutParams(
            FrameLayout.LayoutParams.WRAP_CONTENT,
            FrameLayout.LayoutParams.WRAP_CONTENT
        )
        layoutParams.gravity = Gravity.START
        var layoutParams2 = FrameLayout.LayoutParams(
            FrameLayout.LayoutParams.WRAP_CONTENT,
            FrameLayout.LayoutParams.WRAP_CONTENT
        )
        layoutParams2.gravity = Gravity.END
        ivBack.onClick {
            onBackPressed()
        }
        val width = (getDisplayWidth() / 1.5).toInt()
        var photoParam = FrameLayout.LayoutParams(
            width,
            width
        )
        photoParam.gravity = Gravity.START

        var photoParam2 = FrameLayout.LayoutParams(
            width,
            width
        )
        photoParam2.gravity = Gravity.END

        var mChatHistoryAdapter = DARecyclerViewAdapter<DaChat>(R.layout.da_item_chat_histroy
            , onBind = { view: View, badge: DaChat, i: Int ->
                if (badge.type == "Message") {
                    view.tvMessage.text = badge.chat
                } else if (badge.type == "Voice Message") {
                    view.tvVoiceMessage.text = badge.chat
                }
                view.tvMessage.hide()
                view.tvVoiceMessage.hide()
                view.cardPhoto.hide()
                if (badge.isSender) {
                    when {
                        badge.type == "Message" -> {
                            view.tvMessage.show()

                            view.tvMessage.layoutParams = layoutParams2
                            view.tvMessage.background =
                                resources.getDrawable(R.drawable.da_bg_chat_history_grd)
                            view.tvMessage.setTextColor(color(R.color.da_white))

                        }
                        badge.type == "Voice Message" -> {
                            view.tvVoiceMessage.show()
                            view.tvVoiceMessage.layoutParams = layoutParams2
                            view.tvVoiceMessage.background =
                                resources.getDrawable(R.drawable.da_bg_chat_history_grd)
                            view.tvVoiceMessage.setTextColor(color(R.color.da_white))

                        }
                        else -> {
                            view.cardPhoto.show()
                            view.cardPhoto.layoutParams = photoParam2
                            view.ivChatPhoto.setImageResource(badge.img!!)
                        }
                    }
                    view.ivChatProfile.visibility = View.INVISIBLE
                } else {
                    when {
                        badge.type == "Message" -> {
                            view.tvMessage.show()
                            view.tvMessage.layoutParams = layoutParams
                            view.tvMessage.background =
                                resources.getDrawable(R.drawable.da_bg_chat_history)
                            view.tvMessage.setTextColor(color(R.color.da_textColorPrimary))

                        }
                        badge.type == "Voice Message" -> {
                            view.tvVoiceMessage.show()
                            view.tvVoiceMessage.layoutParams = layoutParams
                            view.tvVoiceMessage.background =
                                resources.getDrawable(R.drawable.da_bg_chat_history)
                            view.tvVoiceMessage.setTextColor(color(R.color.da_textColorPrimary))
                        }
                        else -> {
                            view.cardPhoto.show()
                            view.cardPhoto.layoutParams = photoParam
                            view.ivChatPhoto.setImageResource(badge.img!!)
                        }
                    }
                    if (badge.showProfile) {
                        view.ivChatProfile.show()
                    } else {
                        view.ivChatProfile.invisible()
                    }

                }

            })

        rvChat.apply {
            setVerticalLayout()
            adapter = mChatHistoryAdapter

        }
        var photoAdapter = DARecyclerViewAdapter<DaPhoto>(
            R.layout.da_item_chat_photo,
            onBind = { view: View, daPhoto: DaPhoto, i: Int ->
                view.ivPhoto.setImageResource(daPhoto.img!!)
            })
        var gifAdapter = DARecyclerViewAdapter<DaPhoto>(
            R.layout.da_item_chat_photo,
            onBind = { view: View, daPhoto: DaPhoto, i: Int ->
                view.ivPhoto.setImageResource(daPhoto.img!!)
            })
        rvPhoto.apply {
            layoutManager = GridLayoutManager(this@DAChatActivity, 3)
            setHasFixedSize(true)
            adapter = photoAdapter
        }
        rvGif.apply {
            layoutManager = GridLayoutManager(this@DAChatActivity, 3)
            setHasFixedSize(true)
            adapter = gifAdapter
        }
        gifAdapter.addItems(getGalleryPhotos())

        photoAdapter.addItems(getGalleryPhotos())
        photoAdapter.onItemClick = { i: Int, view: View, daPhoto: DaPhoto ->
            var badge2 = DaChat()
            badge2.img = daPhoto.img
            badge2.type = MEDIA
            badge2.isSender = true
            mChatHistoryAdapter.addItem(badge2)
            rvChat.scrollToPosition(mChatHistoryAdapter.itemCount - 1)

            resetAddLayout()
        }
        mChatHistoryAdapter.addItems(getUserChats())
        ivGallary.onClick {
            setSelectedImg(this)
            applyColorFilter(color(R.color.da_red))
            ivVoice.applyColorFilter(color(R.color.da_textColorSecondary))
            ivGif.applyColorFilter(color(R.color.da_textColorSecondary))
            rvPhoto.show()
            llVoice.hide()
            rvGif.hide()
            hideSoftKeyboard()
            messageType = MEDIA

        }
        ivCall.onClick {
            launchActivity<DACallingActivity> {
                putExtra("isCalling", true)
            }
        }
        ivAppointment.onClick {
            launchActivity<DAMakeAppointmentActivity>()
        }
        ivVoice.onClick {
            rvPhoto.hide()
            rvGif.hide()
            llVoice.show()
            applyColorFilter(color(R.color.da_red))
            ivGallary.applyColorFilter(color(R.color.da_textColorSecondary))
            ivGif.applyColorFilter(color(R.color.da_textColorSecondary))
            hideSoftKeyboard()
            messageType = VOICE_MESSAGE
        }
        ivGif.onClick {
            applyColorFilter(color(R.color.da_red))
            ivGallary.applyColorFilter(color(R.color.da_textColorSecondary))
            ivVoice.applyColorFilter(color(R.color.da_textColorSecondary))
            rvPhoto.hide()
            llVoice.hide()
            rvGif.show()
            hideSoftKeyboard()
            messageType = MEDIA

        }
        ivCamera.onClick {
            launchActivity<DACameraActivity>()
        }
        ivAdd.onClick {
            if (!rlAdd.isVisible) {
                setImageResource(R.drawable.da_ic_plus_gradient)
                rlAdd.show()
            } else {
                setImageResource(R.drawable.da_ic_add)
                resetAddLayout()
            }

            //  hideSoftKeyboard()

        }
        edtSearch.addTextChangedListener(object : TextWatcher {
            override fun afterTextChanged(p0: Editable?) {

                if (p0.toString().isNotEmpty()) {
                    messageType = MESSAGE
                    resetAddLayout()
                    ivSend.setImageResource(R.drawable.da_ic_send_gradient)
                } else {
                    messageType = ""
                    ivSend.setImageResource(R.drawable.da_ic_send_button)
                }
            }

            override fun beforeTextChanged(p0: CharSequence?, p1: Int, p2: Int, p3: Int) {
            }

            override fun onTextChanged(p0: CharSequence?, p1: Int, p2: Int, p3: Int) {
            }

        })
        edtSearch.setOnFocusChangeListener { _, b ->
            if (b) {
                resetAddLayout()
            }
        }
        ivSend.onClick {
            var badge2 = DaChat()
            if (messageType == MESSAGE) {
                badge2.chat = edtSearch.text.toString()

            } else if (messageType == VOICE_MESSAGE) {
                badge2.chat = "00:12"
            }
            badge2.type = messageType
            badge2.isSender = true
            mChatHistoryAdapter.addItem(badge2)
            edtSearch.text.clear()
            rvChat.scrollToPosition(mChatHistoryAdapter.itemCount - 1)
        }

    }

    private fun setSelectedImg(imageView: ImageView?) {
        ivGallary.applyColorFilter(color(R.color.da_textColorSecondary))
        ivVoice.applyColorFilter(color(R.color.da_textColorSecondary))
        ivGif.applyColorFilter(color(R.color.da_textColorSecondary))
        imageView?.apply {
            applyColorFilter(color(R.color.da_red))
        }
    }

    private fun resetAddLayout() {
        rlAdd.hide()
        rvPhoto.hide()
        llVoice.hide()
        rvGif.hide()
        ivAdd.setImageResource(R.drawable.da_ic_add)
    }

}

