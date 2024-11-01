import 'package:flutter/material.dart';
import 'package:learn_firebase3/constant/text.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  final text = "Time to be at the center of events.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(
          left: 30,
          right: 30,
          top: 91,
        ),
        child: Column(
          children: [
            Text(
              text,
              style: AppTextStyles.headline,
            ),
            const SizedBox(height: 100),
            Center(
              child: Image.asset(
                "images/inworldLogo.png",
                height: 165,
              ),
            ),
          ],
        ),
      )),
    );
  }
}
