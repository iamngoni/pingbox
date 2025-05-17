//
//  pingbox
//  providers.dart
//
//  Created by Ngonidzashe Mangudya on 1/21/25.
//  Copyright (c) 2025 Codecraft Solutions. All rights reserved.
//

import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/state/connectivity_status/connectivity_status_bloc.dart';
import 'core/state/locale/locale_bloc.dart';
import 'injection.dart';

final List<BlocProvider> providers = [
  BlocProvider<LocaleBloc>(
    lazy: false,
    create: (_) => getIt<LocaleBloc>()..add(LoadLocale()),
  ),
  BlocProvider<ConnectivityStatusBloc>(
    create: (_) => getIt<ConnectivityStatusBloc>(),
  ),
];
