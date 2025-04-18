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

import '../core/api/api_manager.dart' as _i108;
import '../data/repositories/dataSources/remoteDataSource/auth_remote_dataSource_Impl.dart'
    as _i559;
import '../data/repositories/dataSources/remoteDataSource/home_remote_dataSource_impl.dart'
    as _i434;
import '../data/repositories/repositories/authRepositoryImpl.dart' as _i770;
import '../data/repositories/repositories/home_repository_impl.dart' as _i657;
import '../domain/repositories/dataSourses/remoteDataSource/auth_remote_data_Source.dart'
    as _i201;
import '../domain/repositories/dataSourses/remoteDataSource/home_remote_data_source.dart'
    as _i323;
import '../domain/repositories/home/home_repository.dart' as _i855;
import '../domain/repositories/repositories/auth_repositories.dart' as _i92;
import '../domain/usecases/get_all_brands_usecase.dart' as _i808;
import '../domain/usecases/get_all_category_usecase.dart' as _i74;
import '../domain/usecases/get_all_products_usecase.dart' as _i273;
import '../domain/usecases/login_use_case.dart' as _i646;
import '../domain/usecases/register_useCase.dart' as _i433;
import '../features/ui/auth/login/cubit/login_view_model.dart' as _i1040;
import '../features/ui/auth/register/cubit/register_view_model.dart' as _i586;
import '../features/ui/pages/home_screen/tabs/home_tab/cubit/home_tab_view_model.dart'
    as _i525;
import '../features/ui/pages/home_screen/tabs/products_tab/cubit/product_viewModel.dart'
    as _i376;

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
    gh.singleton<_i108.ApiManager>(() => _i108.ApiManager());
    gh.factory<_i201.AuthRemoteDataSource>(() =>
        _i559.AuthRemoteDataSourceImpl(apiManager: gh<_i108.ApiManager>()));
    gh.factory<_i323.HomeRemoteDataSource>(() =>
        _i434.HomeRemoteDataSourceImpl(apiManager: gh<_i108.ApiManager>()));
    gh.factory<_i855.HomeRepository>(() => _i657.HomeRepositoryImpl(
        homeRemoteDataSource: gh<_i323.HomeRemoteDataSource>()));
    gh.factory<_i92.AuthRepositories>(() => _i770.AuthRepositoryImpl(
        authRemoteDataSource: gh<_i201.AuthRemoteDataSource>()));
    gh.factory<_i433.RegisterUseCase>(() =>
        _i433.RegisterUseCase(authRepository: gh<_i92.AuthRepositories>()));
    gh.factory<_i646.LoginUseCase>(
        () => _i646.LoginUseCase(authRepository: gh<_i92.AuthRepositories>()));
    gh.factory<_i74.GetAllCategoryUseCase>(() =>
        _i74.GetAllCategoryUseCase(homeRepository: gh<_i855.HomeRepository>()));
    gh.factory<_i808.GetAllBrandsUseCase>(() =>
        _i808.GetAllBrandsUseCase(homeRepository: gh<_i855.HomeRepository>()));
    gh.factory<_i273.GetAllProductsUseCase>(() => _i273.GetAllProductsUseCase(
        homeRepository: gh<_i855.HomeRepository>()));
    gh.factory<_i586.RegisterViewModel>(() =>
        _i586.RegisterViewModel(registerUseCase: gh<_i433.RegisterUseCase>()));
    gh.factory<_i376.ProductViewModel>(() => _i376.ProductViewModel(
        getAllProductsUseCase: gh<_i273.GetAllProductsUseCase>()));
    gh.factory<_i1040.LoginViewModel>(
        () => _i1040.LoginViewModel(loginUseCase: gh<_i646.LoginUseCase>()));
    gh.factory<_i525.HomeTabViewModel>(() => _i525.HomeTabViewModel(
          getAllCategoryUseCase: gh<_i74.GetAllCategoryUseCase>(),
          getAllBrandsUseCase: gh<_i808.GetAllBrandsUseCase>(),
        ));
    return this;
  }
}
