//
//  pingbox
//  network.dart
//
//  Created by Ngonidzashe Mangudya on 1/21/25.
//  Copyright (c) 2025 Codecraft Solutions. All rights reserved.
//

import 'package:injectable/injectable.dart';
import 'package:network_info_plus/network_info_plus.dart';

@singleton
class NetworkService {
  static NetworkService? _instance;
  static NetworkInfo? _networkInfo;

  @factoryMethod
  static Future<NetworkService> getInstance() async {
    _instance ??= NetworkService();

    _networkInfo ??= NetworkInfo();

    return _instance!;
  }

  Future<String> getIpAddress() async {
    final String? ipAddress = await _networkInfo?.getWifiIP();
    return ipAddress ?? '';
  }
}
