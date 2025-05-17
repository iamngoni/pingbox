//
//  pingbox
//  environment.dart
//
//  Created by Ngonidzashe Mangudya on 21/01/2025.
//  Copyright (c) 2025 Codecraft Solutions. All rights reserved.

enum Environment {
  development(
    name: 'Development',
    shortName: 'dev',
    baseUrl: 'https://admin.crediconnect.co.zw/api',
  ),
  production(
    name: 'Production',
    shortName: 'prod',
    baseUrl: 'https://admin.crediconnect.co.zw/api',
  );

  const Environment({
    required this.name,
    required this.shortName,
    required this.baseUrl,
  });

  final String name;
  final String shortName;
  final String baseUrl;

  @override
  String toString() => name;
}
