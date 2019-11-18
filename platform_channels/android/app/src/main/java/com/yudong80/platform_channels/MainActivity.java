package com.yudong80.platform_channels;

import android.os.BatteryManager;
import android.util.Log;

import androidx.annotation.NonNull;

import com.google.android.gms.location.FusedLocationProviderClient;
import com.google.android.gms.location.LocationServices;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

import static android.os.BatteryManager.BATTERY_PROPERTY_CAPACITY;

public class MainActivity extends FlutterActivity {
    private static final String TAG = "PlatformChannels";

    private static final String METHOD_BATTERY = "getBatteryLevel";
    private static final String CHANNEL_BATTERY = "android/battery";

    private static final String METHOD_CURRENT_LOCATION = "getCurrentLocation";
    private static final String CHANNEL_LOCATION = "android/location";

    private FusedLocationProviderClient fusedLocationClient;

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        Log.d(TAG, "configureFlutterEngine()");
        GeneratedPluginRegistrant.registerWith(flutterEngine);
        fusedLocationClient = LocationServices.getFusedLocationProviderClient(this);

        new MethodChannel(flutterEngine.getDartExecutor(), CHANNEL_BATTERY).setMethodCallHandler(
                (call, result) -> {
                    if (METHOD_BATTERY.equals(call.method)) {
                        BatteryManager manager = (BatteryManager) getSystemService(BATTERY_SERVICE);
                        int battery = manager.getIntProperty(BATTERY_PROPERTY_CAPACITY);
                        result.success(battery);
                    }
                    result.notImplemented();
                }
        );

        new MethodChannel(flutterEngine.getDartExecutor(), CHANNEL_LOCATION).setMethodCallHandler(
                (call, result) -> {
                    Log.d(TAG, "location_channel :: method " + call.method);
                    if (METHOD_CURRENT_LOCATION.equals(call.method)) {
                        getCurrentLocation(result);
                    }
                }
        );
    }

    private void getCurrentLocation(MethodChannel.Result result) {
        fusedLocationClient.getLastLocation()
                .addOnSuccessListener(this, location -> {
                    if (location != null) {
                        String res = "(" + location.getLatitude() + ", " + location.getLongitude() + ")";
                        Log.d(TAG, "location? " + res);
                        result.success(res);
                    }
                });
    }
}
