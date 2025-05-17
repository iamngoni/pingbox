//
//  pingbox
//  route.dart
//
//  Created by Ngonidzashe Mangudya on 2025/04/23.
//  Copyright (c) 2025 Codecraft Solutions. All rights reserved.
//

class PingboxRoute {
  PingboxRoute(
    this.location, {
    this.queryParameters = const {},
  });
  final String location;
  final Map<String, String> queryParameters;

  @override
  String toString() {
    return location;
  }
}
