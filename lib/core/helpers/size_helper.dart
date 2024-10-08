import 'package:cv_e_commerce/core/helpers/color_helper.dart';
import 'package:cv_e_commerce/core/helpers/space_helper.dart';
import 'package:flutter/material.dart';

class SizeHelper{
  static double smallSize = 100;
  static double mediumSize = 200;
  static double largeSize = 300;
  static double xLargeSize = 400;
  static double xxLargeSize = 500;

  static SizedBox smallBox(Widget child){
    return SizedBox(
      height: smallSize,
      width: smallSize,
      child: child,
    );
  }

  static SizedBox mediumBox(Widget child){
    return SizedBox(
      height: mediumSize,
      width: mediumSize,
      child: child,
    );
  }

  static SizedBox largeBox(Widget child){
    return SizedBox(
      height: largeSize,
      width: largeSize,
      child: child,
    );
  }

  static SizedBox xLargeBox(Widget child){
    return SizedBox(
      height: xLargeSize,
      width: xLargeSize,
      child: child,
    );
  }

  static Container smallSection(Widget child){
    return Container(
      alignment: Alignment.center,
      padding: SpaceHelper.largeSpace,
      color: ColorHelper.surface,
      height: smallSize + SpaceHelper.sm * 2,
      width: double.maxFinite,
      child: child,
    );
  }

  static Container mediumSection(Widget child){
    return Container(
      alignment: Alignment.center,
      padding: SpaceHelper.midiumSpace,
      color: ColorHelper.surface,
      height: mediumSize + SpaceHelper.md * 2,
      width: double.maxFinite,
      child: child,
    );
  }

  static Container largeSection(Widget child){
    return Container(
      alignment: Alignment.center,
      padding: SpaceHelper.largeSpace,
      color: ColorHelper.surface,
      height: largeSize + SpaceHelper.lg * 2,
      width: double.maxFinite,
      child: child,
    );
  }

  static Container xLargeSection(Widget child){
    return Container(
      alignment: Alignment.center,
      padding: SpaceHelper.xLargeSpace,
      color: ColorHelper.surface,
      height: xLargeSize + SpaceHelper.xl * 2,
      width: double.maxFinite,
      child: child,
    );
  }
}