// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pingbox/core/services/network.dart' as _i713;
import 'package:pingbox/core/services/package.dart' as _i997;
import 'package:pingbox/core/services/scheduler.dart' as _i271;
import 'package:pingbox/core/services/secure_storage.dart' as _i593;
import 'package:pingbox/core/services/storage.dart' as _i565;
import 'package:pingbox/core/state/connectivity_status/connectivity_status_bloc.dart'
    as _i998;
import 'package:pingbox/core/state/locale/locale_bloc.dart' as _i300;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i300.LocaleBloc>(() => _i300.LocaleBloc());
    gh.factory<_i998.ConnectivityStatusBloc>(
        () => _i998.ConnectivityStatusBloc());
    gh.singletonAsync<_i565.StorageService>(
        () => _i565.StorageService.getInstance());
    gh.singletonAsync<_i593.SecureStorageService>(
        () => _i593.SecureStorageService.getInstance());
    gh.singletonAsync<_i997.PackageService>(
        () => _i997.PackageService.getInstance());
    gh.singletonAsync<_i713.NetworkService>(
        () => _i713.NetworkService.getInstance());
    gh.singletonAsync<_i271.SchedulingService>(
        () => _i271.SchedulingService.getInstance());
    return this;
  }
}
