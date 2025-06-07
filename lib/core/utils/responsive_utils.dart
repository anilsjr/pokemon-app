import 'package:flutter/material.dart';

/// A utility class for responsive design
class ResponsiveUtils {
  /// Screen sizes
  static const double mobileBreakpoint = 600;
  static const double tabletBreakpoint = 900;
  static const double desktopBreakpoint = 1200;

  /// Returns true if the screen width is less than the mobile breakpoint
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < mobileBreakpoint;
  }

  /// Returns true if the screen width is between mobile and tablet breakpoints
  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= mobileBreakpoint && width < desktopBreakpoint;
  }

  /// Returns true if the screen width is greater than or equal to the desktop breakpoint
  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= desktopBreakpoint;
  }

  /// Returns a value based on the current screen size
  static T responsiveValue<T>({
    required BuildContext context,
    required T mobile,
    T? tablet,
    required T desktop,
  }) {
    final width = MediaQuery.of(context).size.width;

    if (width >= desktopBreakpoint) {
      return desktop;
    } else if (width >= mobileBreakpoint) {
      return tablet ?? desktop;
    } else {
      return mobile;
    }
  }

  /// Returns a responsive padding based on screen size
  static EdgeInsets responsivePadding(BuildContext context) {
    return responsiveValue(
      context: context,
      mobile: const EdgeInsets.all(16.0),
      tablet: const EdgeInsets.all(24.0),
      desktop: const EdgeInsets.all(32.0),
    );
  }

  /// Returns a responsive grid crossAxisCount based on screen size
  static int responsiveGridCount(BuildContext context) {
    return responsiveValue(context: context, mobile: 2, tablet: 3, desktop: 5);
  }
}
