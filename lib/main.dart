import 'package:flutter/material.dart';
import 'package:housely/features/login/presentation/onboarding_screen.dart';
import 'package:housely/features/onboarding/presentation/screens/onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Initial route
      initialRoute: '/onboarding',

      // Register all routes here
      routes: {
        '/onboarding': (context) => const OnboardingScreen(),
        '/login': (context) => LoginScreen(),
      },
    );
  }
}
