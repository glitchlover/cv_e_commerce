import 'dart:io';

import 'package:cv_e_commerce/model/weather_model.dart';
import 'package:cv_e_commerce/core/services/location_service.dart';
import 'package:cv_e_commerce/core/utils/logger/logger.dart';
import 'package:http/http.dart' as http;

class WeatherApiService {
  String _httpWeatherApiUrl(double lat, double lon) =>
      "https://api.open-meteo.com/v1/forecast?latitude=$lat&longitude=$lon&current=temperature_2m,relative_humidity_2m,apparent_temperature,is_day,precipitation,weather_code,wind_speed_10m,wind_direction_10m&daily=weather_code,temperature_2m_max,temperature_2m_min,sunrise,sunset,daylight_duration,uv_index_max,precipitation_probability_max&timezone=auto";

  Future<WeatherModel> _getWeatherApiResponse(double lat, double lon) async {
    var url = Uri.parse(_httpWeatherApiUrl(lat, lon));
    http.Response response = await http.get(url);
    if (response.statusCode == HttpStatus.ok) {
      //prints the url's main website address only for example from _httpWeatherApiUrl only "https://api.open-meteo.com" and in _httpGeocodingApiUrl only "https://api.geoapify.com"
      Flog.success(
          "yay to ${url.origin.splitMapJoin(RegExp(r"https://.*?/"), onMatch: (m) => m.group(0)!, onNonMatch: (n) => "")}");

      return weatherEntityFromJson(response.body);
    } else {
      Flog.warning(response.body);
      throw Exception("Failed to load data");
    }
  }

  Future<WeatherModel> getWeather() async {
    double lat = LocationService().position!.latitude;
    double lon = LocationService().position!.longitude;

    WeatherModel currentWeather =
        await _getWeatherApiResponse(lat, lon);

    Flog.info("Current Weather Model: ${currentWeather.toString()}");

    return currentWeather;
  }
}
