//
//  pingbox
//  injection.dart
//
//  Created by Ngonidzashe Mangudya on 1/21/25.
//  Copyright (c) 2025 Codecraft Solutions. All rights reserved.
//

import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:sentry_dio/sentry_dio.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'core/configs/constants.dart';
import 'core/utils/dio_request_interceptor.dart';
import 'injection.config.dart';

final GetIt getIt = GetIt.instance
  ..registerSingleton<Dio>(
    Dio()
      ..options.baseUrl = TycheConstants.currentEnvironment.baseUrl
      ..interceptors.add(CurlLoggerDioInterceptor(printOnSuccess: true))
      ..interceptors.add(DioRequestInterceptor())
      ..interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
        ),
      )
      ..options.connectTimeout = 60000.milliseconds
      ..addSentry(
        failedRequestStatusCodes: [
          SentryStatusCode.range(400, 404),
          SentryStatusCode(500),
          SentryStatusCode(502),
          SentryStatusCode(524),
        ],
      ),
  );

@InjectableInit()
void configureInjection() => getIt.init();
