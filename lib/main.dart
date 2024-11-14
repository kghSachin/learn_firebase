import 'package:flutter/material.dart';
import 'package:learn_firebase3/features/authentication/view/register_page.dart';
import 'package:learn_firebase3/res/theme/app_theme.dart';

import 'features/authentication/view/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rating App',
      theme: AppTheme.myTheme,
      home: LoginPage(),
    );
  }
}
