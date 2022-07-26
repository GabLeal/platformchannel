import 'dart:developer';
import 'package:flutter/services.dart';

class Channel {
  static const _platform = MethodChannel('br.com.brightness');

  Future<bool> checkPermission() async {
    try {
      var result = await _platform.invokeMethod('checkPermission');
      return result;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  Future<void> openPermissionSettings() async {
    try {
      await _platform.invokeMethod('openPermissionSettings');
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> changeBrightnessScreen(int value) async {
    try {
      await _platform.invokeMethod('changeBrightnessScreen', value);
    } catch (e) {
      log(e.toString());
    }
  }
}
