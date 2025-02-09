import 'package:dash_board_ieee/features/Auth/presentation/pages/login_page.dart';
import 'package:dash_board_ieee/features/Auth/presentation/pages/signUp_page.dart';
import 'package:dash_board_ieee/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:go_router/go_router.dart';

class AppRoute {
  static const String onboardingView = '/';
  static const String loginView = '/login';
  static const String signupView = '/signup';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: onboardingView,
        builder: (context, state) => OnBoardingView(),
      ),
      GoRoute(
        path: loginView,
        builder: (context, state) => LoginPage(),
      ),
      GoRoute(
        path: signupView,
        builder: (context, state) => SignupPage(),
      ),
    ],
  );
}
