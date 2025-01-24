import 'package:dash_board_ieee/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:go_router/go_router.dart';

class AppRoute {
  static const String onboardingView = '/';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: onboardingView,
        builder: (context, state) => OnBoardingView(),
      ),
    ],
  );
}
