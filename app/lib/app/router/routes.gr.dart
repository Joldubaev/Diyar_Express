// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i19;
import 'package:diyar_express/app/pages/main_home/home_page.dart' as _i6;
import 'package:diyar_express/app/pages/main_home/main_page.dart' as _i7;
import 'package:diyar_express/features/about_us/presentation/pages/about/about_us_page.dart' as _i1;
import 'package:diyar_express/features/about_us/presentation/pages/contact/contact_page.dart' as _i3;
import 'package:diyar_express/features/auth/data/models/user_mpdel.dart' as _i21;
import 'package:diyar_express/features/auth/presentation/pages/sign_in/sign_in_page.dart' as _i16;
import 'package:diyar_express/features/auth/presentation/pages/sign_up/sign_up_page.dart' as _i17;
import 'package:diyar_express/features/auth/presentation/pages/sign_up/sign_up_succes.dart' as _i18;
import 'package:diyar_express/features/auth/presentation/widgets/reset_password.dart' as _i15;
import 'package:diyar_express/features/cart/presentation/pages/cart_page.dart' as _i2;
import 'package:diyar_express/features/map/presentation/user_map/order_map.dart' as _i11;
import 'package:diyar_express/features/menu/presentation/pages/menu_page.dart' as _i8;
import 'package:diyar_express/features/order/presentation/pages/create_order/create_order_page.dart' as _i4;
import 'package:diyar_express/features/order/presentation/pages/create_order/delivery_form.dart' as _i5;
import 'package:diyar_express/features/order/presentation/pages/create_order/order_success.dart' as _i12;
import 'package:diyar_express/features/order/presentation/pages/history/order_history_page.dart' as _i10;
import 'package:diyar_express/features/order/presentation/pages/order_active/order_detail_page.dart' as _i9;
import 'package:diyar_express/features/profile/presentation/pages/profile/profile_page.dart' as _i14;
import 'package:diyar_express/features/profile/presentation/pages/profile_info/profile_info_page.dart' as _i13;
import 'package:flutter/material.dart' as _i20;

abstract class $AppRouter extends _i19.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i19.PageFactory> pagesMap = {
    AboutUsRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AboutUsPage(),
      );
    },
    CartRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.CartPage(),
      );
    },
    ContactRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.ContactPage(),
      );
    },
    CreateOrderRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.CreateOrderPage(),
      );
    },
    DeliveryFormRoute.name: (routeData) {
      final args = routeData.argsAs<DeliveryFormRouteArgs>(orElse: () => const DeliveryFormRouteArgs());
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.DeliveryFormPage(
          address: args.address,
          key: args.key,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.HomePage(),
      );
    },
    MainRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.MainPage(),
      );
    },
    MenuRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.MenuPage(),
      );
    },
    OrderDetailRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.OrderDetailPage(),
      );
    },
    OrderHistoryRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.OrderHistoryPage(),
      );
    },
    OrderMapRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.OrderMapPage(),
      );
    },
    OrderSuccess.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.OrderSuccess(),
      );
    },
    ProfileInfoRoute.name: (routeData) {
      final args = routeData.argsAs<ProfileInfoRouteArgs>();
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i13.ProfileInfoPage(
          key: args.key,
          user: args.user,
        ),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.ProfilePage(),
      );
    },
    RessetPasswordRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.RessetPasswordPage(),
      );
    },
    SignInRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.SignInPage(),
      );
    },
    SignUpRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.SignUpPage(),
      );
    },
    SignUpSucces.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i18.SignUpSucces(),
      );
    },
  };
}

/// generated route for
/// [_i1.AboutUsPage]
class AboutUsRoute extends _i19.PageRouteInfo<void> {
  const AboutUsRoute({List<_i19.PageRouteInfo>? children})
      : super(
          AboutUsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AboutUsRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i2.CartPage]
class CartRoute extends _i19.PageRouteInfo<void> {
  const CartRoute({List<_i19.PageRouteInfo>? children})
      : super(
          CartRoute.name,
          initialChildren: children,
        );

  static const String name = 'CartRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i3.ContactPage]
class ContactRoute extends _i19.PageRouteInfo<void> {
  const ContactRoute({List<_i19.PageRouteInfo>? children})
      : super(
          ContactRoute.name,
          initialChildren: children,
        );

  static const String name = 'ContactRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i4.CreateOrderPage]
class CreateOrderRoute extends _i19.PageRouteInfo<void> {
  const CreateOrderRoute({List<_i19.PageRouteInfo>? children})
      : super(
          CreateOrderRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateOrderRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i5.DeliveryFormPage]
class DeliveryFormRoute extends _i19.PageRouteInfo<DeliveryFormRouteArgs> {
  DeliveryFormRoute({
    String? address,
    _i20.Key? key,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          DeliveryFormRoute.name,
          args: DeliveryFormRouteArgs(
            address: address,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'DeliveryFormRoute';

  static const _i19.PageInfo<DeliveryFormRouteArgs> page = _i19.PageInfo<DeliveryFormRouteArgs>(name);
}

class DeliveryFormRouteArgs {
  const DeliveryFormRouteArgs({
    this.address,
    this.key,
  });

  final String? address;

  final _i20.Key? key;

  @override
  String toString() {
    return 'DeliveryFormRouteArgs{address: $address, key: $key}';
  }
}

/// generated route for
/// [_i6.HomePage]
class HomeRoute extends _i19.PageRouteInfo<void> {
  const HomeRoute({List<_i19.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i7.MainPage]
class MainRoute extends _i19.PageRouteInfo<void> {
  const MainRoute({List<_i19.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i8.MenuPage]
class MenuRoute extends _i19.PageRouteInfo<void> {
  const MenuRoute({List<_i19.PageRouteInfo>? children})
      : super(
          MenuRoute.name,
          initialChildren: children,
        );

  static const String name = 'MenuRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i9.OrderDetailPage]
class OrderDetailRoute extends _i19.PageRouteInfo<void> {
  const OrderDetailRoute({List<_i19.PageRouteInfo>? children})
      : super(
          OrderDetailRoute.name,
          initialChildren: children,
        );

  static const String name = 'OrderDetailRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i10.OrderHistoryPage]
class OrderHistoryRoute extends _i19.PageRouteInfo<void> {
  const OrderHistoryRoute({List<_i19.PageRouteInfo>? children})
      : super(
          OrderHistoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'OrderHistoryRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i11.OrderMapPage]
class OrderMapRoute extends _i19.PageRouteInfo<void> {
  const OrderMapRoute({List<_i19.PageRouteInfo>? children})
      : super(
          OrderMapRoute.name,
          initialChildren: children,
        );

  static const String name = 'OrderMapRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i12.OrderSuccess]
class OrderSuccess extends _i19.PageRouteInfo<void> {
  const OrderSuccess({List<_i19.PageRouteInfo>? children})
      : super(
          OrderSuccess.name,
          initialChildren: children,
        );

  static const String name = 'OrderSuccess';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i13.ProfileInfoPage]
class ProfileInfoRoute extends _i19.PageRouteInfo<ProfileInfoRouteArgs> {
  ProfileInfoRoute({
    _i20.Key? key,
    required _i21.UserModel user,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          ProfileInfoRoute.name,
          args: ProfileInfoRouteArgs(
            key: key,
            user: user,
          ),
          initialChildren: children,
        );

  static const String name = 'ProfileInfoRoute';

  static const _i19.PageInfo<ProfileInfoRouteArgs> page = _i19.PageInfo<ProfileInfoRouteArgs>(name);
}

class ProfileInfoRouteArgs {
  const ProfileInfoRouteArgs({
    this.key,
    required this.user,
  });

  final _i20.Key? key;

  final _i21.UserModel user;

  @override
  String toString() {
    return 'ProfileInfoRouteArgs{key: $key, user: $user}';
  }
}

/// generated route for
/// [_i14.ProfilePage]
class ProfileRoute extends _i19.PageRouteInfo<void> {
  const ProfileRoute({List<_i19.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i15.RessetPasswordPage]
class RessetPasswordRoute extends _i19.PageRouteInfo<void> {
  const RessetPasswordRoute({List<_i19.PageRouteInfo>? children})
      : super(
          RessetPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'RessetPasswordRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i16.SignInPage]
class SignInRoute extends _i19.PageRouteInfo<void> {
  const SignInRoute({List<_i19.PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i17.SignUpPage]
class SignUpRoute extends _i19.PageRouteInfo<void> {
  const SignUpRoute({List<_i19.PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i18.SignUpSucces]
class SignUpSucces extends _i19.PageRouteInfo<void> {
  const SignUpSucces({List<_i19.PageRouteInfo>? children})
      : super(
          SignUpSucces.name,
          initialChildren: children,
        );

  static const String name = 'SignUpSucces';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}
