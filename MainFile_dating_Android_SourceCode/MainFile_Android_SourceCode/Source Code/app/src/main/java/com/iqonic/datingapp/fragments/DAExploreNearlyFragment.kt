package com.iqonic.datingapp.fragments

import android.content.res.Resources
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment
import com.google.android.gms.maps.GoogleMap
import com.google.android.gms.maps.OnMapReadyCallback
import com.iqonic.datingapp.R
import com.google.android.gms.maps.CameraUpdateFactory
import android.util.Log
import com.google.android.gms.maps.SupportMapFragment
import com.google.android.gms.maps.model.*
import com.iqonic.datingapp.utils.color
import com.iqonic.datingapp.utils.show
import kotlinx.android.synthetic.main.da_fragment_explore_nearly.*
import com.google.android.gms.maps.model.LatLng
import com.google.android.gms.maps.model.CircleOptions
import com.iqonic.datingapp.utils.onClick
import com.iqonic.datingapp.models.User
import com.google.maps.android.clustering.ClusterManager
import com.iqonic.datingapp.activity.DAChatActivity
import com.iqonic.datingapp.fragments.MarkerClusterRenderer.Companion.getMarkerBitmapFromView
import com.iqonic.datingapp.models.DAMapMarker
import com.iqonic.datingapp.utils.launchActivity
import kotlin.collections.ArrayList


class DAExploreNearlyFragment : Fragment(), OnMapReadyCallback {
    private var lastSelected: DAMapMarker? = null
    private var latlngs = arrayListOf(
        LatLng(53.79525112914487, -1.8593357267342598),
        LatLng(53.78956417251177, -1.8533051022684306),
        LatLng(53.78959575924421, -1.8498239704559425),
        LatLng(53.792153897084596, -1.851009810040085),
        LatLng(53.79211052702916, -1.8607793031117879),
        LatLng(53.79565967490387, -1.8559957865541652)
    )
    private var profiles = arrayListOf(
        R.drawable.da_user_profile,
        R.drawable.da_prfile_3,
        R.drawable.learn_profile_4,
        R.drawable.learn_profile_5,
        R.drawable.learn_profile_6,
        R.drawable.learn_profile_8
    )

    override fun onMapReady(googleMap: GoogleMap?) {
        try {
            val success = googleMap?.setMapStyle(
                MapStyleOptions.loadRawResourceStyle(
                    activity, R.raw.googlemap
                )
            )
            if (!success!!) {
                Log.e("Explore frag", "Style parsing failed.")
            }
        } catch (e: Resources.NotFoundException) {
            Log.e("Explore frag", "Can't find style. Error: ", e)
        }
        ivCurrentLocation.onClick {
            moveTOLocation(googleMap)

        }
        moveTOLocation(googleMap)
        setUpClusterManager(googleMap!!)

        googleMap.addCircle(
            CircleOptions()
                .center(LatLng(53.791760, -1.855960))
                .radius(100.0)
                .strokeWidth(0f)


                .fillColor(activity!!.color(R.color.da_red_light))
        )

        googleMap.addCircle(
            CircleOptions()
                .center(LatLng(53.791760, -1.855960))
                .radius(300.0)
                .strokeWidth(0f)
                .fillColor(activity!!.color(R.color.da_red_light))
        )
        fabChat.onClick {
            activity!!.launchActivity<DAChatActivity>()
        }


    }

    private fun moveTOLocation(googleMap: GoogleMap?) {
        googleMap?.animateCamera(
            CameraUpdateFactory.newLatLngZoom(
                LatLng(53.791760, -1.855960),
                15f
            )
        )
    }

    private fun setUpClusterManager(googleMap: GoogleMap) {
        val clusterManager = ClusterManager<DAMapMarker>(activity!!, googleMap)
        val randerer=MarkerClusterRenderer(activity!!, googleMap, clusterManager)
        clusterManager.setOnClusterItemClickListener {
            if (it.isUser){
                return@setOnClusterItemClickListener true
            }
            if (lastSelected != null) {
                randerer.getMarker(lastSelected)?.setIcon(
                    BitmapDescriptorFactory.fromBitmap(
                        getMarkerBitmapFromView(
                            lastSelected?.mUser?.img!!,
                            false
                            , activity!!
                        )
                    )
                )
            }
            randerer.getMarker(it).setIcon(BitmapDescriptorFactory.fromBitmap(
                getMarkerBitmapFromView(
                   it.mUser?.img!!,
                    true
                    , activity!!
                )
            ))
            rlInfo.show()
            lastSelected = it
            return@setOnClusterItemClickListener true
        }
        clusterManager.renderer = randerer
        googleMap.setOnCameraIdleListener(clusterManager)
        googleMap.setOnMarkerClickListener(clusterManager)

        val items = getItems()
        clusterManager.addItem(DAMapMarker(LatLng(53.791150, -1.855960),isUser = true))
        clusterManager.addItems(items)
        clusterManager.cluster()
    }

    private fun getItems(): List<DAMapMarker>? {
        var list = ArrayList<DAMapMarker>()
        latlngs.forEachIndexed { i: Int, latLng: LatLng ->
            var user=User()
            user.img=profiles[i]
            list.add(DAMapMarker(latLng,user))
        }
        return list
    }

    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        return inflater.inflate(R.layout.da_fragment_explore_nearly, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        val mapFragment =
            childFragmentManager.findFragmentById(R.id.mapAddress) as SupportMapFragment
        mapFragment.getMapAsync(this)

    }


}