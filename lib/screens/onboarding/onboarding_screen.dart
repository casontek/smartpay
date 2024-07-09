
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smartpaymobile/screens/auth/sign_in_screen.dart';
import 'package:smartpaymobile/widgets/custom_button_widget.dart';
import 'package:smartpaymobile/widgets/text_button_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../services/sqlite_service.dart';

class OnBoardingScreen extends StatefulWidget {

  const OnBoardingScreen({super.key});

  @override
  State<StatefulWidget> createState() => _OnBoardingScreen();

}

class _OnBoardingScreen extends State<OnBoardingScreen> {
  final sqlService = SQLiteService();
  late PageController _pageController;
  int _currentPageIndex = 0;
  final _onBoardingImages = [
    'assets/images/onboarding_content_1.png',
    'assets/images/onboarding_content_2.png'
  ];
  final _onBoardingTitles = [
    'Finance app the safest and most trusted',
    'The fastest transaction process only here'
  ];
  final _onBoardingBody = [
    'Your finance work starts here. Our here to help you track and deal with speeding up your transactions.',
    'Get easy to pay all your bills with just a few steps. Paying your bills become fast and efficient.'
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPageIndex);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
            statusBarColor: Theme.of(context).colorScheme.surface,
            statusBarIconBrightness: Brightness.dark
        ));
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.all(24.0),
              child: textButtonWidget(
                  label: 'Skip',
                  context: context,
                  onClick: () => navigate()
              )
            ),
            Expanded(
                child: GestureDetector(
                  onHorizontalDragEnd: (detail) {
                    double velocity = detail.primaryVelocity ?? 0;
                    if(velocity < 0) {
                      nextPage(2);
                    }
                    else {
                      previousPage();
                    }
                  },
                  child: PageView.builder(
                      controller: _pageController,
                      itemCount: 2,
                      onPageChanged: (index) {
                        setState(() {
                          _currentPageIndex = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 44.0),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(_onBoardingImages[_currentPageIndex]),
                                  Padding(
                                      padding: const EdgeInsets.only(top: 46.0, bottom: 16.0),
                                      child: Text(
                                        _onBoardingTitles[_currentPageIndex],
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontFamily: 'SF Pro Display',
                                            fontWeight: FontWeight.w600,
                                            color: Theme.of(context).colorScheme.primary
                                        ),
                                        textAlign: TextAlign.center,
                                      )
                                  ),
                                  Text(
                                    _onBoardingBody[_currentPageIndex],
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'SF Pro Display',
                                        fontWeight: FontWeight.w400,
                                        color: Theme.of(context).colorScheme.onSurface
                                    ),
                                    textAlign: TextAlign.center,
                                  )
                                ]
                            )
                        );
                      }
                  ),
                )
            ),
            Padding(
                padding: const EdgeInsets.only(
                  top: 16.0,
                  left: 44.0,
                  right: 44.0,
                  bottom: 24.0
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(bottom: 34.0),
                        child: SmoothPageIndicator(
                            controller: _pageController,
                            effect: ExpandingDotsEffect(
                              activeDotColor: Theme.of(context).colorScheme.primary,
                              dotColor: const Color(0XFFE5E7EB),
                              dotHeight: 6.0,
                              dotWidth: 12.0
                            ),
                            count: 2
                        )
                    ),
                    customButtonWidget(
                        label: 'Get Started',
                        context: context,
                        onClick: () => navigate()
                    )
                  ]
                )
            )
          ],
        )
      ),
    );
  }

  void nextPage(int size) {
    if (_currentPageIndex < size) {
      _pageController.animateToPage(
        _currentPageIndex + 1,
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    }
  }

  void previousPage() {
    if (_currentPageIndex > 0) {
      _pageController.animateToPage(
        _currentPageIndex - 1,
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    }
  }

  Future<void> navigate() async {
    //catch onboarded information into db
    await sqlService.onBoarded(true);

    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => const SignInScreen())
    );
  }

}
