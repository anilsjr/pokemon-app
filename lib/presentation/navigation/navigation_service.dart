import 'package:flutter/material.dart';

class NavigationService {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static NavigatorState get navigator => navigatorKey.currentState!;

  static Future<T?> navigateTo<T>(Route<T> route) {
    return navigator.push(route);
  }

  static Future<T?> navigateToNamed<T>(String routeName, {Object? arguments}) {
    return navigator.pushNamed(routeName, arguments: arguments);
  }

  static Future<T?> navigateToReplacement<T>(Route<T> route) {
    return navigator.pushReplacement(route);
  }

  static Future<T?> navigateToReplacementNamed<T>(
    String routeName, {
    Object? arguments,
  }) {
    return navigator.pushReplacementNamed(routeName, arguments: arguments);
  }

  static Future<T?> navigateToAndRemoveUntil<T>(
    Route<T> route,
    RoutePredicate predicate,
  ) {
    return navigator.pushAndRemoveUntil(route, predicate);
  }

  static Future<T?> navigateToNamedAndRemoveUntil<T>(
    String routeName,
    RoutePredicate predicate, {
    Object? arguments,
  }) {
    return navigator.pushNamedAndRemoveUntil(
      routeName,
      predicate,
      arguments: arguments,
    );
  }

  static void goBack<T>([T? result]) {
    return navigator.pop(result);
  }

  static void goBackToFirst() {
    return navigator.popUntil((route) => route.isFirst);
  }
}
