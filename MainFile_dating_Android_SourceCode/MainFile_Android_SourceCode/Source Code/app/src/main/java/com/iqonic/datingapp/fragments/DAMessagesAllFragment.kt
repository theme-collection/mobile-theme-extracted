package com.iqonic.datingapp.fragments

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment
import com.iqonic.datingapp.R
import com.iqonic.datingapp.activity.DAChatActivity
import com.iqonic.datingapp.models.DaChat
import com.iqonic.datingapp.utils.*
import kotlinx.android.synthetic.main.da_fragment_all_message.*
import kotlinx.android.synthetic.main.da_item_chat.view.*

class DAMessagesAllFragment : Fragment() {
    private lateinit var mChatAdapter: DARecyclerViewAdapter<DaChat>

    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        return inflater.inflate(R.layout.da_fragment_all_message, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

         mChatAdapter = DARecyclerViewAdapter(R.layout.da_item_chat
            , onBind = { view: View, chat: DaChat, i: Int ->
                view.ivUser.setImageResource(chat.people?.img!!)
                view.viewStatus.apply {
                    if (chat.people?.isOnline!!) {
                        visibility = View.VISIBLE
                    } else {
                        visibility = View.GONE
                    }
                }
                view.tvUserName.text = chat.people?.name!!
                view.tvChatMessage.text = chat.chat!!
                view.tvTime.text = chat.time
                view.buttonRemove.onClick {
                    removeItem(chat)
                }
                 view.llMain.onClick {
                     activity!!.launchActivity<DAChatActivity>()

                 }

            })


        rvAllMessages.apply {
            setVerticalLayout()
            adapter=mChatAdapter
        }

        mChatAdapter.addItems(getChats())
    }

    private fun removeItem(i: DaChat) {
        mChatAdapter.remove(i)
        if (mChatAdapter.itemCount==0){
            rlEmpty.visibility=View.VISIBLE
        }else{
            rlEmpty.visibility=View.GONE
        }
    }
}