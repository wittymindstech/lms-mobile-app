import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Screen {
  static void setLandscape() async {
    await SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  }
  
  static void hideSystemBars(){
    SystemChrome.setEnabledSystemUIOverlays([]);
  }

  static double heigth(BuildContext context){
    return MediaQuery.of(context).size.height;
  }

  static void showSystemBars(){
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  }

static void resetOrientation() async {
  await SystemChrome.setPreferredOrientations(
      []);
}

}
