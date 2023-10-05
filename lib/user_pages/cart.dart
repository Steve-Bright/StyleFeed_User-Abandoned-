import 'package:flutter/material.dart';
import 'package:quantity_input/quantity_input.dart';
import 'package:style_feed/user_pages/assetPaths.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back),
        //   onPressed: () {
        //
        //   },
        // ),
        actions: [
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: () {
              // Perform action
            },
          ),
        ],
      ),

      body: Stack(
        children: <Widget>[
          CartItems(),
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
            child: Container(
              color: Colors.blue,
              padding: EdgeInsets.all(16.0),
              width: 100.0,
              height: 80.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Total Price: \$100.00', // Replace with your total price logic
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Handle checkout action
                    },
                    child: Text('Checkout'),
                  ),
                ],
              ),
            )
          )
        ],
      ),
      bottomNavigationBar: MyButtonNav()
    );
  }
}

class CartItems extends StatefulWidget {
  const CartItems({super.key});

  @override
  State<CartItems> createState() => _CartItemsState();
}

class _CartItemsState extends State<CartItems> {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: assetPaths.length,
        itemBuilder: (BuildContext context, int index){
          final assetPath = assetPaths[index];
          return Padding(
              padding: EdgeInsets.all(8.0),
              child:
                assetPath,
                //fit: BoxFit.cover, //Adjust image fit

          );
        }
    );
  }
}

class cartItem extends StatelessWidget {
  const cartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      child: Row(
        children: <Widget>[
          Image(
            image: AssetImage('assets/items/lacoste.jpg')
          ),
        ]
      )
    );
  }
}



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


