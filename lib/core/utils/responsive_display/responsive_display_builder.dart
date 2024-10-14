part of 'responsive_display.dart';

class _Root extends InheritedNotifier<DisplayService> {
  final DisplayService service;

  const _Root({
    required this.service,
    required super.child,
  });

  @override
  bool updateShouldNotify(_Root oldWidget) => service != oldWidget.service;
}

/// Helps to build responsive UI.
class ResponsiveDisplayBuilder extends StatefulWidget {
  /// The default and compulsary builder function.
  final Widget Function(BuildContext, DisplayService) builder;

  /// Optional builder function for watch devices.
  final Widget Function(BuildContext, DisplayService)? watchBuilder;

  /// Optional builder function for mobile devices.
  final Widget Function(BuildContext, DisplayService)? mobileBuilder;

  /// Optional builder function for tablet devices.
  final Widget Function(BuildContext, DisplayService)? tabletBuilder;

  /// Optional builder function for desktop devices.
  final Widget Function(BuildContext, DisplayService)? desktopBuilder;

  const ResponsiveDisplayBuilder({
    super.key,
    required this.builder,
    this.watchBuilder,
    this.mobileBuilder,
    this.tabletBuilder,
    this.desktopBuilder,
  });

  @override
  State<ResponsiveDisplayBuilder> createState() => _ResponsiveDisplay();

  static DisplayService of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<_Root>()?.service ??
      DisplayService();
  // static BuildContext context =>
}

class _ResponsiveDisplay extends State<ResponsiveDisplayBuilder>
    with WidgetsBindingObserver {
  DisplayMetrics displayData = DisplayMetrics();
  late DisplayService service;

  @override
  void initState() {
    super.initState();
    service = DisplayService.initiate(data: displayData);
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeMetrics() => setState(() => service.update(MediaQuery.of(context)));

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    DisplayService().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    service.update(MediaQuery.of(context));

    return _Root(
        service: service,
        child: service.isSizeMobile && widget.mobileBuilder != null
            ? widget.mobileBuilder!(context, service)
            : service.isSizeTablet && widget.tabletBuilder != null
                ? widget.tabletBuilder!(context, service)
                : service.isSizeDesktop && widget.desktopBuilder != null
                    ? widget.desktopBuilder!(context, service)
                    : service.isSizeWatch && widget.watchBuilder != null
                        ? widget.watchBuilder!(context, service)
                        : widget.builder(context, service));
  }
}
