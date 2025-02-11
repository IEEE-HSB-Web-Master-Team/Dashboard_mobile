// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/Auth/data/data_sources/contracts/auth_online_data_source.dart'
    as _i95;
import '../../features/Auth/data/data_sources/impl/auth_online_data_source_impl.dart'
    as _i915;
import '../../features/Auth/data/repositories/auth_repo_impl.dart' as _i86;
import '../../features/Auth/domain/contracts/auth_repo.dart' as _i708;
import '../../features/Auth/domain/use_cases/auth_use_case.dart' as _i72;
import '../../features/Auth/presentation/viewModel/auth_view_model_cubit.dart'
    as _i250;
import '../cache/storage_token.dart' as _i170;
import '../network/api/api_manger.dart' as _i310;
import '../network/api/dio_factory.dart' as _i979;

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
    final dioFactory = _$DioFactory();
    gh.singleton<_i170.StorageToken>(() => _i170.StorageToken());
    gh.singleton<_i361.Dio>(() => dioFactory.getDio(gh<_i170.StorageToken>()));
    gh.factory<_i310.NewApiManger>(() => _i310.NewApiManger(gh<_i361.Dio>()));
    gh.factory<_i95.AuthOnlineDataSource>(
        () => _i915.AuthOnlineDataSourceImpl(gh<_i310.NewApiManger>()));
    gh.factory<_i708.AuthRepo>(
        () => _i86.AuthRepoImpl(gh<_i95.AuthOnlineDataSource>()));
    gh.factory<_i72.AuthUseCase>(() => _i72.AuthUseCase(gh<_i708.AuthRepo>()));
    gh.factory<_i250.AuthViewModelCubit>(
        () => _i250.AuthViewModelCubit(gh<_i72.AuthUseCase>()));
    return this;
  }
}

class _$DioFactory extends _i979.DioFactory {}
