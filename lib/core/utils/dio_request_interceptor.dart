//
//  pingbox
//  dio_request_interceptor.dart
//
//  Created by Ngonidzashe Mangudya on 1/29/25.
//  Copyright (c) 2025 Codecraft Solutions. All rights reserved.
//

import 'dart:developer';

import 'package:dio/dio.dart';

import 'services.dart';

class DioRequestInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    try {
      final String? accessToken = await $secureStorage.getFromDisk('token');
      if (accessToken != null) {
        options.headers.addAll({'Authorization': 'Bearer $accessToken'});
      }
    } catch (e, s) {
      log(e.toString(), error: e, stackTrace: s);
    }

    return handler.next(options);
  }
}
