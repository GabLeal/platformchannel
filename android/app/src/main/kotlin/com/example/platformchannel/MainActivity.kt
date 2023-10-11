package com.example.platformchannel

import android.content.Intent
import android.os.Build
import android.provider.Settings
import androidx.annotation.RequiresApi
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {

    private val BRIGHTNESSS_CHANNEL_NAME = "com.example.platformchannel/brightness"
    private val TEMPERATURE_SENSOR_CHANNEL_NAME = "com.example.platformchannel/sensor/temperature"
    private val ACTIVE_SENSOR_CHANNEL_NAME = "com.example.platformchannel/sensor/activesensor"

    private var temperature: Temperature =  Temperature()

    @RequiresApi(Build.VERSION_CODES.M)
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, BRIGHTNESSS_CHANNEL_NAME).setMethodCallHandler { call, result ->
            when(call.method){
                "checkPermission" ->{
                    val settingsCanWrite = Settings.System.canWrite(context)
                    result.success(settingsCanWrite)
                }
                "openPermissionSettings"->{
                    val intent = Intent(Settings.ACTION_MANAGE_WRITE_SETTINGS)
                    context.startActivity(intent)
                }
                "changeBrightnessScreen"->{
                    var brightnessValue = call.arguments!! as Int
                    Settings.System.putInt(context.getContentResolver(),android.provider.Settings.System.SCREEN_BRIGHTNESS, brightnessValue);
                }
                "getBrightness"->{
                    var value = Settings.System.getInt(context.getContentResolver(),android.provider.Settings.System.SCREEN_BRIGHTNESS)
                    result.success(value)
                }

                else ->{
                    result.notImplemented()
                }
            }
        }

        EventChannel(flutterEngine.dartExecutor.binaryMessenger, TEMPERATURE_SENSOR_CHANNEL_NAME).setStreamHandler(temperature)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, ACTIVE_SENSOR_CHANNEL_NAME).setMethodCallHandler { call, result ->
            when(call.method){
                "activeSensor" ->{
                    temperature.start(this.context)
                    result.success(true)
                }
                else ->{
                    result.notImplemented()
                }
            }
        }

    }
}
