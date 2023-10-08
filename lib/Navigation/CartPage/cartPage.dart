import 'package:flutter/material.dart';
import 'cartItemCard.dart';
import '../navigationBar.dart';

class Cart_Items extends StatefulWidget {
  const Cart_Items({super.key});

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
      cartPrices.add(cartPrices.length+1);
    });
  }

  void removeCurrentItem(int item_index){
    setState((){
      cartItems.removeAt(item_index);
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
                    total = total + 25*2;
                    return CartItemCard(
                      cartIndex: cartItems[index],
                      imageString: 'assets/clothing.jpg',
                      productName: 'Product Name',
                      price: 25,
                      initialQuantity: 2,
                      onIncrease: () {
// Handle increase quantity
                      },
                      onDecrease: () {
// Handle decrease quantity
                      },
                      onRemove: () {
                        removeCurrentItem(index);
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
                        'Discount: 4000',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      Text(
                        ' Total: $total',
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