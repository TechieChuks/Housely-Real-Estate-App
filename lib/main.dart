import 'package:flutter/material.dart';
import 'package:housely/features/forgot_password/presentation/screens/forgot_password_screen.dart';
import 'package:housely/features/login/presentation/login_screen.dart';
import 'package:housely/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:housely/features/signup/presentation/signup_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  final seenOnboarding = prefs.getBool('seenOnboarding') ?? false;
  runApp(MyApp(seenOnboarding: seenOnboarding));
}

class MyApp extends StatelessWidget {
  final bool seenOnboarding;
  const MyApp({super.key, required this.seenOnboarding});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Initial route
      initialRoute: seenOnboarding ? '/login' : '/onboarding',

      // Register all routes here
      routes: {
        '/onboarding': (context) => const OnboardingScreen(),
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignupScreen(),
        '/forgotpassword': (context) => ForgotPasswordScreen(),
      },
    );
  }
}
