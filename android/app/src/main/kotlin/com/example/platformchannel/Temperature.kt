package com.example.platformchannel

import android.content.Context
import android.hardware.Sensor
import android.hardware.SensorEvent
import android.hardware.SensorEventListener
import android.hardware.SensorManager
import io.flutter.plugin.common.EventChannel

class Temperature : SensorEventListener, EventChannel.StreamHandler {
    private var sink: EventChannel.EventSink? = null

    private var sensorManager: SensorManager? = null
    private var temepratureSensor: Sensor? = null

    fun start(context: Context){
        sensorManager = context.getSystemService(Context.SENSOR_SERVICE) as SensorManager
        temepratureSensor = sensorManager!!.getDefaultSensor(Sensor.TYPE_AMBIENT_TEMPERATURE)
        sensorManager?.registerListener(this, temepratureSensor, SensorManager.SENSOR_DELAY_NORMAL)
    }

    override fun onSensorChanged(event: SensorEvent?) {
        if(event != null){
            val temperature = event!!.values[0]
            sink?.success(temperature)
        }
    }

    override fun onAccuracyChanged(sensor: Sensor?, accuracy: Int) {
    }

    override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
        sink = events
    }

    override fun onCancel(arguments: Any?) {
        sink = null
        sensorManager?.unregisterListener(this)
    }

}