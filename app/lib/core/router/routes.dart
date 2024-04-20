import 'package:auto_route/auto_route.dart';
import 'package:diyar_express/core/router/routes.gr.dart';
import 'package:diyar_express/shared/constants/app_const/app_const.dart';
import 'package:diyar_express/injection_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: MainRoute.page,
          guards: [AuthGuard()],
          children: [
            AutoRoute(page: HomeRoute.page),
            AutoRoute(page: MenuRoute.page),
            AutoRoute(page: CartRoute.page),
            AutoRoute(page: ProfileRoute.page)
          ],
        ),
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: ProfileInfoRoute.page),
        AutoRoute(page: ContactRoute.page),
        AutoRoute(page: OrderHistoryRoute.page),
        AutoRoute(page: SignInRoute.page),
        AutoRoute(page: SignUpRoute.page),
        AutoRoute(page: CreateOrderRoute.page),
        AutoRoute(page: OrderSuccess.page),
        AutoRoute(page: SignUpSucces.page),
        AutoRoute(page: ContactRoute.page),
        AutoRoute(page: AboutUsRoute.page),
        AutoRoute(page: OrderMapRoute.page),
        AutoRoute(page: DeliveryFormRoute.page),
        AutoRoute(page: OrderDetailRoute.page),
        AutoRoute(page: RessetPasswordRoute.page),
        AutoRoute(page: CurierRoute.page),
        AutoRoute(page: HistoryRoute.page),
        AutoRoute(page: SaleRoute.page),
        AutoRoute(page: NewsRoute.page),
      ];
}

class AuthGuard extends AutoRouteGuard {
  final prefs = sl<SharedPreferences>();

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (prefs.getString(AppConst.accessToken) != null) {
      resolver.next(true);
    } else {
      router.push(const SignInRoute());
    }
  }
}
