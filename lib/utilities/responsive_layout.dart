import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;
  final Widget? tiny;
  final Widget? largeTablet;

  const ResponsiveLayout({
    Key? key,
    required this.mobile,
    this.tablet,
    this.desktop,
    this.tiny,
    this.largeTablet,
  }) : super(key: key);

  static const Widget defaultWidget = Center(
    child: Text('Tanımlanmayan Cihaz'),
  );

  static const int tinyHeightLimit = 100;
  static const int tinyLimit = 270;
  static const int mobileLimit = 550;
  static const int tabletLimit = 800;
  static const int largeTabletLimit = 1100;

// This size work fine on my design, maybe you need some customization depends on your design

  // This isMobile, isTablet, isDesktop helep us later

  static bool isTinyLimit(BuildContext context) =>
      MediaQuery.of(context).size.width < tinyLimit;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < tabletLimit;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1100 &&
      MediaQuery.of(context).size.width >= tabletLimit;

  static bool isLargeTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < largeTabletLimit &&
      MediaQuery.of(context).size.width >= tabletLimit;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= largeTabletLimit;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < tinyLimit ||
            constraints.maxHeight < tinyHeightLimit) {
          return tiny ?? mobile;
        }
        if (constraints.maxWidth < mobileLimit) {
          return mobile;
        }
        if (constraints.maxWidth < tabletLimit) {
          return tablet ?? mobile;
        }
        if (constraints.maxWidth < largeTabletLimit) {
          return largeTablet ?? mobile;
        } else {
          return desktop ?? mobile;
        }
      },
    );
  }
}
