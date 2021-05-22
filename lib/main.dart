import 'package:flutter/material.dart';
import 'package:healtho_ui_clone/ui/views/login/login_view.dart';
import 'package:healtho_ui_clone/ui/views/login/onboarding_view.dart';
import 'package:healtho_ui_clone/ui/views/login/splash_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Healtho',
      theme: ThemeData(fontFamily: 'Poppins'),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashView(),
        '/onboard': (context) => OnBoardingView(),
        'login': (context) => LoginView(),
      },
    );
  }
}
