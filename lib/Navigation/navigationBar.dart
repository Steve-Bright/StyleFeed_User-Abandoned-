import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyButtonNav extends StatelessWidget {
  const MyButtonNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 25
        ),
        child: GNav (
          iconSize: 25,
          onTabChange: (index){
            print(index);
          },
          color: Colors.black,
          activeColor: Colors.black,
          padding: EdgeInsets.all(20),
          tabs: [
            GButton(icon: Icons.home,),
            GButton(icon: Icons.favorite,),
            GButton(icon: Icons.cabin, onPressed: (){ Navigator.pushNamed(context, '/cart');}),
            GButton(icon: Icons.message, ),
          ],
        ),
      ),

    );
  }
}