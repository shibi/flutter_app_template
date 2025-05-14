
import 'package:flutter/foundation.dart';

class LogHelper{
  static void log(String message){
    if(kDebugMode){
      print('Logger-->$message');
    }
  }
}