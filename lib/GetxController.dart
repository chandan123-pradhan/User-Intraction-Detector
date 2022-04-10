import 'dart:async';

import 'package:flutter_screen_wake/flutter_screen_wake.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';

class BrightnessController extends GetxController {
  Timer? time;
  bool isBrigthnessLow = false;
  int unIntractTimming = 5;
  double brightness = 0.0;

  Future initPlatformBrightness() async {
   
    double bright;

    try {
      bright = await FlutterScreenWake.brightness;
    } on PlatformException {
      bright = 1.0;
    }

    brightness = bright;
    update();
  }

  void startTimer() {
  
    time = Timer.periodic(Duration(seconds: unIntractTimming), (timer) {
      brightness = 0.0;
      isBrigthnessLow = true;

      //this line will set birghtness.
      FlutterScreenWake.setBrightness(brightness);
      update();
    });
  }

  void userInstractionListner()async {
    
    time!.cancel();
    startTimer();
    if (isBrigthnessLow == true) {
     

      brightness = 1.0;
      isBrigthnessLow = false;

      update();
      FlutterScreenWake.setBrightness(brightness);
    }
  }

  @override
  void onInit() {
    initPlatformBrightness();
    startTimer();
    super.onInit();
  }
}
