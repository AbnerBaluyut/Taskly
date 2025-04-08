import 'package:go_router/go_router.dart';

import '../../features/authentication/presentation/login/login_page.dart';
import '../../features/authentication/presentation/register/register_page.dart';
import '../../features/dashboard/screens/dashboard_page.dart';
import '../../features/home/screens/create_project/create_project_page.dart';
import '../../features/home/screens/more_projects/more_projects_page.dart';
import '../../features/home/screens/project_details/project_details_page.dart';
import '../../features/home/screens/task_details/task_details_page.dart';
import '../../features/home/screens/view_notifications/view_notifications_page.dart';
import '../../features/on_boarding/screens/on_boarding_page.dart';
import '../../features/profile/presentation/change_password/change_password_page.dart';
import '../../features/profile/presentation/edit_profile/edit_profile_page.dart';
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
        path: AppRoutes.dashboard, 
        builder: (context, state) {
          return const DashboardPage();
        },
      ),
      GoRoute(
        path: AppRoutes.moreProjects, 
        builder: (context, state) {
          return const MoreProjectsPage();
        },
      ),
      GoRoute(
        path: AppRoutes.editProfile, 
        builder: (context, state) {
          return const EditProfilePage();
        },
      ),
      GoRoute(
        path: AppRoutes.projectDetails, 
        builder: (context, state) {
          return const ProjectDetailsPage();
        },
      ),
      GoRoute(
        path: AppRoutes.changePassword, 
        builder: (context, state) {
          return const ChangePasswordPage();
        },
      ),
      GoRoute(
        path: AppRoutes.taskDetails, 
        builder: (context, state) {
          return const TaskDetailsPage();
        },
      ),
      GoRoute(
        path: AppRoutes.viewNotifications,
        builder: (context, state) {
          return const ViewNotificationsPage();
        }
      ),
      GoRoute(
        path: AppRoutes.createProject,
        builder: (context, state) {
          return const CreateProjectPage();
        }
      ),
    ],
  );
}