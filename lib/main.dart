import 'package:cv_e_commerce/core/utils/logger/logger.dart';
import 'package:cv_e_commerce/views/app_bindings.dart';
import 'package:cv_e_commerce/views/weather/weather_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MainApp());
  Flog.init();
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: AppBinding(),
      home: const WeatherView(),
    );
  }
}
