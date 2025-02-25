import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mytravel/screens/onboarding_screen.dart';
import 'package:mytravel/screens/sign_in_screen.dart';
import 'package:mytravel/screens/sign_up_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/home_screen.dart'; 

bool show = true;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  show = prefs.getBool('ON_BOARDING') ?? true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme: GoogleFonts.lexendTextTheme()),
      title: 'My travel 1.0',
      home: show ? const OnBoardingScreen() : HomeScreen(),
      //home: show ? const OnBoardingScreen() : SignInPage(),
      //home: SignInPage(),
    );
  }
}