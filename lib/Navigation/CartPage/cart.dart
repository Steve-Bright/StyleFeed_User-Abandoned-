import 'package:flutter/material.dart';
import 'assetPaths.dart';

import '../navigationBar.dart';

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




