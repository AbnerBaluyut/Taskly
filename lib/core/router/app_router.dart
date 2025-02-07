import 'package:go_router/go_router.dart';

import '../../features/authentication/screens/login/login_page.dart';
import '../../features/authentication/screens/register/register_page.dart';
import '../../features/home/screens/home_page.dart';
import '../../features/on_boarding/screens/on_boarding_page.dart';
import '../../features/splash/splash_page.dart';
import '../../features/welcome/screens/welcome_page.dart';
import 'app_routes.dart';

class AppRouter { 

  static GoRouter router = GoRouter(
    initialLocation: AppRoutes.splash,
    routes: [
      GoRoute(
        path: AppRoutes.splash, 
        builder: (context, state) {
          return const SplashPage();
        },
      ),
      GoRoute(
        path: AppRoutes.onBoarding, 
        builder: (context, state) {
          return const OnBoardingPage();
        },
      ),
      GoRoute(
        path: AppRoutes.welcome, 
        builder: (context, state) {
          return const WelcomePage();
        },
      ),
      GoRoute(
        path: AppRoutes.login, 
        builder: (context, state) {
          return const LoginPage();
        },
      ),
      GoRoute(
        path: AppRoutes.register, 
        builder: (context, state) {
          return const RegisterPage();
        },
      ),
      GoRoute(
        path: AppRoutes.home, 
        builder: (context, state) {
          return const HomePage();
        },
      ),
    ],
  );
}