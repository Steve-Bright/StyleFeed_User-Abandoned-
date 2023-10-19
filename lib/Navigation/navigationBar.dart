import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';


class MyButtonNav extends StatelessWidget {
  const MyButtonNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: GNav(
          iconSize: 25,
          onTabChange: (index) {
            print(index);
          },
          color: Colors.black,
          activeColor: Colors.black,
          padding: EdgeInsets.all(20),
          tabs: [
            GButton(
                icon: Icons.home,
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/userHome');
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=> Myhome()));
                }),
            GButton(
                icon: Icons.favorite,
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/savedCard');
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=> SavedPage()));
                }),
            GButton(
                icon: Icons.shopping_cart,
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/cart');
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=> Cart_Items(newQty: 1)));
                }),
            GButton(
              icon: Icons.message,
              onPressed: (){
                Navigator.pushReplacementNamed(context, '/chatPage');
                // Navigator.push(context, MaterialPageRoute(builder: (context)=> ChatHome()));
              }
            ),
          ],
        ),
      ),
    );
  }
}
