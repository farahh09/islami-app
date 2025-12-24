import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami/core/app_colors.dart';
import 'package:islami/core/app_styles.dart';
import 'package:islami/core/cache_helper.dart';
import 'package:islami/screens/home/home_screen.dart';

class IntroScreen extends StatelessWidget {
  static const String routeName = "IntroScreen";

  IntroScreen({super.key});

  final List<PageViewModel> listPagesViewModel = [
    PageViewModel(
      titleWidget: Text("Welcome To Islami App", style: AppStyles.titleStyle),
      body: "",
      image: Image.asset("assets/images/intro1.png"),
    ),
    PageViewModel(
      titleWidget: Text("Welcome To Islami App", style: AppStyles.titleStyle),
      bodyWidget: Text(
        "We Are Very Excited To Have You In Our Community",
        textAlign: TextAlign.center,
        style: AppStyles.bodyStyle,
      ),
      image: Image.asset("assets/images/intro2.png"),
    ),
    PageViewModel(
      titleWidget: Text("Reading the Quran", style: AppStyles.titleStyle),
      bodyWidget: Text(
        "Read, and your Lord is the Most Generous",
        textAlign: TextAlign.center,
        style: AppStyles.bodyStyle,
      ),

      image: Image.asset("assets/images/intro3.png"),
    ),

    PageViewModel(
      titleWidget: Text("Bearish", style: AppStyles.titleStyle),

      bodyWidget: Text(
        "Praise the name of your Lord, the Most High",
        textAlign: TextAlign.center,
        style: AppStyles.bodyStyle,
      ),

      image: Image.asset("assets/images/intro4.png"),
    ),
    PageViewModel(
      titleWidget: Text("Holy Quran Radio", style: AppStyles.titleStyle),

      bodyWidget: Text(
        "You can listen to the Holy Quran Radio through the application for free and easily",
        style: AppStyles.bodyStyle,
        textAlign: TextAlign.center,
      ),

      image: Image.asset("assets/images/intro5.png"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      globalBackgroundColor: AppColors.black,
      bodyPadding: EdgeInsets.only(top: 266),
      globalHeader: Image.asset('assets/images/islami_top.png'),
      next: Text(
        "Next",
        style: TextStyle(
          color: AppColors.primary,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      showNextButton: true,

      back: Text(
        "Back",
        style: TextStyle(
          color: AppColors.primary,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      showBackButton: true,

      skip: Text(
        "Skip",
        style: TextStyle(
          color: AppColors.primary,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      showSkipButton: true,

      done: Text(
        "Done",
        style: TextStyle(
          color: AppColors.primary,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      pages: listPagesViewModel,
      dotsDecorator: DotsDecorator(
        activeColor: AppColors.primary,
        activeSize: Size(18, 7),
        activeShape: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        color: AppColors.grey,
      ),

      dotsFlex: 2,

      onDone: () async {
        await CacheHelper.saveBool(true);
        Navigator.pushNamed(context, HomeScreen.routeName);
      },
      onSkip: () async {
        await CacheHelper.saveBool(true);
        Navigator.pushNamed(context, HomeScreen.routeName);
      },
    );
  }
}
