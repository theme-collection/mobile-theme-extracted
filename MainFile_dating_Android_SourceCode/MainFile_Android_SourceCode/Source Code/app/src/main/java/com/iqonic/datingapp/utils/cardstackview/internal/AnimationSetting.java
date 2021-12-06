package com.iqonic.datingapp.utils.cardstackview.internal;

import android.view.animation.Interpolator;

import com.iqonic.datingapp.utils.cardstackview.Direction;

public interface AnimationSetting {
    Direction getDirection();
    int getDuration();
    Interpolator getInterpolator();
}
