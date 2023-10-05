import 'package:flutter/material.dart';
import 'signUp.dart';
import 'signIn.dart';
import 'user_pages/save_card.dart';
import 'user_pages/cart.dart';

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
     initialRoute: '/signIn',
    routes: {
      '/signIn': (context) => const SigningInPage(),
      '/signUp': (context) => const SigningUpPage(),
      '/savedCard': (context) => const SavedPage(),
      '/cart': (context) => const Cart(),
    }
  )
);





