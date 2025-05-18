//
//  pingbox
//  extensions.dart
//
//  Created by Ngonidzashe Mangudya on 1/22/25.
//  Copyright (c) 2025 Codecraft Solutions. All rights reserved.
//

import 'package:flutter/material.dart';
import 'package:handy_extensions/handy_extensions.dart';

import '../../routing/route.dart';
import '../../routing/router_delegate.dart';
import '../configs/colors.dart';

extension ContextExtensions<T> on BuildContext {
  AppRouterDelegate get _routerDelegate =>
      Router.of(this).routerDelegate as AppRouterDelegate;

  /// Unified go: accepts a route path and optional arguments (used as query parameters)
  void go(String route, {Map<String, dynamic> arguments = const {}}) {
    final queryParams =
        arguments.map((key, value) => MapEntry(key, value.toString()));
    _routerDelegate.setNewRoutePath(
      PingboxRoute(route, queryParameters: queryParams),
    );
  }

  /// Replace current page with a new one
  void goToAndReplace(
    String route, {
    Map<String, dynamic> arguments = const {},
  }) {
    final queryParams = arguments.map((k, v) => MapEntry(k, v.toString()));
    _routerDelegate
      ..navigatorKey.currentState?.pop()
      ..setNewRoutePath(
        PingboxRoute(route, queryParameters: queryParams),
      );
  }

  /// Clears back stack and navigates to a new route
  void goToAndRemoveUntil(
    String route, {
    Map<String, dynamic> arguments = const {},
  }) {
    final queryParams = arguments.map((k, v) => MapEntry(k, v.toString()));
    final navigator = _routerDelegate.navigatorKey.currentState!;
    while (navigator.canPop()) {
      navigator.pop();
    }
    _routerDelegate.setNewRoutePath(
      PingboxRoute(route, queryParameters: queryParams),
    );
  }

  void goBack<T>({T? value}) {
    Navigator.of(this).pop<T>(value);
  }

  // notify
  void notify(String message, {bool isError = false}) =>
      ScaffoldMessenger.of(this).showSnackBar(
        SnackBar(
          content: Text(
            message,
            style: TextStyle(
              color: isError ? PingboxColors.white : PingboxColors.navyBlue,
              fontWeight: FontWeight.w500,
            ),
          ),
          duration: 3.seconds,
          backgroundColor: isError ? PingboxColors.orange : PingboxColors.white,
        ),
      );
}
