import 'package:cv_e_commerce/core/helpers/color_helper.dart';
import 'package:flutter/material.dart';
import 'package:cv_e_commerce/core/utils/responsive_display/responsive_display.dart';

class TextHelper {
  static const String fontFamily = "Nunito";
  // Display styles
  static Text display1(String text,
      {Color color = ColorHelper.onBackground,
      FontWeight fontWeight = FontWeight.w900}) {
    return Text(text,
        style: TextStyle(
          fontSize: 45.0.rem,
          fontFamily: fontFamily,
          color: color,
        fontVariations: [
          FontVariation(
              'wght', ((fontWeight.index + 1) * 100).toDouble())
          ],
        ));
  }

  static Text display2(String text,
      {Color color = ColorHelper.onBackground,
      FontWeight fontWeight = FontWeight.bold}) {
    return Text(text,
        style: TextStyle(
          fontSize: 30.0.rem,
          fontFamily: fontFamily,
          color: color,
        fontVariations: [
          FontVariation(
              'wght', ((fontWeight.index + 1) * 100).toDouble())
        ],
        ));
  }

  // Headline styles
  static Text headline1(String text,
      {Color color = ColorHelper.onBackground,
      FontWeight fontWeight = FontWeight.bold}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 28.0.rem,
        fontFamily: fontFamily,
        color: color,
        fontVariations: [
          FontVariation(
              'wght', ((fontWeight.index + 1) * 100).toDouble())
        ],
      ),
    );
  }

  static Text headline2(String text,
      {Color color = ColorHelper.onBackground,
      FontWeight fontWeight = FontWeight.bold}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 14.5.rem,
        fontFamily: fontFamily,
        color: color,
        fontVariations: [
          FontVariation(
              'wght', ((fontWeight.index + 1) * 100).toDouble())
        ],
      ),
    );
  }

  // Body styles
  static Text bodyText1(String text,
      {Color color = ColorHelper.onBackground,
      FontWeight fontWeight = FontWeight.normal}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 14.0.rem,
        fontFamily: fontFamily,
        color: color,
        fontVariations: [
          FontVariation(
              'wght', ((fontWeight.index + 1) * 100).toDouble())
        ],
      ),
    );
  }

  static Text bodyText2(String text,
      {Color color = ColorHelper.onBackground,
      FontWeight fontWeight = FontWeight.normal}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 14.0.rem,
        fontFamily: fontFamily,
        color: color,
        fontVariations: [
          FontVariation(
              'wght', ((fontWeight.index + 1) * 100).toDouble())
        ],
      ),
    );
  }

  // Subtitle styles
  static Text subtitle1(String text,
      {Color color = ColorHelper.onBackground,
      FontWeight fontWeight = FontWeight.w300}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 14.0.rem,
        fontFamily: fontFamily,
        color: color,
        fontVariations: [
          FontVariation(
              'wght', ((fontWeight.index + 1) * 100).toDouble())
        ],
      ),
    );
  }

  static Text subtitle2(String text,
      {Color? color,
      FontWeight fontWeight = FontWeight.w300}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 14.0,
        fontStyle: FontStyle.italic,
        color: color ?? ColorHelper.gray600,
        fontVariations: [
          FontVariation(
              'wght', ((fontWeight.index + 1) * 100).toDouble())
        ],
      ),
    );
  }
  // Caption styles
  static Text caption(String text,
      {Color? color, FontWeight fontWeight = FontWeight.w300}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 12.0.rem,
        color: color ?? ColorHelper.gray600,
        fontVariations: [
          FontVariation(
              'wght', ((fontWeight.index + 1) * 100).toDouble())
        ],
      ),
    );
  }

  // Button styles
  static Text buttonText(String text, {Color color = Colors.white, FontWeight fontWeight = FontWeight.bold}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 14.0.rem,
        color: color,
        fontVariations: [
          FontVariation(
              'wght', ((fontWeight.index + 1) * 100).toDouble())
        ],
      ),
    );
  }

  static Text customText(String text, {Color color = ColorHelper.onBackground, FontWeight fontWeight = FontWeight.normal, double fontSize = 14.0, FontStyle fontStyle = FontStyle.normal}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontVariations: [
          FontVariation(
              'wght', ((fontWeight.index + 1) * 100).toDouble())
        ],
      ),
    );
  }
}
