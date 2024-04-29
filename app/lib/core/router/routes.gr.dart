// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i26;
import 'package:diyar_express/features/about_us/presentation/pages/about/about_us_page.dart'
    as _i1;
import 'package:diyar_express/features/about_us/presentation/pages/contact/contact_page.dart'
    as _i3;
import 'package:diyar_express/features/auth/data/models/user_mpdel.dart'
    as _i28;
import 'package:diyar_express/features/auth/presentation/pages/sign_in/sign_in_page.dart'
    as _i22;
import 'package:diyar_express/features/auth/presentation/pages/sign_up/sign_up_page.dart'
    as _i23;
import 'package:diyar_express/features/auth/presentation/pages/sign_up/sign_up_succes.dart'
    as _i24;
import 'package:diyar_express/features/auth/presentation/pages/splash/splash_page.dart'
    as _i25;
import 'package:diyar_express/features/auth/presentation/widgets/reset_password.dart'
    as _i19;
import 'package:diyar_express/features/cart/presentation/pages/cart_page.dart'
    as _i2;
import 'package:diyar_express/features/curier/presentation/pages/curier_page.dart'
    as _i5;
import 'package:diyar_express/features/curier/presentation/pages/curier_profile_page.dart'
    as _i6;
import 'package:diyar_express/features/curier/presentation/pages/history_page.dart'
    as _i8;
import 'package:diyar_express/features/map/presentation/user_map/order_map.dart'
    as _i15;
import 'package:diyar_express/features/menu/presentation/pages/menu_page.dart'
    as _i11;
import 'package:diyar_express/features/menu/presentation/pages/search_menu_page.dart'
    as _i21;
import 'package:diyar_express/features/order/presentation/pages/create_order/create_order_page.dart'
    as _i4;
import 'package:diyar_express/features/order/presentation/pages/create_order/order_address.dart'
    as _i7;
import 'package:diyar_express/features/order/presentation/pages/create_order/order_success.dart'
    as _i16;
import 'package:diyar_express/features/order/presentation/pages/history/order_history_page.dart'
    as _i14;
import 'package:diyar_express/features/order/presentation/pages/order_active/order_detail_page.dart'
    as _i13;
import 'package:diyar_express/features/profile/presentation/pages/profile/profile_page.dart'
    as _i18;
import 'package:diyar_express/features/profile/presentation/pages/profile_info/profile_info_page.dart'
    as _i17;
import 'package:diyar_express/shared/pages/main_home/home_page.dart' as _i9;
import 'package:diyar_express/shared/pages/main_home/main_page.dart' as _i10;
import 'package:diyar_express/shared/pages/widgets/news_page.dart' as _i12;
import 'package:diyar_express/shared/pages/widgets/sale_page.dart' as _i20;
import 'package:flutter/material.dart' as _i27;

abstract class $AppRouter extends _i26.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i26.PageFactory> pagesMap = {
    AboutUsRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AboutUsPage(),
      );
    },
    CartRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.CartPage(),
      );
    },
    ContactRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.ContactPage(),
      );
    },
    CreateOrderRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.CreateOrderPage(),
      );
    },
    CurierRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.CurierPage(),
      );
    },
    CurierPrpfileRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.CurierPrpfilePage(),
      );
    },
    DeliveryFormRoute.name: (routeData) {
      final args = routeData.argsAs<DeliveryFormRouteArgs>(
          orElse: () => const DeliveryFormRouteArgs());
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.DeliveryFormPage(
          address: args.address,
          key: args.key,
        ),
      );
    },
    HistoryRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.HistoryPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.HomePage(),
      );
    },
    MainRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.MainPage(),
      );
    },
    MenuRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.MenuPage(),
      );
    },
    NewsRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.NewsPage(),
      );
    },
    OrderDetailRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.OrderDetailPage(),
      );
    },
    OrderHistoryRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.OrderHistoryPage(),
      );
    },
    OrderMapRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.OrderMapPage(),
      );
    },
    OrderSuccess.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.OrderSuccess(),
      );
    },
    ProfileInfoRoute.name: (routeData) {
      final args = routeData.argsAs<ProfileInfoRouteArgs>();
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i17.ProfileInfoPage(
          key: args.key,
          user: args.user,
        ),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i18.ProfilePage(),
      );
    },
    RessetPasswordRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i19.RessetPasswordPage(),
      );
    },
    SaleRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i20.SalePage(),
      );
    },
    SearchMenuRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i21.SearchMenuPage(),
      );
    },
    SignInRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i22.SignInPage(),
      );
    },
    SignUpRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i23.SignUpPage(),
      );
    },
    SignUpSucces.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i24.SignUpSucces(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i25.SplashScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AboutUsPage]
class AboutUsRoute extends _i26.PageRouteInfo<void> {
  const AboutUsRoute({List<_i26.PageRouteInfo>? children})
      : super(
          AboutUsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AboutUsRoute';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i2.CartPage]
class CartRoute extends _i26.PageRouteInfo<void> {
  const CartRoute({List<_i26.PageRouteInfo>? children})
      : super(
          CartRoute.name,
          initialChildren: children,
        );

  static const String name = 'CartRoute';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i3.ContactPage]
class ContactRoute extends _i26.PageRouteInfo<void> {
  const ContactRoute({List<_i26.PageRouteInfo>? children})
      : super(
          ContactRoute.name,
          initialChildren: children,
        );

  static const String name = 'ContactRoute';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i4.CreateOrderPage]
class CreateOrderRoute extends _i26.PageRouteInfo<void> {
  const CreateOrderRoute({List<_i26.PageRouteInfo>? children})
      : super(
          CreateOrderRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateOrderRoute';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i5.CurierPage]
class CurierRoute extends _i26.PageRouteInfo<void> {
  const CurierRoute({List<_i26.PageRouteInfo>? children})
      : super(
          CurierRoute.name,
          initialChildren: children,
        );

  static const String name = 'CurierRoute';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i6.CurierPrpfilePage]
class CurierPrpfileRoute extends _i26.PageRouteInfo<void> {
  const CurierPrpfileRoute({List<_i26.PageRouteInfo>? children})
      : super(
          CurierPrpfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'CurierPrpfileRoute';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i7.DeliveryFormPage]
class DeliveryFormRoute extends _i26.PageRouteInfo<DeliveryFormRouteArgs> {
  DeliveryFormRoute({
    String? address,
    _i27.Key? key,
    List<_i26.PageRouteInfo>? children,
  }) : super(
          DeliveryFormRoute.name,
          args: DeliveryFormRouteArgs(
            address: address,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'DeliveryFormRoute';

  static const _i26.PageInfo<DeliveryFormRouteArgs> page =
      _i26.PageInfo<DeliveryFormRouteArgs>(name);
}

class DeliveryFormRouteArgs {
  const DeliveryFormRouteArgs({
    this.address,
    this.key,
  });

  final String? address;

  final _i27.Key? key;

  @override
  String toString() {
    return 'DeliveryFormRouteArgs{address: $address, key: $key}';
  }
}

/// generated route for
/// [_i8.HistoryPage]
class HistoryRoute extends _i26.PageRouteInfo<void> {
  const HistoryRoute({List<_i26.PageRouteInfo>? children})
      : super(
          HistoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'HistoryRoute';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i9.HomePage]
class HomeRoute extends _i26.PageRouteInfo<void> {
  const HomeRoute({List<_i26.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i10.MainPage]
class MainRoute extends _i26.PageRouteInfo<void> {
  const MainRoute({List<_i26.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i11.MenuPage]
class MenuRoute extends _i26.PageRouteInfo<void> {
  const MenuRoute({List<_i26.PageRouteInfo>? children})
      : super(
          MenuRoute.name,
          initialChildren: children,
        );

  static const String name = 'MenuRoute';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i12.NewsPage]
class NewsRoute extends _i26.PageRouteInfo<void> {
  const NewsRoute({List<_i26.PageRouteInfo>? children})
      : super(
          NewsRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewsRoute';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i13.OrderDetailPage]
class OrderDetailRoute extends _i26.PageRouteInfo<void> {
  const OrderDetailRoute({List<_i26.PageRouteInfo>? children})
      : super(
          OrderDetailRoute.name,
          initialChildren: children,
        );

  static const String name = 'OrderDetailRoute';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i14.OrderHistoryPage]
class OrderHistoryRoute extends _i26.PageRouteInfo<void> {
  const OrderHistoryRoute({List<_i26.PageRouteInfo>? children})
      : super(
          OrderHistoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'OrderHistoryRoute';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i15.OrderMapPage]
class OrderMapRoute extends _i26.PageRouteInfo<void> {
  const OrderMapRoute({List<_i26.PageRouteInfo>? children})
      : super(
          OrderMapRoute.name,
          initialChildren: children,
        );

  static const String name = 'OrderMapRoute';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i16.OrderSuccess]
class OrderSuccess extends _i26.PageRouteInfo<void> {
  const OrderSuccess({List<_i26.PageRouteInfo>? children})
      : super(
          OrderSuccess.name,
          initialChildren: children,
        );

  static const String name = 'OrderSuccess';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i17.ProfileInfoPage]
class ProfileInfoRoute extends _i26.PageRouteInfo<ProfileInfoRouteArgs> {
  ProfileInfoRoute({
    _i27.Key? key,
    required _i28.UserModel user,
    List<_i26.PageRouteInfo>? children,
  }) : super(
          ProfileInfoRoute.name,
          args: ProfileInfoRouteArgs(
            key: key,
            user: user,
          ),
          initialChildren: children,
        );

  static const String name = 'ProfileInfoRoute';

  static const _i26.PageInfo<ProfileInfoRouteArgs> page =
      _i26.PageInfo<ProfileInfoRouteArgs>(name);
}

class ProfileInfoRouteArgs {
  const ProfileInfoRouteArgs({
    this.key,
    required this.user,
  });

  final _i27.Key? key;

  final _i28.UserModel user;

  @override
  String toString() {
    return 'ProfileInfoRouteArgs{key: $key, user: $user}';
  }
}

/// generated route for
/// [_i18.ProfilePage]
class ProfileRoute extends _i26.PageRouteInfo<void> {
  const ProfileRoute({List<_i26.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i19.RessetPasswordPage]
class RessetPasswordRoute extends _i26.PageRouteInfo<void> {
  const RessetPasswordRoute({List<_i26.PageRouteInfo>? children})
      : super(
          RessetPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'RessetPasswordRoute';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i20.SalePage]
class SaleRoute extends _i26.PageRouteInfo<void> {
  const SaleRoute({List<_i26.PageRouteInfo>? children})
      : super(
          SaleRoute.name,
          initialChildren: children,
        );

  static const String name = 'SaleRoute';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i21.SearchMenuPage]
class SearchMenuRoute extends _i26.PageRouteInfo<void> {
  const SearchMenuRoute({List<_i26.PageRouteInfo>? children})
      : super(
          SearchMenuRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchMenuRoute';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i22.SignInPage]
class SignInRoute extends _i26.PageRouteInfo<void> {
  const SignInRoute({List<_i26.PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i23.SignUpPage]
class SignUpRoute extends _i26.PageRouteInfo<void> {
  const SignUpRoute({List<_i26.PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i24.SignUpSucces]
class SignUpSucces extends _i26.PageRouteInfo<void> {
  const SignUpSucces({List<_i26.PageRouteInfo>? children})
      : super(
          SignUpSucces.name,
          initialChildren: children,
        );

  static const String name = 'SignUpSucces';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i25.SplashScreen]
class SplashRoute extends _i26.PageRouteInfo<void> {
  const SplashRoute({List<_i26.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}
