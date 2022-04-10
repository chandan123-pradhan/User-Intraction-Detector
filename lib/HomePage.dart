import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

import 'package:flutter_screen_wake/flutter_screen_wake.dart';
import 'package:get/get.dart';
import 'package:priya_app/GetxController.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State {
//you need to add just this line in your whole screen. this is brightness controller.
  BrightnessController controller = Get.put(BrightnessController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (e) {
        //if User will be intract then this function will be call.
        controller.userInstractionListner();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Demo App'),
        ),
        body: const Center(child: Text("Hii Develpers")),
      ),
    );
  }
}
