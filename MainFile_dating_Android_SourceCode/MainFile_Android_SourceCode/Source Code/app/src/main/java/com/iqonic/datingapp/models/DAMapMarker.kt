package com.iqonic.datingapp.models

import com.google.android.gms.maps.model.LatLng
import com.google.maps.android.clustering.ClusterItem

class DAMapMarker(
    latlng: LatLng,
    user: User?=null, isUser: Boolean = false
) : ClusterItem {
    private val mPosition: LatLng = latlng
    private val mTitle: String? = null
     val isUser: Boolean = isUser
    val mSnippet: String? = null
    val mUser: User? = user

    override fun getPosition(): LatLng {
        return mPosition
    }

    override fun getTitle(): String? {
        return mTitle
    }

    override fun getSnippet(): String? {
        return mSnippet
    }

}