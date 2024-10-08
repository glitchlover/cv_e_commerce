import 'package:cv_e_commerce/core/helpers/wmo_helper.dart';
import 'package:cv_e_commerce/core/services/geo_api_service.dart';
import 'package:cv_e_commerce/core/services/location_service.dart';
import 'package:cv_e_commerce/model/geo_code_model.dart';
import 'package:cv_e_commerce/model/weather_model.dart';
import 'package:cv_e_commerce/core/services/weather_api_service.dart';
import 'package:cv_e_commerce/core/helpers/constant_helper.dart';
import 'package:cv_e_commerce/core/utils/logger/logger.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class WeatherController extends GetxController {
  RxBool isLoading = true.obs;
  late WeatherModel? weather;
  late GeoCodeModel? geoCode;
  String get dayVar => weather?.current?.isDay == 1 ? "day" : "night";
  String formatDate(DateTime date) {
    return DateFormat.yMd().format(date);
  }

  String formatTime(String timeString) {
    DateTime date = DateTime.parse(timeString);
    return DateFormat.jm().format(date);
  }

  String get date => formatDate(DateTime.now());

  String? get mainCondition =>
      wmoHelper[weather?.current?.weatherCode.toString()][dayVar]
          ["description"];
  String get currentTemparature =>
      "${weather?.current?.temperature2M?.round() ?? "Loading Temparature ..."}°C";
  String get cityName =>
      geoCode?.features?[0].properties?.city ?? "Loading city ...";
  String get currentTemparatureFeelsLike =>
      weather?.current?.apparentTemperature?.round().toString() ?? "";
  String get minTemparature =>
      "${weather?.daily?.temperature2MMin?[0].round()}°C";
  String get maxTemparature =>
      "${weather?.daily?.temperature2MMax?[0].round()}°C";
  String get sunrise => formatTime(weather?.daily?.sunrise?[0] ?? "");
  String get sunset => formatTime(weather?.daily?.sunset?[0] ?? "");
  String get dayLightDuration =>
      "${((weather?.daily?.daylightDuration?[0] ?? 1)/3600).round()}h";
  String get uvIndex => weather?.daily?.uvIndexMax?[0].toString() ?? "";
  String get humidity =>
      "${weather?.current?.relativeHumidity2M?.round()}%";
  String get rain =>
      "${weather?.daily?.precipitationProbabilityMax![0].round()}%";
  String get windSpeed =>
      weather?.current?.windSpeed10M?.round().toString() ?? "";

  @override
  void onInit() async {
    await LocationService().getCurrentLocation();
    await fetchWeather();
    super.onInit();
  }

  Future<WeatherModel?> fetchWeather() async {
    try {
      weather = await WeatherApiService().getWeather();
      geoCode = await GeoApiService().getGeoCode();
      Flog.success(weather);
      Flog.success(geoCode);
    } catch (e) {
      Flog.error(e.toString());
    }
    weather != null ? isLoading.value = false : null;
    return weather;
  }

  String get getWeatherAnimation {
    bool isDay = weather?.current?.isDay == 1;
    var wmoCode = weather?.current?.weatherCode.toString();
    // Check if the provided wmoCode exists in the wmoHelper map
    if (wmoHelper.containsKey(wmoCode)) {
      // Get the correct time of day (day or night)
      String timeOfDay = isDay ? "day" : "night";
      String description = wmoHelper[wmoCode][timeOfDay]["description"];

      // Match description to your available animations
      switch (description) {
        case "Cloudy":
          return cloudyLottie; // Your cloudy animation
        case "Partly Cloudy":
          return isDay
              ? partyCloudyLottieDay
              : partlyCloudyLottieNight; // Your cloudy animation

        case "Light Rain":
        case "Rain":
        case "Heavy Rain":
        case "Light Showers":
        case "Showers":
        case "Heavy Showers":
          return rainyLottie; // Your rain animation

        case "Thunderstorm":
        case "Thunderstorm With Hail":
        case "Light Thunderstorms With Hail":
          return rainyAndStromyLottie; // Your thunder animation

        case "Sunny":
          return isDay
              ? sunnyLottie
              : clearLottie; // Day and night specific clear animations

        default:
          return isDay
              ? sunnyLottie
              : clearLottie; // Default animation if no match
      }
    }

    // Return a fallback animation if the wmoCode doesn't exist in the map
    return isDay ? sunnyLottie : clearLottie;
  }
}
