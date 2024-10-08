import 'package:cv_e_commerce/core/helpers/color_helper.dart';
import 'package:cv_e_commerce/core/helpers/getx_helper.dart';
import 'package:cv_e_commerce/core/helpers/size_helper.dart';
import 'package:cv_e_commerce/core/helpers/space_helper.dart';
import 'package:cv_e_commerce/core/helpers/text_helper.dart';
import 'package:cv_e_commerce/core/utils/responsive_display/responsive_display.dart';
import 'package:cv_e_commerce/model/weather_model.dart';
import 'package:cv_e_commerce/views/weather/weather_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class WeatherView extends GetView<WeatherController> {
  const WeatherView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorHelper.background,
        body: SafeArea(
          child: Center(
            child: Obx(
              () => !controller.isLoading.value
                  ? MainContent(weatherModel: controller.weather)
                  : const CircularProgressIndicator(),
            ),
          ),
        ));
  }
}

class MainContent extends StatelessWidget {
  const MainContent({
    super.key,
    this.weatherModel,
  });

  final WeatherModel? weatherModel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ResponsiveDisplayBuilder(
        builder: (context, service) => Container(
          margin: SpaceHelper.layoutMargin,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TodayWeatherContent(weatherModel: weatherModel),
            ],
          ),
        ),
      ),
    );
  }
}

class TodayWeatherContent extends StatelessWidget {
  const TodayWeatherContent({
    super.key,
    required this.weatherModel,
  });

  final WeatherModel? weatherModel;

  @override
  Widget build(BuildContext context) {
    WeatherController controller = GetxHelper.weatherCtrl;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextHelper.headline1(controller.cityName, fontWeight: FontWeight.normal, color: ColorHelper.gray800),
        TextHelper.subtitle1(controller.date, color: ColorHelper.gray600),
        SpaceHelper.midiumPadding,
        Lottie.asset(controller.getWeatherAnimation,
            height: SizeHelper.mediumSize),
        SpaceHelper.defaultPadding,
        IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  TextHelper.display1(controller.currentTemparature),
                  TextHelper.caption("Feels like ${controller.currentTemparatureFeelsLike}°C"),
                ],
              ),
              SpaceHelper.smallPadding,
              const VerticalDivider(
                thickness: 2,
                color: ColorHelper.onBackground,
              ),
              SpaceHelper.smallPadding,
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextHelper.headline2(controller.mainCondition!),
                  SpaceHelper.xtraSmallPadding,
                  TextHelper.subtitle1("${controller.maxTemparature} / ${controller.minTemparature}", color: ColorHelper.gray700),
              ],),
            ],
          ),
        ),
        SpaceHelper.xLargePadding,
        SpaceHelper.xLargePadding,
        currentWeatherVariableSections(controller),  
        SpaceHelper.defaultPadding,
      ],
    );
  }

  Container currentWeatherVariableSections(WeatherController controller) {
    return SizeHelper.smallSection(
        presentingVariablesInRow(variable1: (controller.humidity, "Humidity"), variable2: (controller.rain, "Rain"), variable3: (controller.uvIndex, "UV")),
      );
  }

  Widget presentingVariablesInRow({required (String, String) variable1, required (String, String) variable2, required (String, String) variable3}) {
    return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              presentTheVariable(variable1),
              presentTheVariable(variable2),
              presentTheVariable(variable3),
          ],);
  }

  Column presentTheVariable((String, String) variable1) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextHelper.bodyText1(variable1.$1, fontWeight: FontWeight.bold),
        TextHelper.caption(variable1.$2),
      ],
    );
  }
}
