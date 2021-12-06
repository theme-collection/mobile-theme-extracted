package com.iqonic.datingapp.activity

import android.os.Bundle
import androidx.fragment.app.Fragment
import androidx.fragment.app.FragmentManager
import androidx.fragment.app.FragmentPagerAdapter
import com.iqonic.datingapp.R
import com.iqonic.datingapp.DABaseActivity
import com.iqonic.datingapp.fragments.DACameraFragment
import com.iqonic.datingapp.utils.makeTransaprant
import kotlinx.android.synthetic.main.da_activity_camera.*
import android.graphics.*
import android.widget.SeekBar
import android.graphics.BitmapFactory
import com.iqonic.datingapp.utils.onClick


class DACameraActivity : DABaseActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.da_activity_camera)
        makeTransaprant()
        var adapter = WalkAdapter(supportFragmentManager)
        vpCamera.adapter = adapter
        tabs.setViewPager(vpCamera)
        seekContrast.setOnSeekBarChangeListener(object : SeekBar.OnSeekBarChangeListener {
            override fun onProgressChanged(seekBar: SeekBar, progress: Int, b: Boolean) {
                ivCameraImg.setImageBitmap(
                    changeBitmapContrastBrightness(
                        BitmapFactory.decodeResource(
                            resources,
                            R.drawable.da_camera_bg
                        ), progress.toFloat() / 100f, 1f
                    )
                )

            }

            override fun onStartTrackingTouch(seekBar: SeekBar) {}

            override fun onStopTrackingTouch(seekBar: SeekBar) {}
        })

        seekContrast.max = 200
        seekContrast.progress = 100
        vpCamera.currentItem=2
        ivBack.onClick {
            onBackPressed()
        }
    }

    internal inner class WalkAdapter(fragmentManager: FragmentManager) : FragmentPagerAdapter(fragmentManager) {

        private var TITLES = arrayOf(
            "PROMO",
            "BOOMRANG",
            "CAMERA", "VIDEO", "SQUARE", "LIVE","HANDS-FREE","CREATE"
        )

        override fun getPageTitle(position: Int): CharSequence {
            return TITLES[position]
        }

        override fun getCount(): Int {
            return TITLES.size
        }

        override fun getItem(position: Int): Fragment {
            return DACameraFragment()
        }
    }

    fun changeBitmapContrastBrightness(bmp: Bitmap, contrast: Float, brightness: Float): Bitmap {
        val cm = ColorMatrix(
            floatArrayOf(
                contrast,
                0f,
                0f,
                0f,
                brightness,
                0f,
                contrast,
                0f,
                0f,
                brightness,
                0f,
                0f,
                contrast,
                0f,
                brightness,
                0f,
                0f,
                0f,
                1f,
                0f
            )
        )

        val ret = Bitmap.createBitmap(bmp.width, bmp.height, bmp.config)

        val canvas = Canvas(ret)

        val paint = Paint()
        paint.colorFilter = ColorMatrixColorFilter(cm)
        canvas.drawBitmap(bmp, 0f, 0f, paint)

        return ret
    }
}
