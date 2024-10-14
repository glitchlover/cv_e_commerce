part of '../responsive_display.dart';

/// Helps to change `Root` widget.
/// `DisplayService` changes when the `ResponsiveView` aka the app's display size is changed.
/// `DisplayService` is a singleton. So, you can access it from anywhere in the app. You can use it to get the current display size, orientation, etc.
/// If you want to find `DisplayService` 
class DisplayService extends ChangeNotifier {
  DisplayMetrics _data;
  DisplayMetrics get data => _data;

  DisplayConfig? _config;
  set config(DisplayConfig config) {
    _config = config;
    notifyListeners();
  }

  /// Returns the current [DisplayConfig] object. If it is null, it returns the default default config.
  DisplayConfig get config => _config ?? _defaultConfig;

  static DisplayService? _instance;
  static DisplayConfig get _defaultConfig => DisplayConfig();

  DisplayService._instanceMaker({required DisplayMetrics data}) : _data = data;

  /// Initializes `DisplayService` with `DisplayMetrics`.
  factory DisplayService.initiate(
          {required DisplayMetrics data, DisplayConfig? config}) =>
      _instance = DisplayService._instanceMaker(data: data);

  factory DisplayService() => _instance!;

  /// Returns the instance of `DisplayService` if it exists, otherwise it returns null.
  static DisplayService of(BuildContext context) {
    final _Root? root = context.dependOnInheritedWidgetOfExactType<_Root>();
    DisplayService service;
    root == null
        ? service = root!.service
        : throw Exception('No DisplayService found');
    return service;
  }

  set data(DisplayMetrics data) {
    _data = data;
    notifyListeners();
  }

  bool get isSizeWatch => _data.screenType == DisplayType.watch;
  bool get isSizeMobile => _data.screenType == DisplayType.mobile;
  bool get isSizeTablet => _data.screenType == DisplayType.tablet;
  bool get isSizeDesktop => _data.screenType == DisplayType.desktop;

  Orientation get orientation => _data.orientation;
  MediaQueryData? get mediaQuery => _data.mediaQuery;

  Size get dpSize => _data.dipSize;
  Size get pxSize => _data.pixelSize;

  /// Returns the size of the screen in logical pixels (dp).
  ///
  /// Logical pixels are density-independent pixels (dp) and are used
  /// for consistent sizing across devices with different pixel densities.
  /// This is the size you should generally use for UI layout purposes.
  ///
  /// Example:
  /// ```dart
  /// Size logicalSize = DisplayService.logicalDisplaySize;
  /// print('Logical width: ${logicalSize.width}, Logical height: ${logicalSize.height}');
  /// ```
  static Size get logicalDisplaySize => physicalDisplaySize /
        WidgetsBinding.instance.platformDispatcher.views.first.devicePixelRatio;

  /// Returns the size of the screen in physical pixels (px).
  ///
  /// Physical pixels represent the actual pixel resolution of the screen.
  /// This value is device-dependent and may vary across devices.
  /// It is not typically used for UI layout directly, but it can be useful for
  /// tasks such as handling images or videos that need pixel-perfect resolution.
  ///
  /// Example:
  /// ```dart
  /// Size physicalSize = DisplayService.physicalDisplaySize;;
  /// print('Physical width: ${physicalSize.width}, Physical height: ${physicalSize.height}');
  /// ```
  static Size get physicalDisplaySize =>
      WidgetsBinding.instance.platformDispatcher.views.first.physicalSize;

  /// Updates the [DisplayService]'s data with the given [MediaQueryData].
  ///
  /// This method is used by [ResponsiveView] to update the [DisplayService] when
  /// the app's display size changes.
  ///
  /// It creates a new [DisplayMetrics] object with the given [MediaQueryData] and
  /// updates the [DisplayService]'s data with the new [DisplayMetrics].
  ///
  /// It returns the updated [DisplayMetrics].
  DisplayMetrics update(MediaQueryData query) {
    Size physicalSize = query.size;
    Size logicalSize = query.size / query.devicePixelRatio;
    DisplayMetrics displayData = DisplayMetrics(
        screenType: screenType,
        pixelSize: physicalSize,
        dipSize: logicalSize,
        orientation: query.orientation,
        mediaQuery: query);
    return data = displayData;
  }

  /// Returns the [DisplayType] of the screen based on the given [MediaQueryData].
  ///
  /// It uses the following breakpoints to determine the screen type:
  /// - Watch: 0 - 320
  /// - Mobile: 321 - 800
  /// - Tablet: 801 - 1200
  /// - Desktop: > 1200
  ///
  /// The breakpoints are based on the logical width (dp) of the device.
  /// If the device is in landscape orientation, the height is used instead.
  DisplayType get screenType {
    double deviceWidth = 0;

    double mobileWidthBreakpoint = config.mobile.width;
    double tabletWidthBreakpoint = config.tablet.width;
    double desktopWidthBreakpoint = config.desktop.width;

    Size size = logicalDisplaySize;

    if (size.width > desktopWidthBreakpoint) {
      return DisplayType.desktop;
    } else if (orientation == Orientation.portrait) {
      deviceWidth = size.width;
    } else {
      deviceWidth = size.height;
    }

    return deviceWidth > mobileWidthBreakpoint
        ? DisplayType.mobile
        : deviceWidth > tabletWidthBreakpoint
            ? DisplayType.tablet
            : DisplayType.watch;
  }
}
