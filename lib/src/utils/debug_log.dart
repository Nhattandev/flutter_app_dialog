import 'package:flutter/material.dart';

///Tan.nguyen 4/23/21 :
///
/// [debugLog] avoid logging message when an app already released
/// It's not necessary when your app released but keep logging message
/// Replace [Print] with [debugLog] can reduce Your App's Memory Use
/// Usage:
/// debugLog('your message');
///
debugLog(dynamic message) {
  if (!isDebugMode) {
    return;
  }

  if (message is String)
    debugPrint(message);
  else
    debugPrint(message.toString());
}

/// checking running mode
bool get isDebugMode {
  bool isDebugMode = false;
  assert(isDebugMode = true);
  return isDebugMode;
}
