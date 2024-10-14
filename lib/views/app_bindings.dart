import 'package:cv_e_commerce/views/weather/weather_controller.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(WeatherController());
  }
}