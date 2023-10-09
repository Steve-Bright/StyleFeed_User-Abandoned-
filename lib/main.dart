import 'package:flutter/material.dart';

import 'LoginPage/signUp.dart';
import 'LoginPage/signIn.dart';
import 'Navigation/SavedPage/saveCard.dart';
import 'Navigation/CartPage/cart.dart';
import 'Navigation/HomePage/home.dart';
import 'Navigation/UserChatBox/chatHome.dart';
import 'Navigation/CartPage/cartPage.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/signIn',
        routes: {
          '/signIn': (context) => const SigningInPage(),
          '/signUp': (context) => const SigningUpPage(),
          '/savedCard': (context) => const SavedPage(),
          '/cart': (context) => const Cart_Items(),
          '/userHome': (context) => const Myhome(),
          '/chatHome': (context) => ChatHome(),
        },
      ),
    );
