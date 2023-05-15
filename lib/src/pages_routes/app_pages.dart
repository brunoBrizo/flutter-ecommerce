import 'package:get/get.dart';
import 'package:quitanda_app/src/pages/auth/view/sign_in_page.dart';
import 'package:quitanda_app/src/pages/auth/view/sign_up_page.dart';
import 'package:quitanda_app/src/pages/base/base_page.dart';
import 'package:quitanda_app/src/pages/splash/splash_page.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(
      name: PagesRoutes.splashRoute,
      page: () => const SplashPage(),
    ),
    GetPage(
      name: PagesRoutes.signInRoute,
      page: () => SignInPage(),
    ),
    GetPage(
      name: PagesRoutes.signUpRoute,
      page: () => SignUpPage(),
    ),
    GetPage(
      name: PagesRoutes.baseRoute,
      page: () => const BasePage(),
    ),
  ];
}

abstract class PagesRoutes {
  static const String signInRoute = '/signin';
  static const String signUpRoute = '/signup';
  static const String splashRoute = '/splash';
  static const String baseRoute = '/';
}
