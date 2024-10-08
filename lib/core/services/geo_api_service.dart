import 'dart:io';

import 'package:cv_e_commerce/core/services/location_service.dart';
import 'package:cv_e_commerce/core/utils/logger/logger.dart';
import 'package:cv_e_commerce/model/geo_code_model.dart';
import 'package:http/http.dart' as http;

class GeoApiService {
  String _httpGeocodingApiUrl(double lat, double lon) =>
      "https://api.geoapify.com/v1/geocode/reverse?lat=$lat&lon=$lon&apiKey=92c8615e605145deaad86a51820a5c46";

  Future<GeoCodeModel> _getGeoCodeApiResponse(double lat, double lon) async {
    var uri = Uri.parse(_httpGeocodingApiUrl(lat, lon));
    http.Response response = await http.get(uri);
    if (response.statusCode == HttpStatus.ok) {
      //prints the url's main website address only for example from _httpWeatherApiUrl only "https://api.open-meteo.com" and in _httpGeocodingApiUrl only "https://api.geoapify.com"
      Flog.success(
          "yay to ${uri.origin.splitMapJoin(RegExp(r"https://.*?/"), onMatch: (m) => m.group(0)!, onNonMatch: (n) => "")}");
      return geoCodeModelFromJson(response.body);
    } else {
      Flog.warning(response.body);
      throw Exception("Failed to load data");
    }
  }

  Future<GeoCodeModel> getGeoCode() async {
    double lat = LocationService().position!.latitude;
    double lon = LocationService().position!.longitude;

    return _getGeoCodeApiResponse(lat, lon);
  }
}
