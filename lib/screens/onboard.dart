import 'package:flutter/material.dart';
import 'package:intro_screen_onboarding_flutter/circle_progress_bar.dart';
import 'package:intro_screen_onboarding_flutter/intro_app.dart';
import 'package:intro_screen_onboarding_flutter/introduction.dart';
import 'package:intro_screen_onboarding_flutter/introscreenonboarding.dart';

import 'index.dart';

class Onboard extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        backgroundColor: Colors.white,
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TestScreen(),
    );
  }
}

class TestScreen extends StatelessWidget {
  final List<Introduction> list = [
    Introduction(
      title: 'Buy & Sell',
      subTitle: 'Browse the menu and order directly from the application',
      imageUrl: 'assets/images/facebook.png',
    ),
    Introduction(
      title: 'Delivery',
      subTitle: 'Your order will be immediately collected and',
      imageUrl: 'assets/images/SnapPOS.png',
    ),
    Introduction(
      title: 'Receive Money',
      subTitle: 'Pick up delivery at your door and enjoy groceries',
      imageUrl: 'assets/images/facebook.png',
    ),
    Introduction(
      title: 'Finish',
      subTitle: 'Browse the menu and order directly from the application',
      imageUrl: 'assets/images/SnapPOS.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return IntroScreenOnboarding(
      introductionList: list,
      onTapSkipButton: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Index(),
          ), //MaterialPageRoute
        );
      },
    );
  }
}