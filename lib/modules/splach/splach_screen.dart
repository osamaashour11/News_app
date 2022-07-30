import 'package:flutter/material.dart';
import 'package:news_app/layout/news_layout/news_layout.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: const NewsLayout(),
      duration: 11000,
      imageSrc: 'assets/images/mmm.gif',
      imageSize: 200,
      backgroundColor: Colors.white,
      text: 'News App',
      textStyle: const TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
