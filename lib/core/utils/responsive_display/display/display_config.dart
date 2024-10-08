part of  '../responsive_display.dart';

class _DefaultConfig {
  static const Size watch = Size(0, 0);
  static const Size mobile = Size(320, 640);
  static const Size tablet = Size(800, 1200);
  static const Size desktop = Size(1200, 1200);

  static const DisplayType defaultDevice = DisplayType.mobile;
}

/// `DisplayConfig` is a class that holds the configuration for the display.
/// The default configuration is:
/// - watch: Size(0, 0)
/// - mobile: Size(320, 640)
/// - tablet: Size(800, 1200)
/// - desktop: Size(1200, 1200)
/// 
/// If you want to change the default configuration, you can do so by creating a new instance of DisplayConfig before the app starts.
/// Example:
/// ```dart
/// main() {
/// DisplayConfig(
///   watch: Size(0, 0),
///   mobile: Size(320, 640), 
///   tablet: Size(800, 1200), 
///   desktop: Size(1200, 1200), 
///   defaultDevice: DisplayType.mobile
/// );
/// runApp(const MyApp());
/// ```
/// 
/// To get accesss to the configuration, you can use the `DisplayConfig.instance()` method.
class DisplayConfig {
  final Size watch;
  final Size mobile;
  final Size tablet;
  final Size desktop;
  final DisplayType defaultDevice;

  const DisplayConfig._instanceMaker({
    required this.watch,
    required this.mobile,
    required this.tablet,
    required this.desktop,
    required this.defaultDevice,
  });

  static DisplayConfig? _instance;

  factory DisplayConfig.instance() => _instance ?? DisplayConfig();

  factory DisplayConfig({
    Size watch = _DefaultConfig.watch,
    Size mobile = _DefaultConfig.mobile,
    Size tablet = _DefaultConfig.tablet,
    Size desktop = _DefaultConfig.desktop,
    DisplayType defaultDevice = _DefaultConfig.defaultDevice,
  }) =>
      _instance ??= DisplayConfig._instanceMaker(
        watch: watch,
        mobile: mobile,
        tablet: tablet,
        desktop: desktop,
        defaultDevice: defaultDevice,
      );

  Size get defaultDeviceSize => defaultDevice == DisplayType.watch
      ? watch
      : defaultDevice == DisplayType.mobile
          ? mobile
          : defaultDevice == DisplayType.tablet
              ? tablet
              : desktop;
}
