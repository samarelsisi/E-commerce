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
import '../data/repositories/dataSources/remoteDataSource/cart_remote_data_source_impl.dart'
    as _i887;
import '../data/repositories/dataSources/remoteDataSource/home_remote_dataSource_impl.dart'
    as _i434;
import '../data/repositories/dataSources/remoteDataSource/wishlist_remote_data_source_impl.dart'
    as _i162;
import '../data/repositories/repositories/authRepositoryImpl.dart' as _i770;
import '../data/repositories/repositories/cart_repository_impl.dart' as _i1055;
import '../data/repositories/repositories/home_repository_impl.dart' as _i657;
import '../data/repositories/repositories/wishlistRepositoryImpl.dart' as _i235;
import '../domain/repositories/dataSourses/remoteDataSource/auth_remote_data_Source.dart'
    as _i201;
import '../domain/repositories/dataSourses/remoteDataSource/cart_remote_data_Source.dart'
    as _i622;
import '../domain/repositories/dataSourses/remoteDataSource/home_remote_data_source.dart'
    as _i323;
import '../domain/repositories/dataSourses/remoteDataSource/wishlist-remote-data-Source.dart'
    as _i698;
import '../domain/repositories/home/home_repository.dart' as _i855;
import '../domain/repositories/repositories/auth_repositories.dart' as _i92;
import '../domain/repositories/repositories/cart/cart-repository.dart' as _i687;
import '../domain/repositories/repositories/wisllist-repository.dart' as _i319;
import '../domain/usecases/add_cart_usecase.dart' as _i443;
import '../domain/usecases/add_item_inWishList_usecase.dart' as _i1072;
import '../domain/usecases/delete_items_In_cart_usecase.dart' as _i453;
import '../domain/usecases/get_all_brands_usecase.dart' as _i808;
import '../domain/usecases/get_all_category_usecase.dart' as _i74;
import '../domain/usecases/get_all_products_usecase.dart' as _i273;
import '../domain/usecases/get_cart_usecase.dart' as _i428;
import '../domain/usecases/get_Items_wishList_usecase.dart' as _i300;
import '../domain/usecases/login_use_case.dart' as _i646;
import '../domain/usecases/register_useCase.dart' as _i433;
import '../domain/usecases/update_count_In_cart_usecase.dart' as _i746;
import '../features/ui/auth/login/cubit/login_view_model.dart' as _i1040;
import '../features/ui/auth/register/cubit/register_view_model.dart' as _i586;
import '../features/ui/pages/cart_screen/cubit/get_Cart_view_model.dart'
    as _i157;
import '../features/ui/pages/home_screen/tabs/favorite_tab/cubit/wishListViewModel.dart'
    as _i380;
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
    gh.factory<_i622.CartRemoteDataSource>(() =>
        _i887.CartRemoteDataSourceImpl(apiManager: gh<_i108.ApiManager>()));
    gh.factory<_i323.HomeRemoteDataSource>(() =>
        _i434.HomeRemoteDataSourceImpl(apiManager: gh<_i108.ApiManager>()));
    gh.factory<_i698.WishListRemoteDataSource>(() =>
        _i162.WishlistRemoteDataSourceImpl(apiManager: gh<_i108.ApiManager>()));
    gh.factory<_i855.HomeRepository>(() => _i657.HomeRepositoryImpl(
        homeRemoteDataSource: gh<_i323.HomeRemoteDataSource>()));
    gh.factory<_i92.AuthRepositories>(() => _i770.AuthRepositoryImpl(
        authRemoteDataSource: gh<_i201.AuthRemoteDataSource>()));
    gh.factory<_i319.WishListRepository>(() => _i235.WishlistRepositoryimpl(
        wishListRemoteDataSource: gh<_i698.WishListRemoteDataSource>()));
    gh.factory<_i646.LoginUseCase>(
        () => _i646.LoginUseCase(authRepository: gh<_i92.AuthRepositories>()));
    gh.factory<_i433.RegisterUseCase>(() =>
        _i433.RegisterUseCase(authRepository: gh<_i92.AuthRepositories>()));
    gh.factory<_i687.CartRepository>(() => _i1055.CartRepositoryImpl(
        cartRemoteDataSource: gh<_i622.CartRemoteDataSource>()));
    gh.factory<_i443.AddCartUseCase>(
        () => _i443.AddCartUseCase(homeRepository: gh<_i855.HomeRepository>()));
    gh.factory<_i808.GetAllBrandsUseCase>(() =>
        _i808.GetAllBrandsUseCase(homeRepository: gh<_i855.HomeRepository>()));
    gh.factory<_i74.GetAllCategoryUseCase>(() =>
        _i74.GetAllCategoryUseCase(homeRepository: gh<_i855.HomeRepository>()));
    gh.factory<_i273.GetAllProductsUseCase>(() => _i273.GetAllProductsUseCase(
        homeRepository: gh<_i855.HomeRepository>()));
    gh.factory<_i1072.AddItemsInWishListUseCase>(() =>
        _i1072.AddItemsInWishListUseCase(
            wishListRepository: gh<_i319.WishListRepository>()));
    gh.factory<_i300.GetWishListUseCase>(() => _i300.GetWishListUseCase(
        wishListRepository: gh<_i319.WishListRepository>()));
    gh.factory<_i586.RegisterViewModel>(() =>
        _i586.RegisterViewModel(registerUseCase: gh<_i433.RegisterUseCase>()));
    gh.factory<_i1040.LoginViewModel>(
        () => _i1040.LoginViewModel(loginUseCase: gh<_i646.LoginUseCase>()));
    gh.factory<_i525.HomeTabViewModel>(() => _i525.HomeTabViewModel(
          getAllCategoryUseCase: gh<_i74.GetAllCategoryUseCase>(),
          getAllBrandsUseCase: gh<_i808.GetAllBrandsUseCase>(),
        ));
    gh.factory<_i376.ProductViewModel>(() => _i376.ProductViewModel(
          getAllProductsUseCase: gh<_i273.GetAllProductsUseCase>(),
          addCartUseCase: gh<_i443.AddCartUseCase>(),
        ));
    gh.factory<_i453.DeleteItemsInCartUseCase>(() =>
        _i453.DeleteItemsInCartUseCase(
            cartRepository: gh<_i687.CartRepository>()));
    gh.factory<_i428.GetCartUseCase>(
        () => _i428.GetCartUseCase(cartRepository: gh<_i687.CartRepository>()));
    gh.factory<_i746.UpdateCountInCartUseCase>(() =>
        _i746.UpdateCountInCartUseCase(
            cartRepository: gh<_i687.CartRepository>()));
    gh.factory<_i157.CartViewModel>(() => _i157.CartViewModel(
          getCartUseCase: gh<_i428.GetCartUseCase>(),
          deleteItemsInCartUseCase: gh<_i453.DeleteItemsInCartUseCase>(),
          updateCountInCartUseCase: gh<_i746.UpdateCountInCartUseCase>(),
        ));
    gh.factory<_i380.Wishlistviewmodel>(() => _i380.Wishlistviewmodel(
          addItemsInWishListUseCase: gh<_i1072.AddItemsInWishListUseCase>(),
          getWishListUseCase: gh<_i300.GetWishListUseCase>(),
        ));
    return this;
  }
}
