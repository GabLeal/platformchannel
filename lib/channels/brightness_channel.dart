import 'dart:developer';
import 'package:flutter/services.dart';

class BrightnessChannel {
  final _brightnessChannel =
      const MethodChannel('com.example.platformchannel/brightness');

  Future<bool> checkPermission() async {
    try {
      var result = await _brightnessChannel.invokeMethod('checkPermission');
      return result;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  Future<void> openPermissionSettings() async {
    try {
      await _brightnessChannel.invokeMethod('openPermissionSettings');
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> changeBrightnessScreen(int value) async {
    try {
      await _brightnessChannel.invokeMethod('changeBrightnessScreen', value);
    } catch (e) {
      log(e.toString());
    }
  }
}
