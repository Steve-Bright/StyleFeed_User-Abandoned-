import 'package:flutter/material.dart';
import 'package:style_feed/ProductCradDetail/productDetail.dart';
import 'LoginPage/signUp.dart';
import 'LoginPage/signIn.dart';
import 'Navigation/SavedPage/saveCard.dart';
import 'Navigation/CartPage/cart.dart';

void main() => runApp(MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/productDetail',
        routes: {
          '/productDetail': (context) => DetailCrad(),
          '/signIn': (context) => const SigningInPage(),
          '/signUp': (context) => const SigningUpPage(),
          '/savedCard': (context) => const SavedPage(),
          '/cart': (context) => const Cart(),
        }));
