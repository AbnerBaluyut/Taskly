import '../../_di/injections.dart';
import '../utils/shared_preferences_manager.dart';
import 'screens.dart';

class AppRouter {

  static SharedPreferenceManager get _sharedPres => getIt();

  static GoRouter router = GoRouter(
    initialLocation: AppRoutes.splash,
    redirect: (context, state) {
      
      final isLoggedIn = _sharedPres.isLoggedIn;
      final isCompleteOnBoarding = _sharedPres.isSkipOnBoarding;
      final isGoingToOnBoarding = state.uri.path == AppRoutes.onBoarding;

      if (isLoggedIn && isGoingToOnBoarding) {
        return AppRoutes.dashboard;
      } else if (!isLoggedIn && isCompleteOnBoarding && isGoingToOnBoarding) {
        return AppRoutes.login;
      }

      return null;
    },
    routes: [
      GoRoute(
        path: AppRoutes.splash, 
        builder: (context, state) {
          return const SplashPageWrapper();
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
          return const WelcomePageWrapper();
        },
      ),
      GoRoute(
        path: AppRoutes.login, 
        builder: (context, state) {
          return const LoginPageWrapper();
        },
      ),
      GoRoute(
        path: AppRoutes.register, 
        builder: (context, state) {
          return const RegisterPageWrapper();
        },
      ),
      GoRoute(
        path: AppRoutes.dashboard, 
        builder: (context, state) {
          return const DashboardPageWrapper();
        },
      ),
      GoRoute(
        path: AppRoutes.moreProjects, 
        builder: (context, state) {
          return const MoreProjectsPageWrapper();
        },
      ),
      GoRoute(
        path: AppRoutes.editProfile, 
        builder: (context, state) {
          return const EditProfilePageWrapper();
        },
      ),
      GoRoute(
        path: AppRoutes.projectDetails, 
        builder: (context, state) {
          return const ProjectDetailsPageWrapper();
        },
      ),
      GoRoute(
        path: AppRoutes.changePassword, 
        builder: (context, state) {
          return const ChangePasswordPageWrapper();
        },
      ),
      GoRoute(
        path: AppRoutes.taskDetails, 
        builder: (context, state) {
          return const TaskDetailsPageWrapper();
        },
      ),
      GoRoute(
        path: AppRoutes.viewNotifications,
        builder: (context, state) {
          return const ViewNotificationsPageWrapper();
        }
      ),
      GoRoute(
        path: AppRoutes.createProject,
        builder: (context, state) {
          return const CreateProjectPageWrapper();
        }
      ),
    ],
  );
}