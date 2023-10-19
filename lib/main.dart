import 'package:flutter/material.dart';

import 'LoginPage/signUp.dart';
import 'LoginPage/signIn.dart';
import 'Navigation/SavedPage/saveCard.dart';
import 'Navigation/HomePage/home.dart';
import 'Navigation/UserChatBox/chatHome.dart';
import 'Navigation/CartPage/cartPage.dart';
import 'splashScreen.dart';
import 'LoginPage/forgotPassword.dart';
import 'Navigation/HomePage/SearchPage/searchResults.dart';
import 'Navigation/HomePage/DetailScreen.dart';
import 'UserProfile/pointSystem.dart';
import 'Navigation/UserChatBox/chatPage.dart';
import 'Navigation/UserChatBox/chatHome.dart';
import 'Navigation/UserChatBox/utils/constants.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splashScreen',
      routes: {
        '/splashScreen': (context) => const SplashScreen(),
        '/signIn': (context) => const SigningInPage(),
        '/signUp': (context) => const SigningUpPage(),
        '/savedCard': (context) => const SavedPage(),
        '/cart': (context) => Cart_Items(newQty: 1),
        '/userHome': (context) => const Myhome(),
        '/chatHome': (context) => ChatHome(),
        '/forgotPassword': (context) => ForgotPassword(),
        '/searchResults': (context) => searchResults(),
        '/itemDetail': (context) => DetailScreen(),
        '/pointSystem': (context) => PointSystem(),
        '/chatHome': (context) => ChatHome(),
        '/chatPage': (context) => ChatPage()
      },
    ),
  );
}




