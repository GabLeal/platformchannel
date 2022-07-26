import 'dart:async';
import 'dart:developer';

import 'package:flutter/services.dart';

class Temperature {
  static const EventChannel _temperature_channel =
      EventChannel('sensor/temperature');

  static const MethodChannel _active_sensor_channel =
      MethodChannel('sensor/temperature/activesensor');

  final StreamController<double> _streamController = StreamController<double>();

  Temperature() {
    _temperature_channel.receiveBroadcastStream().listen((event) {
      log(event.toString());
      _streamController.sink.add(event);
    }, onError: (e) {
      log(e.toString());
    });
  }

  Stream<double> get getTemperatureStream {
    return _streamController.stream;
  }

  void dispose() {
    _streamController.close();
  }

  Future<void> activeSensor() async {
    try {
      var result = await _active_sensor_channel.invokeMethod('activeSensor');
      log(result.toString());
    } catch (e) {
      log(e.toString());
    }
  }
}
