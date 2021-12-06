package com.iqonic.datingapp

import android.app.Application
import io.github.inflationx.calligraphy3.CalligraphyConfig
import io.github.inflationx.calligraphy3.CalligraphyInterceptor
import io.github.inflationx.viewpump.ViewPump

open class DAApp : Application() {

    override fun onCreate() {
        super.onCreate()
        app = this

        ViewPump.init(ViewPump.builder().addInterceptor(CalligraphyInterceptor(CalligraphyConfig.Builder().setDefaultFontPath(getString(R.string.da_font_regular)).setFontAttrId(R.attr.fontPath).build())).build())
    }

    companion object {

        lateinit var app: DAApp

        fun getAppInstance(): DAApp {
            return app
        }
    }
}