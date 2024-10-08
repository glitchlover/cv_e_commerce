import 'package:flutter/material.dart';

class SpaceHelper {
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;
  static const double xxl = 40.0;

  static const EdgeInsetsGeometry layoutMargin = EdgeInsets.symmetric(horizontal: md);
  static const EdgeInsetsGeometry xtraSmallSpace = EdgeInsets.symmetric(horizontal: xs, vertical: xs);
  static const EdgeInsetsGeometry smallSpace = EdgeInsets.symmetric(horizontal: sm, vertical: sm);
  static const EdgeInsetsGeometry defaultSpace = EdgeInsets.symmetric(horizontal: sm, vertical: sm);
  static const EdgeInsetsGeometry defaultSpaceVertical = EdgeInsets.symmetric(vertical: sm);
  static const EdgeInsetsGeometry defaultSpaceHorizontal = EdgeInsets.symmetric(horizontal: sm);
  static const EdgeInsetsGeometry defaultSpaceTop = EdgeInsets.only(top: sm);
  static const EdgeInsetsGeometry defaultSpaceBottom = EdgeInsets.only(bottom: sm);
  static const EdgeInsetsGeometry defaultSpaceLeft = EdgeInsets.only(left: sm);
  static const EdgeInsetsGeometry defaultSpaceRight = EdgeInsets.only(right: sm);
  static const EdgeInsetsGeometry midiumSpace = EdgeInsets.symmetric(horizontal: md, vertical: md);
  static const EdgeInsetsGeometry midiumSpaceVertical = EdgeInsets.symmetric(vertical: md);
  static const EdgeInsetsGeometry midiumSpaceHorizontal = EdgeInsets.symmetric(horizontal: md);
  static const EdgeInsetsGeometry midiumSpaceTop = EdgeInsets.only(top: md);
  static const EdgeInsetsGeometry midiumSpaceBottom = EdgeInsets.only(bottom: md);
  static const EdgeInsetsGeometry midiumSpaceLeft = EdgeInsets.only(left: md);
  static const EdgeInsetsGeometry midiumSpaceRight = EdgeInsets.only(right: md);
  static const EdgeInsetsGeometry largeSpace = EdgeInsets.symmetric(horizontal: lg, vertical: lg);
  static const EdgeInsetsGeometry largeSpaceVertical = EdgeInsets.symmetric(vertical: lg);
  static const EdgeInsetsGeometry largeSpaceHorizontal = EdgeInsets.symmetric(horizontal: lg);
  static const EdgeInsetsGeometry largeSpaceTop = EdgeInsets.only(top: lg);
  static const EdgeInsetsGeometry largeSpaceBottom = EdgeInsets.only(bottom: lg);
  static const EdgeInsetsGeometry largeSpaceLeft = EdgeInsets.only(left: lg);
  static const EdgeInsetsGeometry largeSpaceRight = EdgeInsets.only(right: lg);
  static const EdgeInsetsGeometry xLargeSpace = EdgeInsets.symmetric(horizontal: xl, vertical: xl);
  static const EdgeInsetsGeometry xLargeSpaceVertical = EdgeInsets.symmetric(vertical: xl);
  static const EdgeInsetsGeometry xLargeSpaceHorizontal = EdgeInsets.symmetric(horizontal: xl);
  static const EdgeInsetsGeometry xLargeSpaceTop = EdgeInsets.only(top: xl);
  static const EdgeInsetsGeometry xLargeSpaceBottom = EdgeInsets.only(bottom: xl);
  static const EdgeInsetsGeometry xLargeSpaceLeft = EdgeInsets.only(left: xl);
  static const EdgeInsetsGeometry xLargeSpaceRight = EdgeInsets.only(right: xl);
  //Using every edgetInsetsGeometry make Padding widget
  static Padding xtraSmallPadding = const Padding(padding: xtraSmallSpace);
  static Padding smallPadding = const Padding(padding: smallSpace);
  static Padding defaultPadding = const Padding(padding: defaultSpace);
  static Padding midiumPadding = const Padding(padding: midiumSpace);
  static Padding largePadding = const Padding(padding: largeSpace);
  static Padding xLargePadding = const Padding(padding: xLargeSpace);

}
