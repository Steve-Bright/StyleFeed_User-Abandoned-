
import 'package:flutter/material.dart';
import 'cartPage.dart';

class CartItemCard extends StatefulWidget {
  final int cartIndex;
  final String imageString;
  final String productName;
  final int price;
  final VoidCallback onRemove;
  final void Function(int) onQuantityChanged;

  CartItemCard({
    required this.cartIndex,
    required this.imageString,
    required this.productName,
    required this.price,
    required this.onRemove,
    required this.onQuantityChanged,
  });

  @override
  _CartItemCardState createState() => _CartItemCardState();
}

class _CartItemCardState extends State<CartItemCard> {
  int quantity = 1;

  @override
  void initState() {
    super.initState();
  }

  void increaseValue(){
    quantity ++;
    widget.onQuantityChanged(quantity);
  }

  void decreaseValue(){
    quantity --;
    widget.onQuantityChanged(quantity);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Card(
        margin: EdgeInsets.all(16.0),
        elevation: 4.0,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            children: [
              Text('${widget.cartIndex}'),
              Padding(
                padding: EdgeInsets.all(15),
                child: Image.asset(
                  widget.imageString,
                  width: 150,
                  height: 150,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.productName,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    '${widget.price}',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () {
                              setState(() {
                                if (quantity > 1) {
                                  decreaseValue();
                                }
                              });
                            },
                          ),
                          Text(quantity.toString()),
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {
                              setState(() {
                                increaseValue();
                              });
                            },
                          ),
                        ],
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        color: Colors.red,
                        onPressed: () {
                          widget.onRemove();
                        },
                      ),
                    ],
                  ),
                  Text('${quantity*widget.price}',
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.green
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
