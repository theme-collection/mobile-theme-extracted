package com.iqonic.datingapp.fragments

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment
import com.iqonic.datingapp.R
import com.iqonic.datingapp.activity.DAFilterActivity
import com.iqonic.datingapp.activity.DALanguageActivity
import com.iqonic.datingapp.activity.DASecurityActivity
import com.iqonic.datingapp.activity.DAViewProfileActivity
import com.iqonic.datingapp.utils.launchActivity
import com.iqonic.datingapp.utils.onClick
import kotlinx.android.synthetic.main.da_fragment_settings.*

class DAProfileFragment :Fragment() {
    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        return inflater.inflate(R.layout.da_fragment_settings,container,false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        tvSecurity.onClick {
            activity!!.launchActivity<DASecurityActivity>()
        }
        tvFilter.onClick {
            activity!!.launchActivity<DAFilterActivity>()
        }
        tvLanguage.onClick {
            activity!!.launchActivity<DALanguageActivity>()
        }
        ivProfile.onClick {
            activity!!.launchActivity<DAViewProfileActivity>()

        }
    }
}
