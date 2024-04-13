import 'package:flutter/material.dart';

class Navigation {
  final GlobalKey<NavigatorState> navigationKey;
  static Navigation instance = Navigation();

  Navigation() : navigationKey = GlobalKey<NavigatorState>();

  dynamic pushReplacement(Route route, {Object? arguments}) {
    return navigationKey.currentState?.pushReplacement(route);
  }

  dynamic pushReplacementNamed(String routeName, {Object? arguments}) {
    return navigationKey.currentState?.pushReplacementNamed(
      routeName,
      arguments: arguments,
    );
  }

  dynamic pushNamed(String routeName, {Object? arguments}) {
    return navigationKey.currentState?.pushNamed(
      routeName,
      arguments: arguments,
    );
  }

  dynamic push(Route route) {
    return navigationKey.currentState?.push(route);
  }

  dynamic pop() {
    return navigationKey.currentState?.pop();
  }

  /// Push and remove all previous routes
  dynamic pushNamedAndRemoveAll(String routeName, {Object? arguments}) {
    return navigationKey.currentState?.pushNamedAndRemoveUntil(
      routeName,
      arguments: arguments,
      (route) => false,
    );
  }

  /// Push and remove all previous routes using ```route```
  dynamic pushAndRemoveAll(Route route) {
    return navigationKey.currentState?.pushAndRemoveUntil(
      route,
      (route) => false,
    );
  }

  /// Push and remove all the previous routes until the predicate using ```route```
  dynamic pushAndRemoveUntil(
    Route route,
    String removeRouteName,
  ) {
    return navigationKey.currentState?.pushAndRemoveUntil(
      route,
      ModalRoute.withName(removeRouteName),
    );
  }

  /// Push and remove all the previous routes until the predicate using ```routeName```
  dynamic pushNamedAndRemoveUntil(
    String routeName,
    String removeRouteName, {
    Object? arguments,
  }) {
    return navigationKey.currentState?.pushNamedAndRemoveUntil(
      routeName,
      arguments: arguments,
      ModalRoute.withName(removeRouteName),
    );
  }
}
