//
//  pingbox
//  route_parser.dart
//
//  Created by Ngonidzashe Mangudya on 2025/04/23.
//  Copyright (c) 2025 Codecraft Solutions. All rights reserved.
//

import 'package:flutter/material.dart';

import 'route.dart';

class RouteParser extends RouteInformationParser<PingboxRoute> {
  @override
  Future<PingboxRoute> parseRouteInformation(
    RouteInformation routeInformation,
  ) async {
    final uri = routeInformation.uri;
    return PingboxRoute(uri.path, queryParameters: uri.queryParameters);
  }

  @override
  RouteInformation? restoreRouteInformation(PingboxRoute configuration) {
    final uri = Uri(
      path: configuration.location,
      queryParameters: configuration.queryParameters,
    );
    return RouteInformation(uri: uri);
  }
}
