import 'dart:developer';

import 'package:cv_e_commerce/constants.dart';
import 'package:cv_e_commerce/models/weather_model.dart';
import 'package:cv_e_commerce/services/weather_service.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WeatherView extends StatelessWidget {
  WeatherView({super.key});

  final weatherService = AppWeatherService();

  Future<WeatherModel?> fetchWeather() async {
    late WeatherModel weather;
    try {
      weather = await weatherService.getWeather();
    } catch (e) {
      log(e.toString());
    }
    return weather;
  }

  String getWeatherAnimation(String? mainCondition) {
    if (mainCondition == null) {
      return sunnyLottie;
    } else if (mainCondition.contains("clouds")) {
      return cloudyLottie;
    } else if (mainCondition.contains("rain")) {
      return rainyLottie;
    } else if (mainCondition.contains("storm")) {
      return stromyLottie;
    } else if (mainCondition.contains("sunny")) {
      return sunnyLottie;
    } else {
      return sunnyLottie;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: FutureBuilder(
          future: fetchWeather(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container();
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(getWeatherAnimation(snapshot.data?.weatherCondition)),
                  Text(snapshot.data?.weatherCondition ??
                      "Loading weather condition ..."),
                  Text(snapshot.data?.cityName ?? "Loading city ..."),
                  Text(
                      "${snapshot.data?.temperature.round() ?? "Loading Temparature ..."}°C")
                ],
              );
            }
          }),
    ));
  }
}
