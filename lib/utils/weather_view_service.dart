import 'dart:developer';

import 'package:cv_e_commerce/models/weather_model.dart';
import 'package:cv_e_commerce/services/weather_service.dart';
import 'package:cv_e_commerce/utils/constants.dart';

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