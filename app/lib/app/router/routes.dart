import 'package:auto_route/auto_route.dart';
import 'package:diyar_express/app/router/routes.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SignInRoute.page,
        ),
        AutoRoute(page: SignUpRoute.page, initial: true),
        AutoRoute(page: MainRoute.page, children: [
          AutoRoute(page: HomeRoute.page),
          AutoRoute(page: MenuRoute.page),
          AutoRoute(page: CartRoute.page),
          AutoRoute(page: ProfileRoute.page)
        ]),
      ];
}
