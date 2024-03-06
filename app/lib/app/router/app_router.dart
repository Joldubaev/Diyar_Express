import 'package:diyar_express/modules/modules.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _sectionNavigatorKey1 = GlobalKey<NavigatorState>(debugLabel: 'home');
final _sectionNavigatorKey2 = GlobalKey<NavigatorState>(debugLabel: 'restaurant');
final _sectionNavigatorKey3 = GlobalKey<NavigatorState>(debugLabel: 'cart');
final _sectionNavigatorKey4 = GlobalKey<NavigatorState>(debugLabel: 'profile');

@immutable
final class AppRouter {
  const AppRouter._();

  static const home = 'home';
  static const restauran = 'restauran';
  static const cart = 'cart';
  static const profile = 'profile';
  static const auth = 'auth';

  static final router = GoRouter(
    initialLocation: '/home',
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const Scaffold(
          body: Center(child: Text('Init')),
        ),
      ),
      GoRoute(
        path: '/$auth',
        name: auth,
        builder: (context, state) => const AuthView(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) => MainView(navigationShell),
        branches: [
          StatefulShellBranch(
            navigatorKey: _sectionNavigatorKey1,
            routes: [
              GoRoute(
                path: '/$home',
                name: home,
                builder: (context, state) => const HomeView(),
                // routes: homeSubRoutes,
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _sectionNavigatorKey2,
            routes: [
              GoRoute(
                path: '/$restauran',
                name: restauran,
                builder: (context, state) => const RestaurantView(),
                // routes: restauranSubRoutes,
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _sectionNavigatorKey3,
            routes: [
              GoRoute(
                path: '/$cart',
                name: cart,
                builder: (context, state) => const CartView(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _sectionNavigatorKey4,
            routes: [
              GoRoute(
                path: '/$profile',
                name: profile,
                builder: (context, state) => const ProfileView(),
                // routes: profileSubRoutes,
              ),
            ],
          ),
        ],
      ),
    ],
    // redirect: (context, state) {
    //   return !context.read<AuthCubit>().isAuthedticated ? '/$auth' : null;
    // },
  );
}
