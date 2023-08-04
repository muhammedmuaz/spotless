/// [Debug] calss is a helper fun ,
/// It used for printing messages for [StorageManager] class

import 'package:flutter/foundation.dart';

class Debug {
  static bool releaseBuild = kReleaseMode;

  Debug(String s);
  static log(String msg) {
    if (releaseBuild) {
      return;
    } else
      print(msg);
  }
}
