import 'package:flutter/material.dart';
import 'cartItemCard.dart';
import '../navigationBar.dart';

class Cart_Items extends StatefulWidget {
  int newQty;

  Cart_Items({
    required this.newQty
  });

  @override
  State<Cart_Items> createState() => _Cart_ItemsState();
}

class _Cart_ItemsState extends State<Cart_Items> {
  int discount = 0;
  int total = 0;

  List<int> cartItems = [];
  List<int> cartPrices = [];
  List<int> cartQty = [];

  void addNewItem(){
    setState(() {
      cartItems.add(cartItems.length + 1);
      cartPrices.add(2500);
      cartQty.add(widget.newQty);
    });
  }

  void removeCurrentItem(int item_index){
    setState((){
      cartItems.removeAt(item_index);
    });
  }

  void updateCartQty(int updatedItemIndex, int updatedQty) {
    setState(() {
      // Find the index of the item you want to update and update cartQty
      final item_index = cartItems.indexOf(updatedItemIndex);
      if (item_index != -1) {
        cartQty[item_index] = updatedQty;
      }
    });
  }

  void removeAllItems(){
    setState((){
      cartItems.clear();
      total = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Cart Page'),
            actions: [
              IconButton(
                  icon: Icon(Icons.add),
                  onPressed: (){
                    addNewItem();
                  }
              ),
              IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: (){
                    removeAllItems();
                  }
              )
            ]
        ),
        body: Column(
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  itemCount: cartItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    total = total + ((cartPrices[index]*cartQty[index]));
                    return CartItemCard(
                      cartIndex: cartItems[index],
                      imageString: 'assets/clothing.jpg',
                      productName: 'Product Name',
                      price: cartPrices[index],
                      onRemove: () {
                        removeCurrentItem(index);
                      },
                      onQuantityChanged: (updatedQty) {
                        // Call the updateCartQty callback function with the updated quantity.
                        // You need to pass the index of the item being updated and the updated quantity.
                        updateCartQty(index, updatedQty);
                      },
                    );
                  },

                ),

              ),
              Container(
                width: double.infinity,
                height: 100,
                color: Colors.blue,
                child: Padding(
                  padding: EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        'Discount: 500',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      Text(
                        ' Total: ${total-500}',
                        style: TextStyle(color: Colors.white, fontSize: 18)
                      ),
                      Padding(
                        padding: EdgeInsets.all(5),
                          child: TextButton(
                            onPressed: (){},
                            child: Container(
                              width: 100,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.black,
                              ),
                              child: Center(child: Text('Check Out', style: TextStyle(color: Colors.white))),
                            ),
                          ),
                      )
                    ],
                    ),
                ),
              )
            ]
        ),
        bottomNavigationBar: MyButtonNav(),
    );
  }
}