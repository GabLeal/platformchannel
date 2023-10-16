import 'dart:async';
import 'dart:developer';

import 'package:flutter/services.dart';

class TemperatureChannel {
  final EventChannel _temperatureChannel = const EventChannel(
    'com.example.platformchannel/sensor/temperature',
  );

  final MethodChannel _activeSensorChannel = const MethodChannel(
    'com.example.platformchannel/sensor/activesensor',
  );

  final StreamController<double> _streamController = StreamController<double>();

  TemperatureChannel() {
    _temperatureChannel.receiveBroadcastStream().listen((event) {
      _streamController.sink.add(event);
    }, onError: (erro) {
      log(erro.toString());
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
    } catch (erro) {
      log(erro.toString());
    }
  }
}
