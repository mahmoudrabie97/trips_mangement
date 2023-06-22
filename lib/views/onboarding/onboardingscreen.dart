import 'package:drive_app/utilites/extentionhelper.dart';
import 'package:drive_app/views/login/loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:intro_screen_onboarding_flutter/intro_app.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({Key? key}) : super(key: key);
  final List<Introduction> listintro = [
    Introduction(
      imageUrl: 'assets/images/onboarding1.png',
      title: 'Request Ride ',
      subTitle: 'Request a ride to pick you up by the nearest driver',
      subTitleTextStyle: const TextStyle(fontSize: 12),
      titleTextStyle: const TextStyle(fontSize: 24),
    ),
    Introduction(
      imageUrl: 'assets/images/onboarding2.png',
      title: 'Confirm Your Driver ',
      subTitle:
          'You will be delivered to your destination by professional drivers',
      subTitleTextStyle: const TextStyle(fontSize: 12),
      titleTextStyle: const TextStyle(fontSize: 24),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroScreenOnboarding(
        introductionList: listintro,
        backgroudColor: Colors.white,
        foregroundColor: Colors.amber,
        skipTextStyle: const TextStyle(
            color: Colors.amber, fontWeight: FontWeight.w900, fontSize: 16),
        onTapSkipButton: () {
          context.pushrepacement(LoginScreen());
        },
      ),
    );
  }
}
