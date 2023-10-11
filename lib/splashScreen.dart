import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'LoginPage/signIn.dart';
import 'Navigation/HomePage/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    _navigateToAnother();
  }

  _navigateToAnother() async{
    await Future.delayed(Duration(milliseconds: 2000), (){});
    Navigator.pushReplacementNamed(context, '/signIn');
  }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: Center(
    //     child: Container(
    //       child: Image.asset('assets/logo.png', width: 100, height: 100),
    //     )
    //   )
    // );
    return AnimatedSplashScreen(
      duration: 3000,
      splash: 'assets/logo.png',
      // splash: Center(
      //     child: Container(
      //       child: Image.asset('assets/logo.png', width: 100, height: 100),
      //     )
      // ),
      nextScreen: SigningInPage(),
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}
