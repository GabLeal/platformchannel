import 'dart:async';
import 'dart:developer';

import 'package:flutter/services.dart';

class Temperature {
  final EventChannel _temperatureChannel = const EventChannel(
    'sensor/temperature',
  );

  final MethodChannel _activeSensorChannel = const MethodChannel(
    'sensor/temperature/activesensor',
  );

  final StreamController<double> _streamController = StreamController<double>();

  Temperature() {
    _temperatureChannel.receiveBroadcastStream().listen((event) {
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
      var result = await _activeSensorChannel.invokeMethod('activeSensor');
      log(result.toString());
    } catch (e) {
      log(e.toString());
    }
  }
}
