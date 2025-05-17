//
//  pingbox
//  bootstrap.dart
//
//  Created by Ngonidzashe Mangudya on 1/21/25.
//  Copyright (c) 2025 Codecraft Solutions. All rights reserved.
//

import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:sentry_logging/sentry_logging.dart';

import 'core/configs/constants.dart';
import 'injection.dart';
import 'providers.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isAndroid) {
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    log('Setting immersive sticky mode for Android ✅');
  }

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  log('Setting preferred orientations ✅');

  configureInjection();

  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
    Sentry.captureException(details.exception, stackTrace: details.stack);
  };

  final notificationsPermission = await Permission.notification.status;
  if (!notificationsPermission.isGranted) {
    await Permission.notification.request();
  }
  log('Requesting notification permission ✅');

  Bloc.observer = const AppBlocObserver();

  await SentryFlutter.init(
    (options) {
      options
        ..dsn = TycheConstants.sentryDsn
        ..tracesSampleRate = 1.0
        ..environment = TycheConstants.currentEnvironment.name
        ..compressPayload = true
        ..addIntegration(LoggingIntegration());
    },
    appRunner: () async => runApp(
      MultiBlocProvider(
        providers: providers,
        child: SentryScreenshotWidget(
          child: await builder(),
        ),
      ),
    ),
  );
}
