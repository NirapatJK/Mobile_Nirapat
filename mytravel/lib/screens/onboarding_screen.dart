import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:mytravel/screens/home_screen.dart';
import 'package:mytravel/screens/sign_in_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IntroductionScreen(
          pages: [
            PageViewModel(
              title: "Camping",
              body: "Camping is a recreational activity that involves spending time outdoors, typically in natural surroundings, away from the comforts and conveniences of home.",
              image: buildImage('assets/images/screen-1.png'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: "Mountain",
              body: "A mountain is a large landform that rises prominently above its surroundings, typically having a peak or summit, steep slopes, and a significant elevation difference from the surrounding terrain.",
              image: buildImage('assets/images/screen-2.png'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: "Forest",
              body: "A forest is a large area of land covered primarily with trees, plants, and other vegetation. Forests are vital ecosystems that provide a habitat for a wide variety of plants, animals, and microorganisms.",
              image: buildImage('assets/images/screen-3.png'),
              decoration: getPageDecoration(),
              footer: ElevatedButton(
                onPressed: () => goToHome(context),
                child: const Text("Start Now"),
              ),
            ),
          ],
          done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
          onDone: () => goToHome(context),
          showSkipButton: true,
          skip: const Text("Skip"),
          next: const Icon(Icons.arrow_forward),
          dotsDecorator: getDotsDecorator(),
        ),
      ),
    );
  }

  void goToHome(BuildContext context) async {

    final prefs = await SharedPreferences.getInstance();

    prefs.setBool('ON_BOARDING', false);

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) =>  HomeScreen()),
    );
  }

  Widget buildImage(String path) => Center(child: Image.asset(path, width: 250));

  PageDecoration getPageDecoration() => const PageDecoration(
        titleTextStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        bodyTextStyle: TextStyle(fontSize: 16, color: Colors.grey),
        imagePadding: EdgeInsets.all(20),
      );

  DotsDecorator getDotsDecorator() => DotsDecorator(
        size: const Size(10, 10),
        color: Colors.grey,
        activeSize: const Size(22, 10),
        activeColor: Colors.blue,
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      );
}