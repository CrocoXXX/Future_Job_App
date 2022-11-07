import 'dart:async';

import 'package:flutter/material.dart';
import 'package:future_job_app/pages/onboarding_page.dart';
import 'package:future_job_app/theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const OnBoardingPage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff4141A4),
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 89, vertical: 309),
          child: Column(
            children: [
              Image.asset(
                'assets/logo.png',
                width: 59,
                height: 76,
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                'FUTURE JOBS',
                style: splashStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
