//
//  pingbox
//  router_delegate.dart
//
//  Created by Ngonidzashe Mangudya on 2025/04/23.
//  Copyright (c) 2025 Codecraft Solutions. All rights reserved.
//

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'route.dart';

class AppRouterDelegate extends RouterDelegate<PingboxRoute>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<PingboxRoute> {
  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  PingboxRoute? _currentPath;

  @override
  PingboxRoute get currentConfiguration => _currentPath ?? PingboxRoute('/');

  void _setPath(PingboxRoute path) {
    if (kDebugMode) {
      debugPrint('Routing: $_currentPath -> $path');
    }
    _currentPath = path;
    notifyListeners();
  }

  @override
  Future<void> setNewRoutePath(PingboxRoute configuration) async {
    _setPath(configuration);
  }

  @override
  Widget build(BuildContext context) {
    final path = _currentPath?.location ?? '/';
    final params = _currentPath?.queryParameters ?? {};

    final Widget page = switch (path) {
      '/' => const LandingPage(),
    };

    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(child: page),
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) return false;
        return true;
      },
    );
  }
}
