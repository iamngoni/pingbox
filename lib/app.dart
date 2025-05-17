//
//  pingbox
//  app.dart
//
//  Created by Ngonidzashe Mangudya on 1/21/25.
//  Copyright (c) 2025 Codecraft Solutions. All rights reserved.
//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'core/configs/colors.dart';
import 'core/models/data/language.dart';
import 'core/state/connectivity_status/connectivity_status_bloc.dart';
import 'core/state/locale/locale_bloc.dart';
import 'core/utils/dismiss_keyboard.dart';
import 'core/utils/services.dart';
import 'core/widgets/device_offline_page.dart';
import 'core/widgets/loader_widget.dart';

class PingboxApp extends StatelessWidget {
  const PingboxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleBloc, Language>(
      builder: (context, state) {
        return MaterialApp.router(
          title: 'PingBox',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: PingboxColors.navyBlue,
            ),
            useMaterial3: true,
          ),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: Locale(state.code),
          builder: (context, child) {
            return GestureDetector(
              onTap: () {
                dismissKeyboard(context);
              },
              child:
                  BlocBuilder<ConnectivityStatusBloc, ConnectivityStatusState>(
                builder: (context, state) {
                  if (state is Idle) {
                    return const ColoredBox(
                      color: PingboxColors.white,
                      child: Center(
                        child: LoaderWidget(),
                      ),
                    );
                  }

                  if (state is Offline) {
                    return const DeviceOfflinePage();
                  }

                  return child ?? const SizedBox.shrink();
                },
              ),
            );
          },
          routeInformationParser: $routeParser,
          routerDelegate: $routerDelegate,
        );
      },
    );
  }
}
