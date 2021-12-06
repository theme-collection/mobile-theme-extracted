package com.iqonic.datingapp.activity

import android.os.Bundle
import android.view.View
import com.iqonic.datingapp.R
import com.iqonic.datingapp.DABaseActivity
import com.iqonic.datingapp.models.Language
import com.iqonic.datingapp.utils.*
import kotlinx.android.synthetic.main.da_activity_language.*
import kotlinx.android.synthetic.main.da_item_language.view.*

class DALanguageActivity : DABaseActivity() {
    private var selectedId: Int = 0
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.da_activity_language)
        var languageAdapter = DARecyclerViewAdapter(
            R.layout.da_item_language,
            onBind = { view: View, language: Language, i: Int ->
                view.ivFlag.setImageResource(language.country)
                view.tvLanguage.text = language.launguge?.toCamelCase()
                if (selectedId == i) {

                    view.ivSelected.visibility = View.VISIBLE
                } else {
                    view.ivSelected.visibility = View.GONE

                }

            })
        languageAdapter.onItemClick = { i: Int, view: View, language: Language ->
            selectedId = i
            languageAdapter.notifyDataSetChanged()
        }
        rvLanguage.apply {
            setVerticalLayout()
            adapter = languageAdapter
        }
        languageAdapter.addItems(generateLaunguge())
        ivBack.onClick {
            onBackPressed()
        }
    }
}
