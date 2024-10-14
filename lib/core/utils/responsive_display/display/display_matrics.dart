part of '../responsive_display.dart';

class DisplayMetrics {
  final Orientation orientation;
  final DisplayType screenType;
  final Size pixelSize;
  final Size dipSize;
  final MediaQueryData? mediaQuery;

  DisplayMetrics(
      {this.orientation = Orientation.portrait,
      this.screenType = DisplayType.mobile,
      this.pixelSize = Size.zero,
      this.dipSize = Size.zero,
      this.mediaQuery});

  @override
  String toString() {
    return '''DisplayMetrics(
      \t\t orientation: $orientation, 
      \t\t ScreenType: $screenType,
      \t\t pixelSize: $pixelSize, 
      \t\t dipSize: $dipSize)''';
  }
}
