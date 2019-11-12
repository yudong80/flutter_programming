package com.yudong80.platform_channels;

import android.os.BatteryManager;

import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

import static android.os.BatteryManager.BATTERY_PROPERTY_CAPACITY;

public class MainActivity extends FlutterActivity {
  private static final String METHOD_BATTERY = "getBatteryLevel";
  private static final String CHANNEL_BATTERY = "android/battery";

  @Override
  public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
    GeneratedPluginRegistrant.registerWith(flutterEngine);

    new MethodChannel(flutterEngine.getDartExecutor(), CHANNEL_BATTERY).setMethodCallHandler(
        (call, result) -> {
          if(METHOD_BATTERY.equals(call.method)) {
            BatteryManager manager = (BatteryManager) getSystemService(BATTERY_SERVICE);
            int battery = manager.getIntProperty(BATTERY_PROPERTY_CAPACITY);
            result.success(battery);
          }
          result.notImplemented();
        }
    );
  }
}
