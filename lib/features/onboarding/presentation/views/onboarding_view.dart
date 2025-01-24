import 'package:dash_board_ieee/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../../../../generated/assets.dart';
import '../widgets/action_buttons_widget.dart';
import '../widgets/navigation_controls.dart';
import '../widgets/onboarding_page_widget.dart';

class OnBoardingView extends StatefulWidget {
  @override
  _OnBoardingViewState createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final GlobalKey<IntroductionScreenState> introKey =
      GlobalKey<IntroductionScreenState>();
  int currentPage = 0;

  List<PageViewModel> getPages() {
    return [
      OnboardingPageWidget(
        title: 'Empower Your Journey with IEEE Helwan',
        body:
            'Join a thriving community of learners, innovators, and leaders. Discover opportunities, gain knowledge, and contribute to impactful projects.',
        imagePath: Assets.images1,
      ).toPageViewModel(context),
      OnboardingPageWidget(
        title: 'Be Part of the Team That Fits You',
        body:
            'Volunteers join committees, participate in sessions, complete tasks, and access resources to enhance their skills.',
        imagePath: Assets.images2,
      ).toPageViewModel(context),
      OnboardingPageWidget(
        title: 'Be Part of the Team That Fits You',
        body:
            'Admins organize events, manage participants, monitor progress, and oversee committees to ensure smooth project execution.',
        imagePath: Assets.images3,
      ).toPageViewModel(context),
      OnboardingPageWidget(
        title: 'Stay Organized and Productive',
        body:
            'Explore your chapters, stay on top of sessions, and complete tasks efficiently. Manage your journey with simple tools and a user-friendly interface.',
        imagePath: Assets.images4,
      ).toPageViewModel(context),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 188, left: 24, right: 24),
            child: IntroductionScreen(
              globalBackgroundColor: Colors.white,
              key: introKey,
              pages: getPages(),
              dotsDecorator: const DotsDecorator(
                  color: Colors.transparent, activeColor: Colors.transparent),
              showDoneButton: false,
              showSkipButton: false,
              showNextButton: false,
              onChange: (page) {
                setState(() {
                  currentPage = page;
                });
              },
              onDone: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Container()));
              },
            ),
          ),
          NavigationControls(
            currentPage: currentPage,
            onBackPressed: () => introKey.currentState?.previous(),
            onSkipPressed: () =>
                introKey.currentState?.animateScroll(getPages().length - 1),
            onNextPressed: () => introKey.currentState?.next(),
          ),
          Positioned(
            bottom: 80,
            left: 93,
            right: 93,
            child: ActionButtonsWidget(
              currentPage: currentPage,
              totalPages: getPages().length,
              onSignInPressed: () {},
              onSignUpPressed: () {},
              onNextPressed: () => introKey.currentState?.next(),
            ),
          ),
        ],
      ),
    );
  }
}
