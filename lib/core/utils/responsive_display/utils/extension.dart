part of '../responsive_display.dart';

/// An extension on [num] to provide various size and dimension calculations
/// based on screen and widget sizes. This extension is particularly useful
/// for building responsive UIs in Flutter.
///
/// Use this extension to:
/// - Calculate percentages of screen dimensions (height, width, diagonal).
/// - Adjust sizes based on widget dimensions.
/// - Scale font sizes dynamically.
/// - Adjust sizes based on aspect ratios and orientations.
///
/// Example usage:
/// ```dart
/// double height = 50.ph; // 50% of screen height
/// double width = 30.pw; // 30% of screen width
/// double fontSize = 16.sfs; // Scaled font size
/// double padding = 10.paddingSize; // Padding based on screen width
/// ```
extension SizerExtension on num {
  Size get _screenSize => DisplayService.logicalDisplaySize;
  double get _screenWidth => _screenSize.width;
  double get _screenHeight => _screenSize.height;
  double get _screenAspectRatio => _screenWidth / _screenHeight;
  double get _screenDiagonal =>
      sqrt(pow(_screenWidth, 2) + pow(_screenHeight, 2));

  double get _defaultScreenWidth => DisplayConfig.instance().defaultDeviceSize.width;
  double get _defaultScreenHeight => DisplayConfig.instance().defaultDeviceSize.height;
  double get _defaultScreenAspectRatio => _defaultScreenWidth / _defaultScreenHeight;
  double get _defaultScreenDiagonal => sqrt(pow(_defaultScreenWidth, 2) + pow(_defaultScreenHeight, 2));

  Size _widgetSize(BuildContext context) => DisplayService.of(context).dpSize;
  double _widgetWidth(BuildContext context) => _widgetSize(context).width;
  double _widgetHeight(BuildContext context) => _widgetSize(context).height;
  double _widgetWidthAspectRatio(BuildContext context) =>
      _widgetWidth(context) / _screenWidth;
  double _widgetHeightAspectRatio(BuildContext context) =>
      _widgetHeight(context) / _screenHeight;
  double _widgetDiagonal(BuildContext context) =>
      sqrt(pow(_widgetWidth(context), 2) + pow(_widgetHeight(context), 2));
  double _widgetDiagonalAspectRatio(BuildContext context) =>
      _widgetDiagonal(context) / _screenDiagonal;

  double _widgetWidthAspectRatioToDefault(BuildContext context) => _widgetWidthAspectRatio(context) / _defaultScreenAspectRatio;
  double _widgetHeightAspectRatioToDefault(BuildContext context) => _widgetHeightAspectRatio(context) / _defaultScreenAspectRatio;
  double _widgetDiagonalAspectRatioToDefault(BuildContext context) => _widgetDiagonalAspectRatio(context) / _defaultScreenAspectRatio;

  double _widgetScaledWidth(BuildContext context) => _widgetWidthAspectRatioToDefault(context) * _screenWidth;
  double _widgetScaledHeight(BuildContext context) => _widgetHeightAspectRatioToDefault(context) * _screenHeight;
  double _widgetScaledDiagonal(BuildContext context) => _widgetDiagonalAspectRatioToDefault(context) * _screenDiagonal;
  double _widgetScaledSize(BuildContext context) => _widgetDiagonalAspectRatioToDefault(context) * _screenDiagonal;


  /// Returns the percentage of the screen height. Shorthand for viewPortHeight is ph.
  ///
  /// Use this method to get a value that is a percentage of the screen height.
  ///
  /// Example:
  /// ```dart
  /// double height = 50.ph; // 50% of screen height
  /// ```
  double get viewPortHeight => this * (_screenHeight / 100);

  /// Shorthand for viewPortHeight.
  double get vh => viewPortHeight;

  /// Returns the percentage of the screen width. Shorthand for viewPortWidth is pw.
  ///
  /// Use this method to get a value that is a percentage of the screen width.
  ///
  /// Example:
  /// ```dart
  /// double width = 30.pw; // 30% of screen width
  /// ```
  double get viewPortWidth => this * (_screenWidth / 100);

  /// Shorthand for viewPortWidth.
  double get vw => viewPortWidth;

  /// Returns the percentage of the screen size (sum of height and width). Shorthand for viewPortSize is ps.
  ///
  /// Use this method to get a value that is a percentage of the total screen size.
  ///
  /// Example:
  /// ```dart
  /// double size = 20.ps; // 20% of screen size
  /// ```
  double get viewPortSize => this * (_screenHeight + _screenWidth) / 100;

  /// Shorthand for viewPortSize.
  double get vsize => viewPortSize;

  /// Returns the percentage of the smaller dimension (height or width). Shorthand for viewPortMinSize is pmins.
  ///
  /// Use this method to get a value that is a percentage of the smaller screen dimension.
  ///
  /// Example:
  /// ```dart
  /// double minSize = 10.pmins; // 10% of the smaller dimension
  /// ```
  double get viewPortMinSize => this * min(_screenHeight, _screenWidth) / 100;

  /// Shorthand for viewPortMinSize.
  double get vmin => viewPortMinSize;

  /// Returns the percentage of the larger dimension (height or width). Shorthand for viewPortMaxSize is pmaxs.
  ///
  /// Use this method to get a value that is a percentage of the larger screen dimension.
  ///
  /// Example:
  /// ```dart
  /// double maxSize = 10.pmaxs; // 10% of the larger dimension
  /// ```
  double get viewPortMaxSize => this * max(_screenHeight, _screenWidth) / 100;

  /// Shorthand for viewPortMaxSize.
  double get vmax => viewPortMaxSize;

  /// Returns the percentage of the diagonal of the screen. Shorthand for viewPortDiagonal is pd.
  ///
  /// Use this method to get a value that is a percentage of the screen diagonal.
  ///
  /// Example:
  /// ```dart
  /// double diagonal = 10.pd; // 10% of the screen diagonal
  /// ```
  double get viewPortDiagonal => this * _screenDiagonal / 100;

  /// Shorthand for viewPortDiagonal.
  double get vd => viewPortDiagonal;

  /// Returns the scaled height of the widget based on the screen size. Shorthand for adjustedHeight is adh.
  ///
  /// Use this method to get a value that is scaled based on the widget height and screen height.
  ///
  /// Example:
  /// ```dart
  /// double adjHeight = 10.adjh(context); // Scaled height based on widget and screen height
  /// ```
  double adjustedHeight(BuildContext context) =>
      this * _widgetScaledHeight(context);

  /// Shorthand for adjustedHeight.
  double adjh(BuildContext context) => adjustedHeight(context);

  /// Returns the scaled width of the widget based on the screen size. Shorthand for adjustedWidth is adw.
  ///
  /// Use this method to get a value that is scaled based on the widget width and screen width.
  ///
  /// Example:
  /// ```dart
  /// double adjWidth = 10.adjw(context); // Scaled width based on widget and screen width
  /// ```
  double adjustedWidth(BuildContext context) =>
      this * _widgetScaledWidth(context);

  /// Shorthand for adjustedWidth.
  double adjw(BuildContext context) => adjustedWidth(context);

  /// Returns the scaled size of the widget based on the screen size. Shorthand for adjustedSize is ads.
  ///
  /// Use this method to get a value that is scaled based on the widget size and screen size.
  ///
  /// Example:
  /// ```dart
  /// double adjSize = 10.adjs(context); // Scaled size based on widget and screen size
  /// ```
  double adjustedSize(BuildContext context) =>
      this * _widgetScaledSize(context);

  /// Shorthand for adjustedSize.
  double adjs(BuildContext context) => adjustedSize(context);

  /// Returns the minimum ratio of the widget based on the screen size and widget size. Shorthand for adjustedMinSize is adjmins.
  ///
  /// Use this method to get a value that is the minimum ratio of the widget size to the screen size.
  ///
  /// Example:
  /// ```dart
  /// double adjMinSize = 10.adjmins(context); // Minimum ratio of widget size to screen size
  /// ```
  double adjustedMinSize(BuildContext context) =>
      this *
      min(_widgetScaledWidth(context), _widgetScaledHeight(context));

  /// Shorthand for adjustedMinSize.
  double adjmins(BuildContext context) => adjustedMinSize(context);

  /// Returns the maximum ratio of the widget based on the screen size and widget size. Shorthand for adjustedMaxSize is adjmaxs.
  ///
  /// Use this method to get a value that is the maximum ratio of the widget size to the screen size.
  ///
  /// Example:
  /// ```dart
  /// double adjMaxSize = 10.adjmaxs(context); // Maximum ratio of widget size to screen size
  /// ```
  double adjustedMaxSize(BuildContext context) =>
      this *
      max(_widgetScaledWidth(context), _widgetScaledHeight(context));

  /// Shorthand for adjustedMaxSize.
  double adjmaxs(BuildContext context) => adjustedMaxSize(context);

  /// Returns the scaled diagonal of the widget based on the screen size. Shorthand for adjustedDiagonal is add.
  ///
  /// Use this method to get a value that is scaled based on the widget diagonal and screen diagonal.
  ///
  /// Example:
  /// ```dart
  /// double adjDiagonal = 10.adjd(context); // Scaled diagonal based on widget and screen diagonal
  /// ```
  double adjustedDiagonal(BuildContext context) =>
      this * _widgetScaledDiagonal(context);

  /// Shorthand for adjustedDiagonal.
  double adjd(BuildContext context) => adjustedDiagonal(context);

  /// Adjusts the size based on the screen's aspect ratio and landscape orientation. Shorthand for landscapeViewportWidth is las.
  ///
  /// Use this method to get a value that is adjusted based on the screen's aspect ratio in landscape orientation.
  ///
  /// Example:
  /// ```dart
  /// double landscapeSize = 10.las; // Adjusted size for landscape orientation
  /// ```
  double get landscapeViewportWidth =>
      this * (_screenWidth > _screenHeight ? 1 : _screenAspectRatio);

  /// Shorthand for landscapeViewportWidth.
  double get lvw => landscapeViewportWidth;

  /// Adjusts the size based on the screen's aspect ratio and portrait orientation. Shorthand for portraitViewPortWidth is pas.
  ///
  /// Use this method to get a value that is adjusted based on the screen's aspect ratio in portrait orientation.
  ///
  /// Example:
  /// ```dart
  /// double portraitSize = 10.pas; // Adjusted size for portrait orientation
  /// ```
  double get portraitViewPortWidth =>
      this * (_screenHeight > _screenWidth ? 1 : 1 / _screenAspectRatio);

  /// Shorthand for portraitViewPortWidth.
  double get pvh => portraitViewPortWidth;

  /// Scales the font size based on the default screen's size from [DisplayConfig] singleton. Shorthand for scaledFontSize is sfs. Alternative Shorthand is rem.
  ///
  /// Use this method to get a font size that is scaled based on the screen size.
  ///
  /// Example:
  /// ```dart
  /// double fontSize = 16.sfs; // Scaled font size
  /// ```
  double get scaledFontSize {
    return this *
        (_screenWidth * _screenHeight) /
        (_defaultScreenWidth * _defaultScreenHeight);
  }

  /// Shorthand for scaledFontSize.
  double get sfs => scaledFontSize;

  /// Alternativ Shorthand for scaledFontSize.
  double get rem => scaledFontSize;

  /// Returns the scaled font size based on the widget's size. Shorthand for scaledToWidgetFontSize is wsfs. Alternative Shorthand is wrem.
  /// Use this method to get a font size that is scaled based on the widget's size.
  /// Example:
  /// ```dart
  /// double fontSize = 16.wsfs; // Scaled font size based on widget size
  /// ```
  double scaledToWidgetFontSize(BuildContext context) {
    return this *
        (_screenWidth * _screenHeight) /
        (_widgetWidth(context) * _widgetHeight(context));
  }

  /// Shorthand for scaledToWidgetFontSize.
  double wsfs(BuildContext context) => scaledToWidgetFontSize(context);

  /// Alternativ Shorthand for scaledToWidgetFontSize.
  double wrem(BuildContext context) => scaledToWidgetFontSize(context);

  /// Returns added value based on the current screen size. Shorthand for responsiveAdd is radd.
  double responsiveAdd({double? watch, double? mobile, double? tablet, double? desktop}) {
    if (DisplayService().isSizeWatch) {
      return (watch ?? mobile ?? tablet ?? desktop ?? 0) + this;
    } else if (DisplayService().isSizeMobile) {
      return (mobile ?? watch ?? tablet ?? desktop ?? 0) + this;
    } else if (DisplayService().isSizeTablet) {
      return (tablet ?? watch ?? mobile ?? desktop ?? 0) + this;
    } else if (DisplayService().isSizeDesktop) {
      return (desktop ?? watch ?? mobile ?? tablet ?? 0) + this;
    } else {
      return toDouble();
    }
  }
  /// Shorthand for responsiveAdd.
  double radd({double? watch, double? mobile, double? tablet, double? desktop}) => responsiveAdd(watch: watch, mobile: mobile, tablet: tablet, desktop: desktop);

  /// Returns subtracted value based on the current screen size. Shorthand for responsiveSubtract is rsub.
  double responsiveSubtract({double? watch, double? mobile, double? tablet, double? desktop}) {
    if (DisplayService().isSizeWatch) {
      return (watch ?? mobile ?? tablet ?? desktop ?? 0) - this;
    } else if (DisplayService().isSizeMobile) {
      return (mobile ?? watch ?? tablet ?? desktop ?? 0) - this;
    } else if (DisplayService().isSizeTablet) {
      return (tablet ?? watch ?? mobile ?? desktop ?? 0) - this;
    } else if (DisplayService().isSizeDesktop) {
      return (desktop ?? watch ?? mobile ?? tablet ?? 0) - this;
    } else {
      return toDouble();
    }
  }
  /// Shorthand for responsiveSubtract.
  double rsub({double? watch, double? mobile, double? tablet, double? desktop}) => responsiveSubtract(watch: watch, mobile: mobile, tablet: tablet, desktop: desktop);

  /// Returns multiplied value based on the current screen size. Shorthand for responsiveMultiply is rmul.
  double responsiveMultiply({double? watch, double? mobile, double? tablet, double? desktop}) {
    if (DisplayService().isSizeWatch) {
      return (watch ?? mobile ?? tablet ?? desktop ?? 0) * this;
    } else if (DisplayService().isSizeMobile) {
      return (mobile ?? watch ?? tablet ?? desktop ?? 0) * this;
    } else if (DisplayService().isSizeTablet) {
      return (tablet ?? watch ?? mobile ?? desktop ?? 0) * this;
    } else if (DisplayService().isSizeDesktop) {
      return (desktop ?? watch ?? mobile ?? tablet ?? 0) * this;
    } else {
      return toDouble();
    }
  }
  /// Shorthand for responsiveMultiply.
  double rmul({double? watch, double? mobile, double? tablet, double? desktop}) => responsiveMultiply(watch: watch, mobile: mobile, tablet: tablet, desktop: desktop);

  /// Returns divided value based on the current screen size. Shorthand for responsiveDivide is rdiv.
  double responsiveDivide({double? watch, double? mobile, double? tablet, double? desktop}) {
    if (DisplayService().isSizeWatch) {
      return (watch ?? mobile ?? tablet ?? desktop ?? 0) / this;
    } else if (DisplayService().isSizeMobile) {
      return (mobile ?? watch ?? tablet ?? desktop ?? 0) / this;
    } else if (DisplayService().isSizeTablet) {
      return (tablet ?? watch ?? mobile ?? desktop ?? 0) / this;
    } else if (DisplayService().isSizeDesktop) {
      return (desktop ?? watch ?? mobile ?? tablet ?? 0) / this;
    } else {
      return toDouble();
    }
  }
  /// Shorthand for responsiveDivide.
  double rdiv({double? watch, double? mobile, double? tablet, double? desktop}) => responsiveDivide(watch: watch, mobile: mobile, tablet: tablet, desktop: desktop);
}
