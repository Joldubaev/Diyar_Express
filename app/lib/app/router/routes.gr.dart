// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:diyar_express/app/pages/main_home/main_page.dart' as _i4;
import 'package:diyar_express/features/about_us/presentation/pages/about_us_page.dart' as _i1;
import 'package:diyar_express/features/auth/presentation/pages/sign_in/sign_in_page.dart' as _i7;
import 'package:diyar_express/features/auth/presentation/pages/sign_up/sign_up_page.dart' as _i8;
import 'package:diyar_express/features/cart/presentation/pages/cart_page.dart' as _i2;
import 'package:diyar_express/app/pages/main_home/home_page.dart' as _i3;
import 'package:diyar_express/features/menu/presentation/pages/menu_page.dart' as _i5;
import 'package:diyar_express/features/profile/presentation/pages/profile_page.dart' as _i6;

abstract class $AppRouter extends _i9.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    AbooutUsRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AbooutUsPage(),
      );
    },
    CartRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.CartPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomePage(),
      );
    },
    MainRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.MainPage(),
      );
    },
    MenuRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.MenuPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.ProfilePage(),
      );
    },
    SignInRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.SignInPage(),
      );
    },
    SignUpRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.SignUpPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.AbooutUsPage]
class AbooutUsRoute extends _i9.PageRouteInfo<void> {
  const AbooutUsRoute({List<_i9.PageRouteInfo>? children})
      : super(
          AbooutUsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AbooutUsRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i2.CartPage]
class CartRoute extends _i9.PageRouteInfo<void> {
  const CartRoute({List<_i9.PageRouteInfo>? children})
      : super(
          CartRoute.name,
          initialChildren: children,
        );

  static const String name = 'CartRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i9.PageRouteInfo<void> {
  const HomeRoute({List<_i9.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i4.MainPage]
class MainRoute extends _i9.PageRouteInfo<void> {
  const MainRoute({List<_i9.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i5.MenuPage]
class MenuRoute extends _i9.PageRouteInfo<void> {
  const MenuRoute({List<_i9.PageRouteInfo>? children})
      : super(
          MenuRoute.name,
          initialChildren: children,
        );

  static const String name = 'MenuRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i6.ProfilePage]
class ProfileRoute extends _i9.PageRouteInfo<void> {
  const ProfileRoute({List<_i9.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i7.SignInPage]
class SignInRoute extends _i9.PageRouteInfo<void> {
  const SignInRoute({List<_i9.PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i8.SignUpPage]
class SignUpRoute extends _i9.PageRouteInfo<void> {
  const SignUpRoute({List<_i9.PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}
